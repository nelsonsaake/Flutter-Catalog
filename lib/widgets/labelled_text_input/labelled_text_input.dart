import 'package:flutter/material.dart';
import 'label.dart';
import 'text_input.dart';

class LabelledTextInput extends StatelessWidget {
  final String labelText;

  final TextEditingController? inputController;

  final bool isPassword;

  final TextStyle? labelStyle;

  final TextStyle? inputStyle;

  LabelledTextInput({
    Key? key,
    required this.labelText,
    this.inputController,
    this.isPassword = false,
    this.labelStyle,
    this.inputStyle,
  }) : super(key: key);

  final verticalSpacing = 16.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Label(labelText, customStyle: labelStyle),
        SizedBox(height: verticalSpacing),
        TextInput(controller: inputController, isPassword: this.isPassword, customStyle: inputStyle),
      ],
    );
  }
}
