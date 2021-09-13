import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;

  final Function()? onPressed;

  final TextStyle? customStyle;

  final defaultStyle = TextStyle(fontSize: 24.0, color: Colors.white);

  final backgroundColor = Color.fromRGBO(109, 152, 113, 1.0);

  final padding = EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0);

  final borderWidth = 2.0, borderRadius = 10.0, borderColor = Colors.black54;

  Button({Key? key, this.text = "", this.onPressed, this.customStyle}) : super(key: key);

  RoundedRectangleBorder buildRoundedBorder() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      side: BorderSide(color: borderColor, width: borderWidth),
    );
  }

  ButtonStyle buildButtonStyle() {
    return TextButton.styleFrom(
      backgroundColor: backgroundColor,
      shape: buildRoundedBorder(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Padding(
        padding: padding,
        child: Text(text, style: customStyle ?? defaultStyle),
      ),
      style: buildButtonStyle(),
    );
  }
}
