

import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  String text;
  StyledText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      text,
      style: const TextStyle(
        fontSize: 28,
      ),
    );
  }
}