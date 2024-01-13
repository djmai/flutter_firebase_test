import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MenuService {
  FirebaseFirestore db = FirebaseFirestore.instance;

  getItemsMenu(String collection) {
    return db
        .collection(collection)
        .orderBy('name', descending: false)
        .snapshots();
  }
}
