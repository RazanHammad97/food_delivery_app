import 'package:flutter/material.dart';
import 'package:food_delivery_app_razan/controllers/popular_product_controller.dart';
import 'package:food_delivery_app_razan/routes/route_helper.dart';
import 'package:food_delivery_app_razan/screens/food/recomended_food_detail.dart';
import 'package:food_delivery_app_razan/screens/home/food_home_page.dart';
import 'package:food_delivery_app_razan/utils/app_colors.dart';
import 'package:food_delivery_app_razan/utils/dimensions.dart';
import 'package:food_delivery_app_razan/widgets/app_column.dart';
import 'package:food_delivery_app_razan/widgets/app_icon.dart';
import 'package:get/get.dart';
import '../../utils/app_constants.dart';
import '../../widgets/big_text.dart';
import '../../widgets/expandable_text_custom_widget.dart';

class PopularFoodDetail extends StatelessWidget {
  int pageId;

  PopularFoodDetail({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopularProductController>().popularProductList[pageId];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularSizeImage,
                child:  Image(
                  image:  NetworkImage("${AppConstants.BASE_URL}${AppConstants.UPLOADS_URL}${product.img!}"),
                  fit: BoxFit.cover,
                ),
              )),
          Positioned(
            left: Dimensions.width20,
            right: Dimensions.width20,
            top: Dimensions.height45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: AppIcon(icon: Icons.arrow_back_ios)),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              // gets the whole height available
              left: 0,
              right: 0,
              top: Dimensions.popularSizeImage - 20,
              child: Container(
                  padding: EdgeInsets.only(
                    top: Dimensions.height20,
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Dimensions.height20),
                          topLeft: Radius.circular(Dimensions.height20)),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppColumn(
                        text: "${product.name!}",
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      BigText("introduce"),
                      Expanded(
                        child: SingleChildScrollView(
                          child: ExpandableTextCustomWidget(
                            text:
                                "${product.description}",
                          ),
                        ),
                      ),
                    ],
                  )))
        ],
      ),
      bottomNavigationBar: Container(
        height: 100,
        padding: EdgeInsets.only(
          top: Dimensions.height20,
          bottom: Dimensions.height20,
          left: Dimensions.width15,
          right: Dimensions.width15,
        ),
        decoration: BoxDecoration(
          color: AppColors.bottomNavigationBarGrayColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.height20 * 2),
            topRight: Radius.circular(Dimensions.height20 * 2),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Dimensions.radius20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.remove),
                  SizedBox(
                    width: Dimensions.width5,
                  ),
                  BigText("0"),
                  SizedBox(
                    width: Dimensions.width5,
                  ),
                  Icon(Icons.add)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.mainColor,
              ),
              child: BigText(
                "\$ ${product.price!} | Add to cart",
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
