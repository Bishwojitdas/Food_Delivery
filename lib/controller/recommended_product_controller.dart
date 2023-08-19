import 'package:flutter/material.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/data/repository/recommended_product_repo.dart';
import 'package:food_delivery/model/product_model.dart';
import 'package:food_delivery/model/recommended_product_model.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';
import 'cartController.dart';

class RecommendedProductController extends GetxController{
final RecommendedProductRepo recommendedProductRepo;
RecommendedProductController({required this.recommendedProductRepo});

List<ProductModel> _recommendedProductList=[];
List<ProductModel>get recommendedProductList=>_recommendedProductList ;


bool _isLoaded=false;
bool get isLoaded=>_isLoaded;

Future<void> getRecommendedProductList()async{
  Response response= await recommendedProductRepo.getRecommendedProductList();
  if(response.statusCode==200){
    _recommendedProductList=[];
    for(var item in response.body){
      _recommendedProductList.add(ProductModel.fromJson(item));
    }
    _isLoaded=true;
    update();
  }
}
}