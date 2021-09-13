import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  final Widget? child;
  final double diameter;
  final double blurRadius;

  Circle({this.child, this.diameter = 300.0, this.blurRadius = 2.0});

  BoxShadow shadow() {
    return BoxShadow(
      color: Colors.grey,
      blurRadius: blurRadius,
    );
  }

  BoxDecoration decoration() {
    return BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.white,
      boxShadow: [shadow()],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter,
      height: diameter,
      decoration: decoration(),
      child: Center(child: child),
    );
  }
}
