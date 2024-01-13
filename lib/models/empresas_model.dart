import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Empresas {
  final List<Empresa> empresa;

  Empresas({
    required this.empresa,
  });

  Empresas copyWith({
    List<Empresa>? empresa,
  }) =>
      Empresas(
        empresa: empresa ?? this.empresa,
      );

  factory Empresas.fromRawJson(String str) =>
      Empresas.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Empresas.fromJson(Map<String, dynamic> json) => Empresas(
        empresa:
            List<Empresa>.from(json["empresa"].map((x) => Empresa.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "empresa": List<dynamic>.from(empresa.map((x) => x.toJson())),
      };
}

class Empresa {
  final String uid;
  final String razonSocial;
  final String nombreEmpresa;
  final String? nombreRepresentante;
  final String rfc;
  final int? fechaInicio;
  final List<Contacto>? contactos;
  final String? imgUrl;
  final String? domicilio;
  final String? lat;
  final String? lng;
  final List<CorreosElectronico>? correosElectronico;
  final List<RedesSociale>? redesSociales;
  final int? numeroEmpleados;

  Empresa({
    required this.uid,
    required this.razonSocial,
    required this.nombreEmpresa,
    this.nombreRepresentante,
    required this.rfc,
    this.fechaInicio,
    this.contactos,
    this.imgUrl,
    this.domicilio,
    this.lat,
    this.lng,
    this.correosElectronico,
    this.redesSociales,
    this.numeroEmpleados,
  });

  Empresa copyWith({
    String? uid,
    String? razonSocial,
    String? nombreEmpresa,
    String? nombreRepresentante,
    String? rfc,
    int? fechaInicio,
    List<Contacto>? contactos,
    String? imgUrl,
    String? domicilio,
    String? lat,
    String? lng,
    List<CorreosElectronico>? correosElectronico,
    List<RedesSociale>? redesSociales,
    int? numeroEmpleados,
  }) =>
      Empresa(
        uid: uid ?? this.uid,
        razonSocial: razonSocial ?? this.razonSocial,
        nombreEmpresa: nombreEmpresa ?? this.nombreEmpresa,
        nombreRepresentante: nombreRepresentante ?? this.nombreRepresentante,
        rfc: rfc ?? this.rfc,
        fechaInicio: fechaInicio ?? this.fechaInicio,
        contactos: contactos ?? this.contactos,
        imgUrl: imgUrl ?? this.imgUrl,
        domicilio: domicilio ?? this.domicilio,
        lat: lat ?? this.lat,
        lng: lng ?? this.lng,
        correosElectronico: correosElectronico ?? this.correosElectronico,
        redesSociales: redesSociales ?? this.redesSociales,
        numeroEmpleados: numeroEmpleados ?? this.numeroEmpleados,
      );

  factory Empresa.fromRawJson(String str) => Empresa.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Empresa.fromJson(Map<String, dynamic> json) => Empresa(
        uid: json["uid"],
        razonSocial: json["razon_social"],
        nombreEmpresa: json["nombre_empresa"],
        nombreRepresentante: json["nombre_representante"],
        rfc: json["rfc"],
        fechaInicio: json["fecha_inicio"],
        contactos: List<Contacto>.from(
            json["contactos"].map((x) => Contacto.fromJson(x))),
        imgUrl: json["imgURL"],
        domicilio: json["domicilio"],
        lat: json["lat"],
        lng: json["lng"],
        correosElectronico: List<CorreosElectronico>.from(
            json["correos_electronico"]
                .map((x) => CorreosElectronico.fromJson(x))),
        redesSociales: List<RedesSociale>.from(
            json["redes_sociales"].map((x) => RedesSociale.fromJson(x))),
        numeroEmpleados: json["numero_empleados"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "razon_social": razonSocial,
        "nombre_empresa": nombreEmpresa,
        "nombre_representante": nombreRepresentante,
        "rfc": rfc,
        "fecha_inicio": fechaInicio,
        "contactos": List<dynamic>.from(contactos!.map((x) => x.toJson())),
        "imgURL": imgUrl,
        "domicilio": domicilio,
        "lat": lat,
        "lng": lng,
        "correos_electronico":
            List<dynamic>.from(correosElectronico!.map((x) => x.toJson())),
        "redes_sociales":
            List<dynamic>.from(redesSociales!.map((x) => x.toJson())),
        "numero_empleados": numeroEmpleados,
      };

  // Método de fábrica para crear una instancia de Empresa desde un DocumentSnapshot
  factory Empresa.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return Empresa(
      uid: snapshot.id,
      razonSocial: data["razonSocial"],
      nombreEmpresa: data["nombreEmpresa"],
      nombreRepresentante: data["nombreRepresentante"],
      rfc: data["rfc"],
    );
  }
}

class Contacto {
  final int numero;
  final String nombre;
  final String titulo;

  Contacto({
    required this.numero,
    required this.nombre,
    required this.titulo,
  });

  Contacto copyWith({
    int? numero,
    String? nombre,
    String? titulo,
  }) =>
      Contacto(
        numero: numero ?? this.numero,
        nombre: nombre ?? this.nombre,
        titulo: titulo ?? this.titulo,
      );

  factory Contacto.fromRawJson(String str) =>
      Contacto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Contacto.fromJson(Map<String, dynamic> json) => Contacto(
        numero: json["numero"],
        nombre: json["nombre"],
        titulo: json["titulo"],
      );

  Map<String, dynamic> toJson() => {
        "numero": numero,
        "nombre": nombre,
        "titulo": titulo,
      };
}

class CorreosElectronico {
  final String direccion;
  final String nombre;

  CorreosElectronico({
    required this.direccion,
    required this.nombre,
  });

  CorreosElectronico copyWith({
    String? direccion,
    String? nombre,
  }) =>
      CorreosElectronico(
        direccion: direccion ?? this.direccion,
        nombre: nombre ?? this.nombre,
      );

  factory CorreosElectronico.fromRawJson(String str) =>
      CorreosElectronico.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CorreosElectronico.fromJson(Map<String, dynamic> json) =>
      CorreosElectronico(
        direccion: json["direccion"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toJson() => {
        "direccion": direccion,
        "nombre": nombre,
      };
}

class RedesSociale {
  final String nombre;
  final String url;

  RedesSociale({
    required this.nombre,
    required this.url,
  });

  RedesSociale copyWith({
    String? nombre,
    String? url,
  }) =>
      RedesSociale(
        nombre: nombre ?? this.nombre,
        url: url ?? this.url,
      );

  factory RedesSociale.fromRawJson(String str) =>
      RedesSociale.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RedesSociale.fromJson(Map<String, dynamic> json) => RedesSociale(
        nombre: json["nombre"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "url": url,
      };
}
