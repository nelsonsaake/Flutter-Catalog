import 'package:flutter/material.dart';

class ScaffoldService {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void _safeShowSnackBarMessage(String msg) {
    if (scaffoldKey.currentState == null) return;

    final context = scaffoldKey.currentState!.context;

    final snackBar = SnackBar(content: Text(msg));

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showSnackBarMessage(String msg) {
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) => _safeShowSnackBarMessage(msg),
    );
  }
}
