import 'package:flutter/material.dart';
import 'package:food_delivery_app_razan/home/Icon_and_text_custom_widget.dart';
import 'package:food_delivery_app_razan/utils/dimensions.dart';
import 'package:food_delivery_app_razan/widgets/big_text.dart';
import 'package:food_delivery_app_razan/widgets/small_text.dart';
import 'package:food_delivery_app_razan/utils/app_colors.dart';
import 'package:dots_indicator/dots_indicator.dart';

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
      _curPageIndex = _controller.page!.toInt();
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
    print(MediaQuery.of(context).size.width);
    print(MediaQuery.of(context).size.height);
    // print(_curPageIndex);
    return Column(
      children: [
        Container(
          height: Dimensions.height320,
          child: PageView.builder(
              onPageChanged: (index) {
                print(index); //number of current page
                setState(() {});
              },
              controller: _controller,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        new DotsIndicator(
          dotsCount: 5,
          position: _curPageIndex,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize:  Size(Dimensions.width18, Dimensions.height9),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius5)),
          ),
        ),
      ],
    );
  }

  Widget _buildPageItem(int index) {
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
      Container(
        height: _height,
        margin: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius30),
            color: index.isEven ? Colors.red : Colors.yellow,
            image: DecorationImage(
                image: AssetImage("assets/image01.jpg"), fit: BoxFit.cover)),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 150,
          margin: EdgeInsets.only(left: Dimensions.width30, right: Dimensions.width30, bottom: Dimensions.height30),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Color(0xFFe8e8e8), blurRadius: 5, offset: Offset(0, 5)),
            BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
            BoxShadow(color: Colors.white, offset: Offset(5, 0)),
          ], borderRadius: BorderRadius.circular(30), color: Colors.white),
          child: Container(
            padding: EdgeInsets.only(top: Dimensions.height15, left: Dimensions.width15, right: Dimensions.width15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText("Chineese Side"),
                SizedBox(
                  height: Dimensions.height10,
                ),
                Row(
                  children: [
                    Wrap(
                      children: List.generate(
                          5,
                          (index) => Icon(
                                Icons.star,
                                color: AppColors.mainColor,
                              )),
                    ),
                    SizedBox(
                      width: Dimensions.width10,
                    ),
                    SmallText("4.5"),
                    SizedBox(
                      width: Dimensions.width10,
                    ),
                    SmallText("1287"),
                    SizedBox(
                      width: Dimensions.width10,
                    ),
                    SmallText("comments."),
                  ],
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconAndText(
                      icon: Icons.search,
                      text: "Normal",
                      iconColor: AppColors.mainColor,
                    ),
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
                )
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
