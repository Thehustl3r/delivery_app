import 'package:delivery_app/utils/colors.dart';
import 'package:delivery_app/utils/dimensions.dart';
import 'package:delivery_app/widgets/big_text.dart';
import 'package:delivery_app/widgets/icom_and_text_widget.dart';
import 'package:delivery_app/widgets/small_text.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 8.5);
  var _currPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
        debugPrint("current value is ${_currPageValue.toString()}");
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // slide section
        SizedBox(
          height: Dimensions.pageView,
          child: PageView.builder(
              // controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        // dots
        DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: const DotsDecorator(
            activeColor: AppColors.mainColor,
            size: Size.square(9.0),
            activeSize: Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(),
          ),
        )
        //  popular next
        ,
        SizedBox(height: Dimensions.height30),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            children: [
              const BigText(text: "popular"),
              SizedBox(width: Dimensions.width10),
              Container(
                margin: EdgeInsets.only(bottom: Dimensions.height3),
                child: const BigText(
                  text: ".",
                  color: Colors.black26,
                ),
              ),
              SizedBox(width: Dimensions.width10),
              Container(
                margin: EdgeInsets.only(bottom: Dimensions.height2),
                child: const SmallText(text: "food pairing"),
              ),
              // list of food and image
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(
                          left: Dimensions.width20,
                          right: Dimensions.width20,
                          bottom: Dimensions.height10),
                      child: Row(
                        children: [
                          // image section
                          Container(
                            width: Dimensions.listViewImgSize,
                            height: Dimensions.listViewImgSize,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius20),
                              color: Colors.white,
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    "assets/image/remy.png",
                                  )),
                            ),
                          )
                          // Text container
                          ,
                          // Expanded(
                          //   child:
                          Container(
                            height: Dimensions.listViewTextContSize,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(Dimensions.radius20),
                                bottomRight:
                                    Radius.circular(Dimensions.radius20),
                              ),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: Dimensions.width10,
                                  right: Dimensions.width10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const BigText(
                                      text: "nutrition fruit meal in china"),
                                  SizedBox(height: Dimensions.height10),
                                  const SmallText(
                                      text: "with Chinese characteristics"),
                                  SizedBox(height: Dimensions.height10),
                                  Row(
                                    children: const [
                                      IconAndTextWidget(
                                        icon: Icons.circle_sharp,
                                        text: "Normal",
                                        iconColor: AppColors.iconColor1,
                                      ),
                                      IconAndTextWidget(
                                        icon: Icons.location_on,
                                        text: "1.7",
                                        iconColor: AppColors.iconColor1,
                                      ),
                                      IconAndTextWidget(
                                        icon: Icons.access_time_filled_rounded,
                                        text: "32min",
                                        iconColor: AppColors.iconColor1,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // ),
                        ],
                      ),
                    );
                  }),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }
    return Transform(
      transform: matrix,
      child: Stack(children: [
        Container(
          height: Dimensions.pageViewContainer,
          margin: EdgeInsets.only(
              left: Dimensions.width10, right: Dimensions.width10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              color: index.isEven
                  ? const Color(0xFF69c5df)
                  : const Color(0xFF9294cc),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/image/remy.png"),
              )),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: Dimensions.pageViewTextContainer,
            margin: EdgeInsets.only(
                left: Dimensions.width30,
                right: Dimensions.width30,
                bottom: Dimensions.height30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0),
                  )
                ]),
            child: Container(
              padding:
                  EdgeInsets.only(top: Dimensions.height15, bottom: 5, left: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BigText(text: "Chinese side"),
                  SizedBox(height: Dimensions.height10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Wrap(
                        children: List.generate(
                          5,
                          (index) => const Icon(
                            Icons.star,
                            color: AppColors.mainColor,
                            size: 15,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const SmallText(text: "4.5"),
                      const SizedBox(width: 8),
                      const SmallText(text: "comment")
                    ],
                  ),
                  SizedBox(height: Dimensions.height20),
                  Row(
                    children: const [
                      IconAndTextWidget(
                        icon: Icons.circle_sharp,
                        text: "Normal",
                        iconColor: AppColors.iconColor1,
                      ),
                      IconAndTextWidget(
                        icon: Icons.location_on,
                        text: "1.7",
                        iconColor: AppColors.iconColor1,
                      ),
                      IconAndTextWidget(
                        icon: Icons.access_time_filled_rounded,
                        text: "32min",
                        iconColor: AppColors.iconColor1,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
