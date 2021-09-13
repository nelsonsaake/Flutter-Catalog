import 'package:flutter/material.dart';

class FormTitle extends StatelessWidget {
  final String title;
  final TextStyle? customStyle;
  final defaultStyle = TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold, color: Colors.white);

  FormTitle({Key? key, required this.title, this.customStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: customStyle ?? defaultStyle,
    );
  }
}
