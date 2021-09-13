import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final String labelText;
  final TextStyle? customStyle;
  final defaultStyle = TextStyle(fontSize: 24.0, color: Colors.white);

  Label(this.labelText, {Key? key, this.customStyle}) : super(key: key);

  final labelLeftPadding = 8.0;

  @override
  Widget build(BuildContext context) {
    return buildLabelWithLeftPadding(labelText);
  }

  Text buildLabel(String userNameTxt) {
    return Text(
      userNameTxt,
      textAlign: TextAlign.left,
      style: customStyle ?? defaultStyle,
    );
  }

  Padding buildLabelWithLeftPadding(String userNameTxt) {
    return Padding(
      child: buildLabel(userNameTxt),
      padding: EdgeInsets.only(left: labelLeftPadding),
    );
  }
}
