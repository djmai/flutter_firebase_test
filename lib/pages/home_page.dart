import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../pages/pages.dart';
import '../services/auth/auth_firebase.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _user?.displayName != null
                ? Text('Hola ${_user?.displayName}, Bienvenido')
                : const Text('Inicie sesión'),
            _user?.email != null ? Text('${_user?.email}') : const Text(''),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, EmpresasPage.routerName),
        tooltip: 'Empresas',
        child: const Icon(Icons.holiday_village),
      ),
    );
  }
}
