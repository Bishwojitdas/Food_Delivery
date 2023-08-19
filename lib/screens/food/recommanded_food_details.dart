import 'package:flutter/material.dart';
import 'package:food_delivery/controller/cartController.dart';
import 'package:food_delivery/controller/popular_product_controller.dart';
import 'package:food_delivery/route/route_helper.dart';
import 'package:food_delivery/utils/app_colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';

import '../../controller/recommended_product_controller.dart';
import '../home/main_food_screen.dart';

class RecommandedFoodDetails extends StatelessWidget {
  final int pageId;
  final String? page;
   RecommandedFoodDetails({Key? key, required this.pageId, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product=Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>().initProduct(product, Get.find<CartContrller>());

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.yellow,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.initial);
                  },  child: AppIcon(icon: Icons.clear)
                ),
                GetBuilder<PopularProductController>(builder: (product) {
                  return Stack(
                    children: [
                      GestureDetector(
                          onTap:(){
                            Get.toNamed(RouteHelper.getCartPage());
                            // if(page=="cart_page"){
                            //   Get.toNamed(RouteHelper.getCartPage());
                            // }else{
                            //   Get.toNamed(RouteHelper.getInitial());
                            // }
                  },
                          child: AppIcon(icon: Icons.shopping_cart)),
                      Get.find<PopularProductController>().totalItems>=1?
                      Positioned(
                        right:0, top:0,
                        child: AppIcon(icon: Icons.circle, size: 22, iconColor: Colors.transparent,
                          backgroundColor: AppColors.mainColor,),
                      )
                          :Container(),
                      Get.find<PopularProductController>().totalItems>=1?
                      Positioned(
                        right:5, top:3,
                        child: BigText(text: Get.find<PopularProductController>().totalItems.toString(),
                            color: Colors.white, size: 12),
                      )
                          :Container(),
                    ],
                  );
                },),
              ], ),
            toolbarHeight: 70,
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(20),
              child: Container(
                width: double.maxFinite,

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius20),
                    topLeft: Radius.circular(Dimensions.radius20),
                  )
                ),
                padding: EdgeInsets.only(top: Dimensions.height15, bottom: Dimensions.height20,
                    left: Dimensions.width20, right: Dimensions.width20),
                child: Center(child: BigText(text: product.title, color: Colors.black, size: Dimensions.font26,)),
              ),
            ),
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network (product.image, fit: BoxFit.cover,
              width: double.maxFinite,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                margin: EdgeInsets.only(right: Dimensions.width20, left: Dimensions.width20),
                  child: ExpandableTextWidget(text: product.description)),


              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (controller) {
        return   Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: Dimensions.width20*2.5,
                  right: Dimensions.width20*2.5,
                  top: Dimensions.height10,
                  bottom: Dimensions.height10
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap:(){
                        controller.setQuantity(false);
                      },
                      child: AppIcon(icon: Icons.remove, iconColor: Colors.white, backgroundColor: AppColors.mainColor,)),
                  BigText(text: "\$${product.price}  X  ${controller.inCartItems}" , size: Dimensions.font26, color: Colors.black,),
                  GestureDetector(
                      onTap: () {
                        controller.setQuantity(true);
                      },
                      child: AppIcon(icon: Icons.add, iconColor: Colors.white, backgroundColor: AppColors.mainColor,)),
                ],
              ),
            ),
            Container(
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
                      ),child: Icon(Icons.favorite, size: Dimensions.iconSize24, color: AppColors.mainColor,)
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.addItem(product);
                    },
                    child: Container(
                        padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20,
                            right: Dimensions.width20, left: Dimensions.width20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.radius20),
                            color: AppColors.mainColor
                        ),child: BigText(text: "\$${product.price} | Add to cart",color: Colors.white,)
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      },)
    );
  }
}
