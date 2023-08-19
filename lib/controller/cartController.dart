import 'package:flutter/material.dart';
import 'package:food_delivery/model/cart_model.dart';
import 'package:food_delivery/model/product_model.dart';
import 'package:get/get.dart';

import '../data/repository/cart_repo.dart';
import '../utils/app_colors.dart';

class CartContrller extends GetxController{
  final CartRepo cartRepo;
  CartContrller({required this.cartRepo});

    Map<int, CartModel> _items={};
    Map<int, CartModel> get items=>_items;

    List<CartModel> stroageItems=[];

    void addItem(ProductModel product, int quantity){
      var totalQuantity=0;
     if(_items.containsKey(product.id)){
       _items.update(product.id, (value){
         totalQuantity=value.quantity+quantity;
         return CartModel(
             id: value.id,
             title: value.title,
             price: value.price,
             category: value.category,
             image: value.image,
             quantity: value.quantity+quantity,
             isExit: true,
             product: product,
             time: DateTime.now().toString()
         );
       },);
       if(totalQuantity<=0){
         _items.remove(product.id);
       }
     }else{
       if(quantity>0){
         _items.putIfAbsent(product.id, () {
           return CartModel(
               id: product.id,
               title: product.title,
               price: product.price,
               category: product.category,
               image: product.image,
               quantity: quantity,
               isExit: true,
               product: product,
               time: DateTime.now().toString()
           );}
         );
       }else{
         Get.snackbar("Item count", "You should add at least one item in the cart",
           backgroundColor: AppColors.mainColor,
           colorText: Colors.white,
         );
       }
     }
     cartRepo.addToCartList(getItems);
     update();
    }

   bool existInCart(ProductModel product){
      if(_items.containsKey(product.id)){
        return true;
      }else{
        return false;
      }
    }

    int getQuantity(ProductModel product){
      var quantity=0;
      if(_items.containsKey(product.id)){
        _items.forEach((key, value) {
          if(key==product.id){
           quantity=value.quantity;
          }
        });}
      return quantity;
    }

    int get TotalItems{
      var totalQuantity=0;
      _items.forEach((key, value) {
        totalQuantity=totalQuantity+value.quantity;
      });

      return totalQuantity;
}

List<CartModel> get getItems{
      return _items.entries.map((e) {
        return e.value;
      }, ).toList();

}

num get totalAmount{
      num total=0;
      _items.forEach((key, value) {
        total =total+value.quantity*value.price;
      });
      return total;
}

  List<CartModel> getCartData(){
        setCart=cartRepo.getCartList();
        return stroageItems;
  }

  set setCart(List<CartModel> items ){
        stroageItems=items;
        print("Length of storage items "+stroageItems.length.toString());
        for(int i=0; i!=stroageItems.length; i++){
          _items.putIfAbsent(stroageItems[i].product!.id, () => stroageItems[i]);
        }
    }




  void addToHistory(){
      cartRepo.addToCartHistoryList();
      clear();
  }
  void clear(){
      _items={};
      update();
  }


  List<CartModel> getCartHistoryList(){
      return cartRepo.getCartHistoryList();
  }


  }
