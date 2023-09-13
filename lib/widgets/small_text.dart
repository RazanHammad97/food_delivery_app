import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final String text;
 final double size;
  Color? color;
  double height;

  SmallText(this.text,
      {this.color = const Color(0xFFd3d3d3),
      this.size = 12,
      this.height = 1.2,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        height: height,
        color: color,
        fontSize: size,
        // fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
