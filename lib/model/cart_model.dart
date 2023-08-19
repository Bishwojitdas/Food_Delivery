import 'package:food_delivery/model/product_model.dart';

class CartModel {
  CartModel({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.image,
    required this.quantity,
    required this.isExit,
    required this.time,
    required this.product,
  });
  late final int id;
  late final String title;
  late final dynamic price;
  late final String category;
  late final String image;
  late final String time;
  late final int quantity;
  late final bool isExit;
  ProductModel? product;

  CartModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    price = json['price'];
    category = json['category'];
    image = json['image'];
    time = json['time'];
    quantity = json['quantity'];
    isExit = json['isExit'];
    product =ProductModel.fromJson(json["product"]);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['price'] = price;
    _data['category'] = category;
    _data['image'] = image;
    _data['time'] = time;
    _data['quantity'] = quantity;
    _data['isExit'] = isExit;
    _data['product']=product!.toJson();
    return _data;
  }

}
