import 'package:flutter/material.dart';
import 'package:food_delivery_app_razan/app_colors.dart';
import 'package:food_delivery_app_razan/home/Icon_and_text_custom_widget.dart';
import 'package:food_delivery_app_razan/widgets/big_text.dart';
import 'package:food_delivery_app_razan/widgets/small_text.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  PageController _controller = PageController(viewportFraction: 0.85);
  var _curPageIndex = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(() {
      _curPageIndex = _controller.page!;
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
    return Container(
      height: 320,
      child: PageView.builder(
          controller: _controller,
          itemCount: 5,
          itemBuilder: (context, position) {
            return _buildPageItem(position);
          }),
    );
  }
}

Widget _buildPageItem(int index) {
  return Stack(children: [
    Container(
      height: 220,
      margin: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: index.isEven ? Colors.red : Colors.yellow,
          image: DecorationImage(
              image: AssetImage("assets/image01.jpg"), fit: BoxFit.cover)),
    ),
    Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 150,
        margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Colors.white),
        child: Container(
          padding: EdgeInsets.only(top: 15, left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText("Chineese Side"),
              SizedBox(
                height: 10,
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
                    width: 10,
                  ),
                  SmallText("4.5"),
                  SizedBox(
                    width: 10,
                  ),
                  SmallText("1287"),
                  SizedBox(
                    width: 10,
                  ),
                  SmallText("comments."),

                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  IconAndText(
                    icon: Icons.search,
                    text: "Nornal",
                    iconColor: AppColors.mainColor,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ),
  ]);
}
