import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  final String src;
  final double opacity;
  final Widget child;

  const BackgroundImage({required this.src, required this.child, this.opacity = 1.0, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(src),
          fit: BoxFit.cover,
          colorFilter: new ColorFilter.mode(
            Colors.black.withOpacity(opacity),
            BlendMode.dstATop,
          ),
        ),
      ),
      child: child,
    );
  }
}
