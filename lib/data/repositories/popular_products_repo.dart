import 'package:food_delivery_app_razan/data/api/api_client.dart';
import 'package:food_delivery_app_razan/utils/app_constants.dart';
import 'package:get/get.dart';

class PopularProductsRepo extends GetxService{
  final ApiClient apiClient;
  PopularProductsRepo({required this.apiClient});

  Future <Response> getPopularProductList() async{
    return await apiClient.getData(AppConstants.POPULAR_PRODUCT_URI);
  }
}