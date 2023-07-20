import 'package:flutter/material.dart';
import 'package:food_delivery/screens/home/food_page_body.dart';
import 'package:food_delivery/utils/app_colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';

class MainFoodScreen extends StatefulWidget {
  const MainFoodScreen({Key? key}) : super(key: key);

  @override
  State<MainFoodScreen> createState() => _MainFoodScreenState();
}

class _MainFoodScreenState extends State<MainFoodScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          //Showing the header;
          Container(
            child: Container(
              margin:  EdgeInsets.only(top: Dimensions.height45, bottom: Dimensions.height15),
              padding:  EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                       BigText(text: "Bangladesh", ),
                      Row(
                        children: [
                          SmallText(text: "Narshingdi", color: Colors.black54,),
                          Icon(Icons.arrow_drop_down_rounded, size: Dimensions.iconSize24,)
                        ],
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      height: Dimensions.height45,
                      width: Dimensions.height45,
                      decoration:  BoxDecoration(
                          borderRadius:  BorderRadius.all(Radius.circular(Dimensions.radius15)),
                          color: AppColors.mainColor
                      ),
                      child: Icon(Icons.search, color: Colors.white, size: Dimensions.iconSize24,),
                    ),
                  )
                ],
              ),
            ),
          ),

          //Showing the body;
          const Expanded(
              child: SingleChildScrollView(
                  child: FoodPageBody())),
        ],
      ),
    );
  }
}
