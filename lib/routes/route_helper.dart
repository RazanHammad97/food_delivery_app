import 'package:food_delivery_app_razan/screens/food/popular_food_details.dart';
import 'package:food_delivery_app_razan/screens/home/food_home_page.dart';
import 'package:get/get.dart';
class RouteHelper {
  static const String INITIAL = "/";
  static const String POPULAR_FOOD_PAGE = "/popular-food";
// use this approach (functions) to process parameters in future and call this function from the ui
  static String getFoodPopularDetail() => POPULAR_FOOD_PAGE;
  static String getInitial() => INITIAL;

 static  List<GetPage> routes =[
    GetPage(name: INITIAL, page: ()=> FoodHomePage()),
    GetPage(name: POPULAR_FOOD_PAGE, page: ()=> PopularFoodDetail(),
    transition: Transition.leftToRightWithFade
    ),

  ];
}