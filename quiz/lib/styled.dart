import 'package:flutter/material.dart';

class Styled extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;

  const Styled({
    super.key,
    required this.text,
    this.size = 16,
    this.fontWeight = FontWeight.bold,
    this.color = Colors.white,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
    );
  }
}
