import 'package:flutter/material.dart';
import 'package:food_delivery_app_razan/app_colors.dart';
import 'package:food_delivery_app_razan/widgets/big_text.dart';
import 'package:food_delivery_app_razan/widgets/small_text.dart';

import 'home_page_body.dart';

class FoodHomePage extends StatefulWidget {
  const FoodHomePage({super.key});

  @override
  State<FoodHomePage> createState() => _FoodHomePageState();
}

class _FoodHomePageState extends State<FoodHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            // color: Colors.red,
            child: Container(
              margin: EdgeInsets.only(top: 45,bottom: 15),
              padding: EdgeInsets.only(left: 20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText("Country"),
                      Row(
                        children: [
                          SmallText("Country"),
                          Icon(Icons.arrow_drop_down_rounded)
                        ],
                      ),
                    ],
                  ),
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.mainColor
                    ),
                    child: Icon(Icons.search,color: Colors.white,),
                  ),
                ],
              ),
            ),
          ),
          HomePageBody(),
        ],
      ),
    );
  }
}
