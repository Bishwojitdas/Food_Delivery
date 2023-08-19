import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_delivery/route/route_helper.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

import '../../controller/cartController.dart';
import '../../controller/popular_product_controller.dart';
import '../../controller/recommended_product_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {

  late Animation<double> animation;
  late AnimationController controller;

  Future<void> _loadResources() async {
   await Get.find<PopularProductController>().getPopularProductList();
   await Get.find<RecommendedProductController>().getRecommendedProductList();
   await Get.find<CartContrller>();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadResources();
    controller= AnimationController(vsync: this,
        duration: Duration(seconds: 2))..forward();
    animation= CurvedAnimation(parent: controller, curve: Curves.linear);

    Timer(Duration(seconds: 3), () {
      Get.offNamed(RouteHelper.getSignInPage());
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: animation,
                child: Image.asset("assets/images/food_delivery_1.png", height: Dimensions.splashImage,
                  width: Dimensions.splashImage,
                  fit: BoxFit.cover,)),
            BigText(text: "FOOD DELIVERY",)
          ],
        ),
      ),
    );
  }
}
