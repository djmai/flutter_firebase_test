import 'package:firebase_test/pages/home_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    MyHomePage.routerName: (context) => MyHomePage(title: 'Firebase Test'),
  };
}
