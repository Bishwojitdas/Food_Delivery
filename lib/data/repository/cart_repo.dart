import 'dart:convert';

import 'package:food_delivery/model/cart_model.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/api_client.dart';

  class CartRepo extends GetxService{
  final SharedPreferences sharedPreferences;

    CartRepo({required this.sharedPreferences}){

    }

    List<String> cart=[];
    List<String> cartHistory=[];


  List<CartModel> getCartList(){
    List<String> carts=[];
    if(sharedPreferences.containsKey(AppConstants.CART_LIST)){
      carts= sharedPreferences.getStringList(AppConstants.CART_LIST)!;
      print("Inside get cartlist"+carts.toString());
    }
    List<CartModel> cartList=[];
    carts.forEach((element) {
      cartList.add(CartModel.fromJson(jsonDecode(element)));
    });
    return cartList;
  }

    void addToCartList(List<CartModel> cartList){
    /*sharedPreferences.remove(AppConstants.CART_LIST);
    sharedPreferences.remove(AppConstants.CART_HISTORY_LIST);*/
      cart=[];
      cartList.forEach((element) {
        element.time;
        return cart.add(jsonEncode(element));
      });
      sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
      print(sharedPreferences.getStringList(AppConstants.CART_LIST));
      getCartList();
}


    List<CartModel> getCartHistoryList(){
      if(sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)){
        cartHistory=[];
        cartHistory=sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
      }
      List<CartModel> cartListHistory=[];
      cartHistory.forEach((element) {
        cartListHistory.add(CartModel.fromJson(jsonDecode(element)));
      });
      return cartListHistory;
    }

    void addToCartHistoryList(){
    if(sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)){
      cartHistory=sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
    }
      for(int i=0; i<cart.length; i++){
        print("History List"+cart[i]);
        cartHistory.add(cart[i]);
      }
      removeCart();
      sharedPreferences.setStringList(AppConstants.CART_HISTORY_LIST, cartHistory);
      print("The length of history list is "+getCartHistoryList().length.toString());
      for(int j=0; j<getCartHistoryList().length;j++){
        print("The time for the order is "+getCartHistoryList()[j].time.toString());
      }
    }

    void removeCart(){
    cart=[];
    sharedPreferences.remove(AppConstants.CART_LIST);
    }

}