import 'package:food_delivery/screens/food/popular_food_details.dart';
import 'package:food_delivery/screens/home/main_food_screen.dart';
import 'package:food_delivery/screens/food/recommanded_food_details_page.dart';
import 'package:get/get.dart';

class RouteHelper{
  static const String initial= "/";
  static const String popularFood= "/popular_food";
  static const String recommendedFood= "/recommended_food";

  static  String getInitial()=>'$initial';
  static  String getPopularFood(int pageId)=>'$popularFood?pageId=$pageId';
  static  String getRecommendedFood(int pageId)=>'$recommendedFood?pageId=$pageId';

  static List<GetPage> routes=[
    GetPage(name: initial, page: ()=>MainFoodScreen()),

    GetPage(name: popularFood, page: (){
      var pageId=Get.parameters['pageId'];
      return PopularFoodDetails(pageId: int.parse(pageId!));
    },
      transition: Transition.fadeIn
    ),

    GetPage(name: recommendedFood, page: (){
      var pageId=Get.parameters['pageId'];
      return RecommandedFoodDetails(pageId: int.parse(pageId!),);
    },
      transition: Transition.fadeIn
    ),

    
  ];
}