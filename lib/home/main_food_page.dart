import 'package:delivery_app/home/food_page_body.dart';
import 'package:delivery_app/utils/colors.dart';
import 'package:delivery_app/utils/dimensions.dart';
import 'package:delivery_app/widgets/big_text.dart';
import 'package:delivery_app/widgets/small_text.dart';
import 'package:flutter/material.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        // showing the  header
        Container(
          margin: EdgeInsets.only(
              top: Dimensions.height45, bottom: Dimensions.height15),
          padding: EdgeInsets.only(
              left: Dimensions.width20, right: Dimensions.width20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const BigText(
                    text: "Bangladesh",
                    color: AppColors.mainColor,
                    size: 30,
                  ),
                  Row(
                    children: const [
                      SmallText(text: "narsingi", color: Colors.black54),
                      Icon(Icons.arrow_drop_down_circle_rounded),
                    ],
                  ),
                ],
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius15),
                    color: AppColors.mainColor,
                  ),
                  width: Dimensions.height45,
                  height: Dimensions.height45,
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: Dimensions.iconSize24,
                  ),
                ),
              )
            ],
          ),
        ),
        // showing the body
        // Expanded(
        //   child: SingleChildScrollView(
        //     child:
        const FoodPageBody(),
        //   ),
        // ),
      ],
    ));
  }
}
