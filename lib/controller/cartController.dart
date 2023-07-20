import 'package:food_delivery/model/cart_model.dart';
import 'package:food_delivery/model/product_model.dart';
import 'package:get/get.dart';

import '../data/repository/cart_repo.dart';

class CartContrller extends GetxController{
  final CartRepo cartRepo;
  CartContrller({required this.cartRepo}){

    Map<int, CartModel> items={};

    void addItem(Product product, int quantity){

    }
  }
}