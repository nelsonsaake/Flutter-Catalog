import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextInput extends StatefulWidget {
  final TextEditingController? controller;
  final bool isPassword;
  bool obscureText;

  final TextStyle? customStyle;
  final defaultStyle = TextStyle(fontSize: 24.0, color: Colors.white);

  final width = 300.0;

  TextInput({
    Key? key,
    this.controller,
    this.customStyle,
    this.isPassword = false,
    this.obscureText = false,
  }) : super(key: key){
    obscureText = isPassword;
  }

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  final enableFillColor = true;
  final fillColor = Colors.white;

  final borderWidth = 2.0;
  final borderRadius = 10.0;
  final borderGapPadding = 1.0;
  final borderColor = Colors.black54;

  String text() {
    return widget.controller?.text ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: buildInput(),
    );
  }

  OutlineInputBorder buildInputBorder() {
    return OutlineInputBorder(
      gapPadding: borderGapPadding,
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(color: borderColor, width: borderWidth),
    );
  }

  Widget buildShowPasswordIcon() {
    void onPressed() {
      setState(() {
        widget.obscureText = !(widget.obscureText);
      });
    }
    return IconButton(
      icon: Icon(Icons.remove_red_eye),
      onPressed: () => onPressed(),
    );
  }

  InputDecoration buildInputDecoration() {
    return InputDecoration(
      filled: enableFillColor,
      fillColor: fillColor,
      border: buildInputBorder(),
      enabledBorder: buildInputBorder(),
      focusedBorder: buildInputBorder(),
      suffixIcon: widget.isPassword ? buildShowPasswordIcon() : null,
    );
  }

  TextFormField buildInput() {
    return TextFormField(
      style: widget.customStyle ?? widget.defaultStyle,
      controller: widget.controller,
      decoration: buildInputDecoration(),
      obscureText: widget.obscureText && widget.isPassword,
    );
  }
}
