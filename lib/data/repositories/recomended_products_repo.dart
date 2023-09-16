import 'package:food_delivery_app_razan/data/api/api_client.dart';
import 'package:food_delivery_app_razan/utils/app_constants.dart';
import 'package:get/get.dart';

class RecommendedProductsRepo extends GetxService{
  final ApiClient apiClient;
  RecommendedProductsRepo({required this.apiClient});

  Future <Response> getRecommendedProductList() async{
    return await apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URI);
  }
}