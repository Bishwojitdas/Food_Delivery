import 'package:flutter/material.dart';
import 'package:food_delivery/controller/cartController.dart';
import 'package:food_delivery/controller/popular_product_controller.dart';
import 'package:food_delivery/controller/recommended_product_controller.dart';
import 'package:food_delivery/route/route_helper.dart';
import 'package:food_delivery/utils/app_colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: Dimensions.height20*3,
              right: Dimensions.width20, left: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(icon: Icons.arrow_back_ios,
                  iconColor: Colors.white, backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,),
                  SizedBox(width: Dimensions.width20*5,),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.initial);
                    },
                    child: AppIcon(icon: Icons.home,
                    iconColor: Colors.white, backgroundColor: AppColors.mainColor,
                      iconSize: Dimensions.iconSize24,),
                  ),
                  AppIcon(icon: Icons.shopping_cart_outlined,
                  iconColor: Colors.white, backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,),
                ],
          )),
          Positioned(
              top: Dimensions.height20*5,
              left: Dimensions.width20,
              right: Dimensions.width20,
              bottom: 0,
              child: Container(
                margin: EdgeInsets.only(top: Dimensions.height15),
                color: Colors.white,
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: GetBuilder<CartContrller>(builder: (cartController) {
                    var _cartList=cartController.getItems;
                    return  ListView.builder(
                      itemCount: _cartList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 100,
                          width: double.maxFinite,
                          margin: EdgeInsets.only(bottom: Dimensions.height20),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap:(){
                                  var popularIndex=Get.find<PopularProductController>().
                                  popularProductList
                                  .indexOf(_cartList[index].product!);
                                  if(popularIndex>=0){
                                    Get.toNamed(RouteHelper.getPopularFood(popularIndex,"popular_food"));
                                  }else{
                                    var recommendeIndex=Get.find<RecommendedProductController>().
                                    recommendedProductList
                                        .indexOf(_cartList[index].product!);
                                    Get.toNamed(RouteHelper.getRecommendedFood(recommendeIndex, "recommended_food" ));
                                  }
                                },
                                child: Container(
                                  height: Dimensions.height20*5,
                                  width: Dimensions.width20*5,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(image: NetworkImage(cartController.getItems[index].image), fit: BoxFit.cover)
                                  ),
                                ),
                              ),
                              SizedBox(width: 10,),
                              Expanded(child: Container(
                                height: Dimensions.height20*5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                      BigText(text: cartController.getItems[index].title, color: Colors.black,),
                                    SmallText(text: cartController.getItems[index].category, color: Colors.black,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        BigText(text: cartController.getItems[index].price.toString(), color: Colors.redAccent,),
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: Dimensions.width10,
                                              right: Dimensions.width10,
                                              top: Dimensions.height10,
                                              bottom: Dimensions.height10
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              GestureDetector(
                                                  onTap:(){
                                                   cartController.addItem(_cartList[index].product!, -1);
                                                  },
                                                  child: AppIcon(icon: Icons.remove,iconSize: Dimensions.iconSize24,
                                                    iconColor: Colors.black, size: 30, backgroundColor: Colors.white,)),
                                              SizedBox(width: Dimensions.width10,),
                                              BigText(text:_cartList[index].quantity.toString(), size: Dimensions.font26, color: Colors.black,),
                                              SizedBox(width: Dimensions.width10,),
                                              GestureDetector(
                                                  onTap: () {
                                                    cartController.addItem(_cartList[index].product!, 1);
                                                  },
                                                  child: AppIcon(icon: Icons.add,iconSize: Dimensions.iconSize24,
                                                    iconColor: Colors.black, size: 30, backgroundColor: Colors.white, )),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ))
                            ],
                          ),
                        );
                      },);
                  },)
                ),
          ))
        ],
      ),
        bottomNavigationBar:
        GetBuilder<CartContrller>(builder: (cartControlller) {
          return    Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(top: Dimensions.height30, bottom: Dimensions.height30,
                right: Dimensions.width20, left: Dimensions.width20),
            decoration: BoxDecoration(
                color: AppColors.buttonBackgroundColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius20*2),
                  topLeft: Radius.circular(Dimensions.radius20*2),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20,
                        right: Dimensions.width20, left: Dimensions.width20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white
                    ),child: Row(
                  children: [

                    SizedBox(width: Dimensions.width10/2,),
                    BigText(text: "\$ ${cartControlller.totalAmount.floorToDouble().toString()}"),
                    SizedBox(width: Dimensions.width10/2,),

                  ],
                )
                ),
                GestureDetector(
                  onTap: () {
                    cartControlller.addToHistory();
                  },
                  child: Container(
                      padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20,
                          right: Dimensions.width20, left: Dimensions.width20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius20),
                          color: AppColors.mainColor
                      ),child: BigText(text: "\Checkout",color: Colors.white,)
                  ),
                )
              ],
            ),
          );
        },)
    );
  }
}
