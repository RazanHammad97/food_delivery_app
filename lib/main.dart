import 'package:flutter/material.dart';
import 'package:food_delivery_app_razan/controllers/popular_product_controller.dart';
import 'package:food_delivery_app_razan/controllers/recommended_products_controller.dart';
import 'package:food_delivery_app_razan/routes/route_helper.dart';
import 'package:food_delivery_app_razan/screens/home/food_home_page.dart';
import 'package:food_delivery_app_razan/utils/app_colors.dart';
import 'package:food_delivery_app_razan/utils/app_constants.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.APP_NAME,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.mainColor),
        useMaterial3: true,
      ),
      home: const FoodHomePage(),
      initialRoute: RouteHelper.INITIAL,
      getPages: RouteHelper.routes,
      //
    );
  }
}
