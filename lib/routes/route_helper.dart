import 'package:food_delivery_app_razan/screens/food/popular_food_details.dart';
import 'package:food_delivery_app_razan/screens/food/recomended_food_detail.dart';
import 'package:food_delivery_app_razan/screens/home/food_home_page.dart';
import 'package:get/get.dart';
class RouteHelper {
  static const String INITIAL = "/";
  static const String POPULAR_FOOD_PAGE = "/popular-food";
  static const String RECOMMENDED_FOOD_DETAIL ='/recommended-food-detail';
// use this approach (functions) to process parameters in future and call this function from the ui
  static String getFoodPopularDetail(int pageId) => "$POPULAR_FOOD_PAGE?pageId=$pageId";
  static String getInitial() => INITIAL;
  static String getRecommendedFoodDetail(int pageId) => "$RECOMMENDED_FOOD_DETAIL?recoPageId=$pageId";

 static  List<GetPage> routes =[
    GetPage(name: INITIAL, page: ()=> FoodHomePage()),
    GetPage(name: POPULAR_FOOD_PAGE, page: () {
      var pageId = Get.parameters["pageId"];
      return PopularFoodDetail(pageId:int.parse(pageId!));},
    transition: Transition.leftToRightWithFade
    ),
   GetPage(name: RECOMMENDED_FOOD_DETAIL, page: () {
     var pageId = Get.parameters['recoPageId'];
     return RecomendedFoodDetail(pageId :int.parse(pageId!));
   },
       transition: Transition.leftToRightWithFade
   ),

  ];
}