import 'package:flutter/material.dart';
import 'package:food_delivery_app_razan/controllers/popular_product_controller.dart';
import 'package:food_delivery_app_razan/controllers/recommended_products_controller.dart';
import 'package:food_delivery_app_razan/models/popular_product.dart';
import 'package:food_delivery_app_razan/routes/route_helper.dart';
import 'package:food_delivery_app_razan/screens/food/popular_food_details.dart';
import 'package:food_delivery_app_razan/utils/app_constants.dart';
import 'package:food_delivery_app_razan/utils/dimensions.dart';
import 'package:food_delivery_app_razan/widgets/big_text.dart';
import 'package:food_delivery_app_razan/widgets/small_text.dart';
import 'package:food_delivery_app_razan/utils/app_colors.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:get/get.dart';
import '../../widgets/Icon_and_text_custom_widget.dart';
import '../../widgets/app_column.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  PageController _controller = PageController(viewportFraction: 0.85);
  var _curPageIndex = 0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.height220;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(() {
      setState(() {
        _curPageIndex = _controller.page!.toInt();
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print(MediaQuery.of(context).size.width);
    // print(MediaQuery.of(context).size.height);
    // print(_curPageIndex);
    return Column(
      children: [
        GetBuilder<PopularProductController>(
          builder: (popularProducts) {
            return popularProducts.isLoaded
                ? Container(
                    height: Dimensions.height320,
                    child: PageView.builder(
                        onPageChanged: (index) {
                          print(index); //number of current page
                          // setState(() {});
                        },
                        controller: _controller,
                        itemCount: popularProducts.popularProductList.length,
                        itemBuilder: (context, position) {
                          return _buildPageItem(position,
                              popularProducts.popularProductList[position]);
                        }),
                  )
                : CircularProgressIndicator(
                    color: AppColors.mainColor,
                  );
          },
        ),
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return DotsIndicator(
            dotsCount: popularProducts.popularProductList.isEmpty
                ? 1
                : popularProducts.popularProductList.length,
            position: _curPageIndex,
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: Size.square(Dimensions.height9),
              activeSize: Size(Dimensions.width18, Dimensions.height9),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radius5)),
            ),
          );
        }),
        SizedBox(
          height: Dimensions.height30,
        ),
        Container(
          margin: EdgeInsets.only(
            left: Dimensions.width30,
            bottom: Dimensions.height30,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText("Recommended"),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                  margin: EdgeInsets.only(bottom: Dimensions.height30),
                  child: SmallText(".")),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                  margin: EdgeInsets.only(bottom: Dimensions.height30),
                  child: SmallText("Food Pairing")),
            ],
          ),
        ),
        GetBuilder<RecommendedProductController>(
            builder: (recommendedProducts) {
          print(recommendedProducts.recommendedProductList);
          return ListView.builder(
              itemCount: recommendedProducts.recommendedProductList.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getRecommendedFoodDetail(index));
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        left: Dimensions.width20,
                        right: Dimensions.width20,
                        bottom: Dimensions.height10),
                    child: Row(
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.height20),
                            color: Colors.white38,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "${AppConstants.BASE_URL}${AppConstants.UPLOADS_URL}${recommendedProducts.recommendedProductList[index].img!}"),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(
                                left: Dimensions.height20,
                                right: Dimensions.height20),
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topRight:
                                      Radius.circular(Dimensions.height20),
                                  bottomRight:
                                      Radius.circular(Dimensions.height20)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BigText(recommendedProducts
                                    .recommendedProductList[index].name!),
                                SizedBox(
                                  height: Dimensions.height10,
                                ),
                                Expanded(
                                    child: SmallText(recommendedProducts
                                        .recommendedProductList[index]
                                        .description!)),
                                SizedBox(
                                  height: Dimensions.height10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconAndText(
                                      icon: Icons.search,
                                      text: "Normal",
                                      iconColor: AppColors.mainColor,
                                    ),
                                    // SizedBox(width: Dimensions.width2,),
                                    IconAndText(
                                      icon: Icons.map,
                                      text: "Normal",
                                      iconColor: AppColors.mainColor,
                                    ),
                                    IconAndText(
                                      icon: Icons.map,
                                      text: "Normal",
                                      iconColor: AppColors.mainColor,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              });
        }),
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel popularProduct) {
    // print(_curPageIndex.toString() + "current page index");
    // Matrix4 matrix = Matrix4.identity();
    // if (index == _curPageIndex.floor()) {
    //   print(index);
    //   print(_curPageIndex);
    //   var curScale = 1 - (_curPageIndex - index) * (1 - _scaleFactor);
    //   print(curScale);
    //   var curTrans = _height * (1 - curScale) / 2;
    //   print(curTrans);
    //   matrix = Matrix4.diagonal3Values(1, curScale, 1)
    //     ..setTranslationRaw(0, curTrans, 0);
    // } else if (index == _curPageIndex.floor() + 1) {
    //   var curScale =
    //       _scaleFactor + (_curPageIndex - index + 1) * (1 - _scaleFactor);
    //   var curTrans = _height * (1 - curScale) / 2;
    //   matrix = Matrix4.diagonal3Values(1, curScale, 1);
    //   matrix = Matrix4.diagonal3Values(1, curScale, 1)
    //     ..setTranslationRaw(0, curTrans, 0);
    //   // ..setTranslationRaw(0, curTrans, 0);
    // } else if (index == _curPageIndex.floor() - 1) {
    //   var curScale = 1 - (_curPageIndex - index) * (1 - _scaleFactor);
    //   var curTrans = _height * (1 - curScale) / 2;
    //   matrix = Matrix4.diagonal3Values(1, curScale, 1);
    //   matrix = Matrix4.diagonal3Values(1, curScale, 1)
    //     ..setTranslationRaw(0, curTrans, 0);
    // } else {
    //   var curScale = 0.8;
    //   matrix = Matrix4.diagonal3Values(1, curScale, 1)
    //     ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    // }
    return Stack(children: [
      GestureDetector(
        onTap: () {
          Get.toNamed(RouteHelper.getFoodPopularDetail(index));
        },
        child: Container(
          height: _height,
          margin: EdgeInsets.only(
              left: Dimensions.width10, right: Dimensions.width10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              // color: index.isEven ? Colors.red : Colors.yellow,
              image: DecorationImage(
                  image: NetworkImage(
                      "${AppConstants.BASE_URL}${AppConstants.UPLOADS_URL}${popularProduct.img!}"),
                  fit: BoxFit.cover)),
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: Dimensions.height150,
          margin: EdgeInsets.only(
              left: Dimensions.width30,
              right: Dimensions.width30,
              bottom: Dimensions.height30),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Color(0xFFe8e8e8),
                blurRadius: Dimensions.height5,
                offset: Offset(0, Dimensions.height5)),
            BoxShadow(
                color: Colors.white, offset: Offset(-Dimensions.width5, 0)),
            BoxShadow(
                color: Colors.white, offset: Offset(Dimensions.width5, 0)),
          ], borderRadius: BorderRadius.circular(30), color: Colors.white),
          child: Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height15,
                  left: Dimensions.width15,
                  right: Dimensions.width15),
              child: AppColumn(
                text: popularProduct.name!,
              )),
        ),
      ),
    ]);
  }
}
