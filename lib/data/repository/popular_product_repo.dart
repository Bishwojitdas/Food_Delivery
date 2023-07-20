import 'package:flutter/material.dart';
import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/model/product_model.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService{
  final ApiClient apiClient;

  PopularProductRepo({required this.apiClient});

Future<Response> getPopularProductList()async{
  return await apiClient.getData(AppConstants.POPULAR_PRODUCT_URI);
}


//   Future<List<Product>>? getProducts() async {
//     try {
//       Response response = await apiClient.getData(AppConstants.BASE_URL+AppConstants.POPULAR_PRODUCT_URI);
//       List<Product> products = [];
//       if(response.statusCode==200){
//
//         for (var item in response.body) {
//           products.add(Product.fromJson(item));
//           print("Length ${products.length}");
//           return products;
//         }
//
//       } return products;
//       }
//       catch (error, stacktrace) {
//       print("Exception occured: $error stackTrace: $stacktrace");
//       return [];
//     }
//   }
}