import 'package:food_delivery/screens/cart/cart_pages.dart';
import 'package:food_delivery/screens/food/popular_food_details.dart';
import 'package:food_delivery/screens/home/home_page.dart';
import 'package:food_delivery/screens/home/main_food_screen.dart';
import 'package:food_delivery/screens/food/recommanded_food_details.dart';
import 'package:food_delivery/screens/sign_in/sign_in_page.dart';
import 'package:food_delivery/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

class RouteHelper{
  static const String initial= "/";
  static const String splashPage= "/splash_page";
  static const String popularFood= "/popular_food";
  static const String recommendedFood= "/recommended_food";
  static const String cartPage= "/cart_page";
  static const String signInPage= "/sign_in_page";

  static  String getInitial()=>'$initial';
  static  String getSplashPage()=>'$splashPage';
  static  String getPopularFood(int pageId, String page )=>'$popularFood?pageId=$pageId&Page=$page';
  static  String getRecommendedFood(int pageId, String page)=>'$recommendedFood?pageId=$pageId&Page=$page';
  static  String getCartPage()=>'$cartPage';
  static  String getSignInPage()=>'$signInPage';

  static List<GetPage> routes=[
    GetPage(name: splashPage, page: ()=>SplashScreen()),

    GetPage(name: initial, page: ()=>HomePage()),

    GetPage(name: popularFood, page: (){
      var pageId=Get.parameters['pageId'];
      var page=Get.parameters['page'];
      return PopularFoodDetails(pageId: int.parse(pageId!), page:page);
    },
      transition: Transition.fadeIn
    ),

    GetPage(name: recommendedFood, page: (){
      var pageId=Get.parameters['pageId'];
      var page=Get.parameters['page'];
      return RecommandedFoodDetails(pageId: int.parse(pageId!),page:page);
    },
      transition: Transition.fadeIn
    ),

    GetPage(name: cartPage, page: (){
      return CartScreen();
    },
      transition: Transition.fadeIn
    ),
    GetPage(name: signInPage, page: (){
      return SignInScreen();
    },
      transition: Transition.fadeIn
    ),

    
  ];
}