import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Menus {
  final List<Menu> menu;

  Menus({
    required this.menu,
  });

  Menus copyWith({
    List<Menu>? menu,
  }) =>
      Menus(
        menu: menu ?? this.menu,
      );

  factory Menus.fromRawJson(String str) => Menus.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
        menu: List<Menu>.from(json["menu"].map((x) => Menu.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "menu": List<dynamic>.from(menu.map((x) => x.toJson())),
      };
}

class Menu {
  final String? uid;
  final String name;
  final String? icon;
  final String? route;

  Menu({
    this.uid,
    this.icon,
    required this.name,
    this.route,
  });

  Menu copyWith({
    String? icon,
    String? name,
    String? route,
    String? uid,
  }) =>
      Menu(
        icon: icon ?? this.icon,
        name: name ?? this.name,
        route: route ?? this.route,
        uid: uid ?? this.uid,
      );

  factory Menu.fromRawJson(String str) => Menu.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        icon: json["icon"],
        name: json["name"],
        route: json["route"],
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "icon": icon,
        "name": name,
        "route": route,
        "uid": uid,
      };

  // Método de fábrica para crear una instancia de Empresa desde un DocumentSnapshot
  factory Menu.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return Menu(
      uid: snapshot.id,
      name: data["name"],
      route: data["route"],
      icon: data["icon"],
    );
  }
}
