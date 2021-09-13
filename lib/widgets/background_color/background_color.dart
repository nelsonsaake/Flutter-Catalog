import 'package:flutter/material.dart';

class BackgroundColor extends StatelessWidget {
  final Color color;
  final Widget child;

  const BackgroundColor({required this.color, required this.child, required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color),
      child: child,
    );
  }
}
