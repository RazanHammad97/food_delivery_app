import 'package:flutter/material.dart';
import 'package:food_delivery_app_razan/utils/app_colors.dart';
import 'package:food_delivery_app_razan/utils/dimensions.dart';
import 'package:food_delivery_app_razan/widgets/app_column.dart';
import 'package:food_delivery_app_razan/widgets/app_icon.dart';
import '../../widgets/big_text.dart';
import '../../widgets/expandable_text_custom_widget.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
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
                child: const Image(
                  image: AssetImage("assets/image01.jpg"),
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
                AppIcon(icon: Icons.arrow_back_ios),
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
                        text: "Chineese Side",
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      BigText("introduce"),
                      Expanded(
                        child: SingleChildScrollView(
                          child: ExpandableTextCustomWidget(
                            text:
                            "lkffffffffffflkfffffffflkffffffffffflkfffffffffffffffffffffffffffffffffffshhhhhhhlkfffffffffffffffffffffffffffffffffffshhhhhhhffffffffffffffffffffffffshhhhhhhfffffffffffffffffffffffffffshhhhhhhlkfffffffffffffffffffffffffffffffffffshhhhhhhffffffffffffffffffffffffshhhhhhh",
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
                "\$10 | Add to cart",
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
