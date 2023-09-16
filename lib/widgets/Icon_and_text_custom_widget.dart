import 'package:flutter/material.dart';
import 'package:food_delivery_app_razan/widgets/small_text.dart';
import '../../utils/dimensions.dart';

class IconAndText extends StatelessWidget {
  IconData icon;
  String text;
  Color iconColor;

  IconAndText(
      {super.key,
      required this.icon,
      required this.text,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
        ),
        SizedBox(
          width: Dimensions.width5,
        ),
        SmallText(text)
      ],
    );
  }
}
