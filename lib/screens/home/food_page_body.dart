
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/controller/popular_product_controller.dart';
import 'package:food_delivery/controller/recommended_product_controller.dart';
import 'package:food_delivery/model/product_model.dart';
import 'package:food_delivery/route/route_helper.dart';
import 'package:food_delivery/screens/food/popular_food_details.dart';
import 'package:food_delivery/utils/app_colors.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_and_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';

import '../../utils/dimensions.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController=PageController(viewportFraction: 0.85);
  var _currentPageValue=0.0;
  double _scaleFactor=0.8;
  double _height=Dimensions.pageViewContainer;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue=pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [


        GetBuilder<PopularProductController>(builder: (popularProducts) {
           //Slider Screen:
          return popularProducts.isLoaded? Container(
            height: Dimensions.pageView,
            child: PageView.builder(
              controller: pageController,
              itemCount: popularProducts.popularProductList.length,
              itemBuilder: (context, position) {
                return _buildPageItem(position, popularProducts.popularProductList[position]);

              },),
          ):CircularProgressIndicator();
        },),


        //Dots Screen
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return
            DotsIndicator(
            dotsCount: popularProducts.popularProductList.isEmpty?1:popularProducts.popularProductList.length,
            position: _currentPageValue.toInt(),
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.square(7.0),
              activeSize: const Size(14.0, 7.0),
              activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0)),
            ),);
        },),


        //Popular Text:
        SizedBox(height: Dimensions.height30,),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Popular"),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin:const EdgeInsets.only(bottom: 3),
                child: BigText(text: ".", color: Colors.black26,),
              ), SizedBox(width: Dimensions.width10,),
              Container(
                margin:const EdgeInsets.only(bottom: 2),
                child: SmallText(text: "Food pairing", color: Colors.black26,),
              )
            ],
          ),
        ),

        //List of food and images:-
        GetBuilder<RecommendedProductController>(builder: (recommendedProduct) {
          return  recommendedProduct.isLoaded?Container(
            child: ListView.builder(
              shrinkWrap: true,
              physics:const NeverScrollableScrollPhysics(),
              itemCount: recommendedProduct.recommendedProductList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                onTap: () {
                  Get.toNamed(RouteHelper.getRecommendedFood(index, "home"));
                },  child: Container(
                  margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, bottom: Dimensions.height10),
                  child: Row(
                    children: [
                      Container(
                        height: Dimensions.listViewImageSize,
                        width: Dimensions.listViewImageSize,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.radius20),
                            color: Colors.white,
                            image: DecorationImage(image: NetworkImage(recommendedProduct.recommendedProductList[index].image!),
                                fit: BoxFit.cover)
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: Dimensions.listViewITextContSize,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topRight: Radius.circular(Dimensions.radius20),
                                bottomRight: Radius.circular(Dimensions.radius20)
                            ),
                            color: Colors.white,
                          ),padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BigText(text: recommendedProduct.recommendedProductList[index].title!,color: Colors.black,),
                              SizedBox(height: Dimensions.height10,),
                              SmallText(text:recommendedProduct.recommendedProductList[index].category, color: Colors.black),
                              SizedBox(height: Dimensions.height10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const IconAndTextWidget(icon: Icons.circle, text: "Normal", color: Colors.black54, iconColor: Colors.orangeAccent),
                                  SizedBox(width:  Dimensions.width10,),
                                  const IconAndTextWidget(icon: Icons.location_on, text: "1.7 km", color: Colors.black54, iconColor: Colors.cyanAccent),
                                  SizedBox(width: Dimensions.width10,),
                                  const IconAndTextWidget(icon: Icons.watch_later_outlined, text: "32 min", color: Colors.black54, iconColor: Colors.red),
                                  SizedBox(width:  Dimensions.width10,),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                );
              },),
          ):CircularProgressIndicator();
        },)
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel popularProductList, ){
    Matrix4 matrix=new Matrix4.identity();
    if(index==_currentPageValue.floor()){
      var currScale=1-(_currentPageValue-index)*(1-_scaleFactor);
      var currTrans=_height*(1-currScale)/2;
      matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }else if(index==_currentPageValue.floor()+1){
      var currScale=_scaleFactor+(_currentPageValue-index+1)*(1-_scaleFactor);
      var currTrans=_height*(1-currScale)/2;
      matrix=Matrix4.diagonal3Values(1, currScale, 1);
      matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    }else if(index==_currentPageValue.floor()-1){
      var currScale=1-(_currentPageValue-index)*(1-_scaleFactor);
      var currTrans=_height*(1-currScale)/2;
      matrix=Matrix4.diagonal3Values(1, currScale, 1);
      matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    else{
      var currScale=0.8;
      matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 1);

    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteHelper.getPopularFood(index, "popular_food"));
            },
            child: Container(
              height: Dimensions.pageViewContainer,
              margin: const EdgeInsets.only(left: 5, right: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: Colors.orangeAccent,
                  // color:index.isEven?const Color(0xFF69c5df):const Color(0xFF9294cc),
                  image:  DecorationImage(image: NetworkImage(
                      popularProductList.image),
                      fit: BoxFit.cover)
              ),
            ),
          ),
          Align(alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              margin:  EdgeInsets.only(left:  Dimensions.width30, right: Dimensions.width30,
                  bottom: Dimensions.height20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  boxShadow:const [
                     BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5)
                  ),
                     BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5)
                  ),
                  ],
                  color:Colors.white
              ),
              child: Container(
                padding:  EdgeInsets.only(left:  Dimensions.width15, right:  Dimensions.width15, top: Dimensions.height15),
                child:  AppColumn(text: popularProductList.title),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
