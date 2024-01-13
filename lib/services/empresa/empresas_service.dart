import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EmpresasController {
  FirebaseFirestore db = FirebaseFirestore.instance;

  getStreamAll(String collection) {
    return FirebaseFirestore.instance.collection(collection).snapshots();
  }

  Future<List> getEmpresasAll() async {
    List users = [];
    CollectionReference collectionReference = db.collection('empresas-mectel');
    QuerySnapshot querySnapshot = await collectionReference.get();
    querySnapshot.docs.forEach((element) {
      final Map<String, dynamic> data = element.data() as Map<String, dynamic>;
      final user = {
        'uid': element.id,
        'razonSocial': data['razonSocial'],
        'nombreEmpresa': data['nombreEmpresa'],
        'rfc': data['rfc'],
      };
      users.add(user);
    });
    return users;
  }
}
