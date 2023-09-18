import 'package:flutter/material.dart';
import 'package:food_delivery_app_razan/routes/route_helper.dart';
import 'package:food_delivery_app_razan/utils/app_colors.dart';
import 'package:food_delivery_app_razan/utils/dimensions.dart';
import 'package:food_delivery_app_razan/widgets/app_icon.dart';
import 'package:food_delivery_app_razan/widgets/big_text.dart';
import 'package:food_delivery_app_razan/widgets/expandable_text_custom_widget.dart';
import 'package:get/get.dart';
class RecomendedFoodDetail extends StatelessWidget {
  const RecomendedFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap:() {
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: AppIcon(icon: Icons.clear)),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.only(
                    top: Dimensions.height5,
                    bottom: Dimensions.height10,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Dimensions.radius20),
                          topLeft: Radius.circular(Dimensions.radius20))),
                  child: Align(
                    alignment: Alignment.center,
                    child: BigText(
                      "Chinese Side",
                      color: Colors.black54,
                    ),
                  )),
            ),
            // primary: true,
            // when scrolls and run out the height of the bar will still display or not
            pinned: true,
            backgroundColor: AppColors.mainColor,
            expandedHeight: 350,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/image01.jpg",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.width10, right: Dimensions.width10),
                  child: ExpandableTextCustomWidget(
                    text:
                        'lkffffffffffflkfffffffflkfflkffffffffffflkfffffffflkffffffffffflkfffffffffffffffffffffffffffffffffffshhhhhhhlkfffffffffffffffffffffffffffffffffffshhhhhhhffffffffffffffffffffffffshhhhhhhfffffffffffffffffffffffffffshhhhhhhlkffffffffffffffffffffffffffffffflkffffffffffflkfffffffflkfflkffffffffffflkfffffffflkffffffffffflkfffffffffffffffffffffffffffffffffffshhhhhhhlkfffffffffffffffffffffffffffffffffffshhhhhhhffffffffffffffffffffffffshhhhhhhfffffffffffffffffffffffffffshhhhhhhlkfffffffffffffffffffffffffffffffffffshhhhhhhffffffffffffffffffffffffshhhhhhhffffffffflkfffffffffffffffffffffffffffffffffffshhhhhhhlkfffffffffffffffffffffffffffffffffffshhhhhhhffffffffffffffffffffffffshhhhhhhfffffffffffffffffffffffffffshhhhhhhlkfffffffffffffffffffffffffffffffffffshhhhhhhffffffffffffffffffffffffshhhhhhhffffshhhhhhhffffffffffffffffffffffffshhhhhhhffffffffflkfffffffffffffffffffffffffffffffffffshhhhhhhlkfffffffffffffffffffffffffffffffffffshhhhhhhffffffffffffffffffffffffshhhhhhhfffffffffffffffffffffffffffshhhhhhhlkfffffffffffffffffffffffffffffffffffshhhhhhhffffffffffffffffffffffffshhhhhhh',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.width20*2.5,
              right: Dimensions.width20*2.5,
              top: Dimensions.height10,
              bottom: Dimensions.height10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.remove,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),
                BigText("\$12.88 X 0",color: Colors.black,size: Dimensions.fontSize26,),
                AppIcon(
                  icon: Icons.add,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),
              ],
            ),
          ),
          Container(
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
                  child: Icon(
                    Icons.favorite,color: AppColors.mainColor,
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
        ],
      ),
    );
  }
}
