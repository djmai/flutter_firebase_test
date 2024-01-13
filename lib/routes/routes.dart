import 'package:flutter/material.dart';
import 'package:firebase_test/pages/pages.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    MyHomePage.routerName: (context) => MyHomePage(title: 'Firebase Test'),
    EmpresasPage.routerName: (context) => EmpresasPage(),
  };
}
