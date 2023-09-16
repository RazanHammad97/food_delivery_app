import 'package:get/get.dart';
import '../data/repositories/recomended_products_repo.dart';
import '../models/popular_product.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductsRepo recommendedProductsRepo;

  RecommendedProductController({required this.recommendedProductsRepo});

  List<dynamic> _recommendedProductList = [];

  List<dynamic> get recommendedProductList => _recommendedProductList;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList() async {
    Response response = await recommendedProductsRepo.getRecommendedProductList();
    if (response.statusCode == 200) {
      // print(response.body);
      print("got recommended products");
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded=true;
      update();
    } else {
      print("Could not got recommended products");
    }
  }
}
