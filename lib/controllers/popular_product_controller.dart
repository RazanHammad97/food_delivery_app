import 'package:get/get.dart';
import '../data/repositories/popular_products_repo.dart';
import '../models/popular_product.dart';

class PopularProductController extends GetxController {
  final PopularProductsRepo popularProductsRepo;

  PopularProductController({required this.popularProductsRepo});

  List<dynamic> _popularProductList = [];

  List<dynamic> get popularProductList => _popularProductList;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getPopularProductList() async {
    Response response = await popularProductsRepo.getPopularProductList();
    if (response.statusCode == 200) {
      print(response.body);
      print("got products");
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded=true;
      update();
    } else {}
  }
}
