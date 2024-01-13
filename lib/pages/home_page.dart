import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/models.dart';
import '../pages/pages.dart';
import '../utils/utils.dart';
import '../services/services.dart';

class MyHomePage extends StatefulWidget {
  static String routerName = 'home';

  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Instanciamos el servicio de Authenticación para Firebase
  final AuthFirebase _auth = AuthFirebase();

  @override
  Widget build(BuildContext context) {
    // Obtener los datos del usuario en caso de que existan
    User? _user = _auth.user;

    final MenuService _menuService = MenuService();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
        actions: [
          _user?.getIdToken() == null
              ? IconButton(
                  onPressed: () async {
                    await _auth.signInWithEmailAndPassword(
                      'barry.allen@example.com',
                      'SuperSecretPassword!',
                    );
                    setState(() {});
                    print(_user);
                  },
                  icon: const Icon(Icons.login),
                )
              : IconButton(
                  onPressed: () async {
                    await _auth.signOut();
                    setState(() {});
                  },
                  icon: const Icon(Icons.logout),
                ),
        ],
      ),
      body: StreamBuilder(
        stream: _menuService.getItemsMenu('menu-mectel'),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          if (!snapshot.hasData) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Upps!, al parecer no tienes permisos para navegar'),
                ],
              ),
            );
          }

          List<DocumentSnapshot> menuItems = snapshot.data!.docs;
          return ListView.builder(
            itemCount: menuItems.length,
            itemBuilder: (context, index) {
              // var item = menuItems[index];
              Menu item = Menu.fromDocumentSnapshot(menuItems[index]);

              // print(item.toJson());

              if (item.route != '' && item.route != null) {
                return ListTile(
                  leading: item.icon != '' ? getIcon(item.icon!) : null,
                  title: Text(item.name),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  contentPadding: const EdgeInsets.all(10),
                  onTap: () => item.route != '' && item.route != null
                      ? Navigator.pushNamed(context, item.route!)
                      : null,
                );
              }
            },
          );
        },
      ),
    );
  }
}
