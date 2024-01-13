import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/models.dart';
import '../../services/services.dart';

class EmpresasPage extends StatefulWidget {
  static String routerName = 'empresas';
  EmpresasPage({super.key});

  @override
  State<EmpresasPage> createState() => _EmpresasPageState();
}

class _EmpresasPageState extends State<EmpresasPage> {
  final EmpresasController empresasController = EmpresasController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Empresas'),
      ),
      body: StreamBuilder(
        stream: empresasController.getStreamAll('empresas-mectel'),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (!snapshot.hasData) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('No hay empresas para mostrar'),
                  Text('Puede agregar nuevas empresas usando el botón de bajo'),
                ],
              ),
            );
          }

          List<DocumentSnapshot> empresas = snapshot.data!.docs;

          return ListView.builder(
            itemCount: empresas.length,
            itemBuilder: (context, index) {
              // var empresa = empresas[index];
              Empresa empresa = Empresa.fromDocumentSnapshot(empresas[index]);

              return Card(
                elevation: 5,
                margin: const EdgeInsets.all(10),
                color: Colors.white,
                surfaceTintColor: Colors.white,
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: ListTile(
                  leading: const Icon(Icons.hotel),
                  title: Text(empresa.razonSocial),
                  subtitle: Text(empresa.rfc),
                  trailing: const Icon(Icons.arrow_forward),
                  contentPadding: const EdgeInsets.all(10),
                  onTap: () {},
                ),
              );
            },
          );
        },
      ),
    );
  }
}
