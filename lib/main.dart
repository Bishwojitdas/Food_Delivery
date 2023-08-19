import 'package:flutter/material.dart';
import 'package:food_delivery/controller/cartController.dart';
import 'package:food_delivery/controller/popular_product_controller.dart';
import 'package:food_delivery/controller/recommended_product_controller.dart';
import 'package:food_delivery/route/route_helper.dart';
import 'package:food_delivery/screens/cart/cart_pages.dart';
import 'package:food_delivery/screens/food/popular_food_details.dart';
import 'package:food_delivery/screens/home/home_page.dart';
import 'package:food_delivery/screens/home/main_food_screen.dart';
import 'package:food_delivery/screens/food/recommanded_food_details.dart';
import 'package:food_delivery/screens/splash/splash_screen.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<CartContrller>().getCartData();
    return  GetBuilder<PopularProductController>(builder: (_) {
      return GetBuilder<RecommendedProductController>(builder: (_) {
        return  GetMaterialApp(
          title: 'Food Delivery',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primarySwatch: Colors.blue
          ),
          // home:const SplashScreen(),
          initialRoute: RouteHelper.getSplashPage(),
          getPages: RouteHelper.routes,
        );
      },);
    },);
  }
}

