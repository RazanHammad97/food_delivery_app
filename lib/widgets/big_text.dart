import 'package:flutter/material.dart';


class BigText extends StatelessWidget {
  final String text;
  double size;
  Color? color;
  TextOverflow overflow;

  BigText(this.text,
      {this.color = const Color(0xFF1A1110),
      this.size = 20,
      this.overflow = TextOverflow.ellipsis,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      style: TextStyle(

          color: color,
          fontSize: size,
          // fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
          overflow: overflow),
    );
  }
}
