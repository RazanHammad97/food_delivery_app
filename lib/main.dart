import 'package:flutter/material.dart';
import 'package:food_delivery_app_razan/screens/food/popular_food_details.dart';
import 'package:food_delivery_app_razan/screens/food/recomended_food_detail.dart';
import 'package:food_delivery_app_razan/utils/app_colors.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Delivery App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.mainColor),
        useMaterial3: true,
      ),
      home: const RecomendedFoodDetail(),
      // const FoodHomePage(),
    );
  }
}


