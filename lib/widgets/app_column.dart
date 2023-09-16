import 'package:flutter/material.dart';
import 'package:food_delivery_app_razan/widgets/small_text.dart';
import '../utils/app_colors.dart';
import '../utils/dimensions.dart';
import 'Icon_and_text_custom_widget.dart';
import 'big_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({required this.text,super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text,size: Dimensions.fontSize26,),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(
                  5,
                      (index) => Icon(
                    Icons.star,
                    color: AppColors.mainColor,
                  )),
            ),
            SizedBox(
              width: Dimensions.width10,
            ),
            SmallText("4.5"),
            SizedBox(
              width: Dimensions.width10,
            ),
            SmallText("1287"),
            SizedBox(
              width: Dimensions.width10,
            ),
            SmallText("comments."),
          ],
        ),
        SizedBox(
          height: Dimensions.height20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndText(
              icon: Icons.search,
              text: "Normal",
              iconColor: AppColors.mainColor,
            ),
            IconAndText(
              icon: Icons.map,
              text: "Normal",
              iconColor: AppColors.mainColor,
            ),
            IconAndText(
              icon: Icons.map,
              text: "Normal",
              iconColor: AppColors.mainColor,
            ),
          ],
        ),
      ],
    );
  }
}
