import 'package:flutter/material.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/model/product_model.dart';
import 'package:food_delivery/utils/app_colors.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController{
final PopularProductRepo popularProductRepo;
PopularProductController({required this.popularProductRepo});

List<Product> _popularProductList=[];
List<Product>get popularProductList=>_popularProductList ;

bool _isLoaded=false;
bool get isLoaded=>_isLoaded;

int _quantity=0;
int get quantity=>_quantity;

int _inCartItem=0;
int get inCartItem=>_inCartItem+_quantity;

Future<void> getPopularProductList()async{
  Response response= await popularProductRepo.getPopularProductList();
  if(response.statusCode==200){
    _popularProductList=[];
    for(var item in response.body){
      _popularProductList.add(Product.fromJson(item));
    }
    _isLoaded=true;
    update();
  }
}

void setQuantity(bool isIncrement){
  if(isIncrement){
    print("increment ${_quantity.toString()}");
    _quantity=checkQuantity(_quantity+1);

  }else{
    _quantity=checkQuantity(_quantity-1);
    print("decrement ${_quantity.toString()}");
  }
  update();
}

  int checkQuantity(int quantity){
  if(quantity<0){
    Get.snackbar("Item count ${_quantity}", "You can't reduce more!",
    backgroundColor: AppColors.mainColor,
      colorText: Colors.white,
    );
    return 0;
  }else if(quantity>20){
    Get.snackbar("Item count", "You can't add more!",
      backgroundColor: AppColors.mainColor,
      colorText: Colors.white,
    );
    return 20;
  }else{
    return quantity;
  }
}

void initProduct(){
  _quantity=0;
  _inCartItem=0;
  
}

}