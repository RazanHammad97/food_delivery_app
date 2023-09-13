import 'package:flutter/material.dart';
import 'package:food_delivery_app_razan/utils/app_colors.dart';
import 'package:food_delivery_app_razan/widgets/small_text.dart';

import '../utils/dimensions.dart';

class ExpandableTextCustomWidget extends StatefulWidget {
  final String text;

  const ExpandableTextCustomWidget({required this.text, super.key});

  @override
  State<ExpandableTextCustomWidget> createState() =>
      _ExpandableTextCustomWidgetState();
}

class _ExpandableTextCustomWidgetState
    extends State<ExpandableTextCustomWidget> {
  late String firstHalf;
  late String secondHalf;
  bool hiddenText = true;

  double textHeight = Dimensions.screenHeight / 5.63;

  @override
  void initState() {
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(firstHalf,size: Dimensions.fontSize16,)
          : Column(
              children: [
                SmallText(

                    hiddenText ? ("$firstHalf....") : firstHalf + secondHalf,
                size: Dimensions.fontSize16,
                height: 1.8,
                color: Colors.black54,),
                // check if expanded or not
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText=!hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      SmallText(
                        "Show More",
                        color: AppColors.mainColor,
                      ),
                      Icon(
                        hiddenText?Icons.arrow_drop_down:Icons.arrow_drop_up,
                        color: AppColors.mainColor,
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
