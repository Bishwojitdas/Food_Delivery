import 'package:flutter/material.dart';
import 'package:food_delivery/controller/popular_product_controller.dart';
import 'package:food_delivery/screens/home/main_food_screen.dart';
import 'package:food_delivery/utils/app_colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';

class PopularFoodDetails extends StatelessWidget {
    final int pageId;
   PopularFoodDetails({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product=Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>().initProduct();


    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [

          //Image Section
          Positioned(
            right: 0, left: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularFoodImageSize,
                decoration: BoxDecoration(
                  image: DecorationImage(image:NetworkImage(product.image),
                      fit: BoxFit.cover)
                ),
              )),

          //Icon Section
          Positioned(
              right: Dimensions.width20,
            top: Dimensions.height45,
            left: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(MainFoodScreen());
                    },
                      child: AppIcon(icon: Icons.arrow_back_ios)
             ),
                  AppIcon(icon: Icons.shopping_cart),
                ],
              ),),

          //Introduction of food:
          // Expandable text widget:-
          Positioned(
              right: 0,
              left: 0,
              top: Dimensions.popularFoodImageSize-20,
              child: Container(
                padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20,
                top: Dimensions.height20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius20),
                    topLeft: Radius.circular(Dimensions.radius20),),
                  color: Colors.white
                ),child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   AppColumn(text: product.title),
                  SizedBox(height: Dimensions.height20,),
                  BigText(text: "Introduce", color: Colors.black,),
                  SizedBox(height: Dimensions.height20,),
                  Container(
                    height: 280,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: ExpandableTextWidget(text:product.description,
                        ),
                    ),
                  )
                ],
              )

          )),




        ],
      ),
      bottomNavigationBar:
      GetBuilder<PopularProductController>(builder: (popularProduct) {
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
                  GestureDetector(
                      onTap:(){
                        popularProduct.setQuantity(false);
                      },
                      child: Icon(Icons.remove, color: AppColors.signColor,)),
                  SizedBox(width: Dimensions.width10/2,),
                  BigText(text: popularProduct.quantity.toString()),
                  SizedBox(width: Dimensions.width10/2,),
                  GestureDetector(
                      onTap:(){
                        popularProduct.setQuantity(true);
                      },
                      child: Icon(Icons.add, color: AppColors.signColor,)),
                ],
              )
              ),
              Container(
                  padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20,
                      right: Dimensions.width20, left: Dimensions.width20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: AppColors.mainColor
                  ),child: BigText(text: "\$${product.price} | Add to cart",color: Colors.white,)
              )
            ],
          ),
        );
      },)
    );
  }
}
