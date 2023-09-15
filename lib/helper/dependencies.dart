import 'package:food_delivery_app_razan/data/api/api_client.dart';
import 'package:food_delivery_app_razan/utils/app_constants.dart';
import 'package:get/get.dart';
import '../controllers/popular_product_controller.dart';
import '../data/repositories/popular_products_repo.dart';

Future<void> init() async {
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //repos
  Get.lazyPut(() => PopularProductsRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => PopularProductController(popularProductsRepo: Get.find()));
}
