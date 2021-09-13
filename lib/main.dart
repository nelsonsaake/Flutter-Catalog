import 'package:catalog/views/catalog_view/catalog_view.dart';
import 'package:catalog/views/login_view/login_view.dart';
import 'package:catalog/views/layout/layout.dart';
import 'package:catalog/constants/fonts.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final title = 'Catalog';

  ThemeData theme(BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.blueGrey,
      fontFamily: Fonts.josefinSlab,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: theme(context),
      debugShowCheckedModeBanner: false,
      home: Layout(),
    );
  }
}
