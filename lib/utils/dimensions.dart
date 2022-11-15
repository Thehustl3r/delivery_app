import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageViewContainer = screenHeight / 3.84;
  static double pageViewTextContainer = screenHeight / 6;
  static double pageView = screenHeight / 2.64;

  // dynamic height padding and margin
  static double height10 = screenHeight / 84.4;
  static double height20 = screenHeight / 42.2;
  static double height15 = screenHeight / 56.7;
  static double height30 = screenHeight / 28.13;
  static double height45 = screenHeight / 18.76;
  static double height3 = screenHeight / 281.3;
  static double height2 = screenHeight / 422;
  static double height700 = screenHeight / 1.2;
  static double height120 = screenHeight / 7.03;

  // dynamic width padding and margin
  static double width10 = screenHeight / 84.4;
  static double width20 = screenHeight / 42.2;
  static double width15 = screenHeight / 56.7;
  static double width30 = screenHeight / 28.13;
  static double width5 = screenHeight / 168.8;
  static double width3 = screenHeight / 281.3;
  static double width120 = screenHeight / 7.03;
  static double height100 = screenHeight / 8.44;

  static double font20 = screenHeight / 42.2;

  // radius
  static double radius15 = screenHeight / 56.27;
  static double radius20 = screenHeight / 42.2;
  static double radius30 = screenHeight / 28.13;

  // icon size
  static double iconSize24 = screenHeight / 35.17;

  // list view size
  static double listViewImgSize = screenWidth / 3.25;
  static double listViewTextContSize = screenWidth / 3.9;
}
