import 'package:flutter/material.dart';

final _icons = {
  'accessibility': Icons.accessibility,
  'add_alert': Icons.add_alert,
  'donut_large': Icons.donut_large,
  'folder_open': Icons.folder_open,
  'hotel': Icons.hotel,
  'input': Icons.input,
  'insert_emoticon_outlined': Icons.insert_emoticon_outlined,
  'insert_emoticon_sharp': Icons.insert_emoticon_sharp,
  'insert_emoticon': Icons.insert_emoticon,
  'list': Icons.list,
  'slideshow': Icons.slideshow,
};

Icon getIcon(String nombreIcono) {
  return Icon(_icons[nombreIcono]);
}
