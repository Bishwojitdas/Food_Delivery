class CartModel {
  CartModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.quantity,
    required this.isExit,
    required this.time,
  });
  late final int id;
  late final String title;
  late final dynamic price;
  late final String description;
  late final String category;
  late final String image;
  late final String time;
  late final int quantity;
  late final bool isExit;

  CartModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
    time = json['time'];
    quantity = json['quantity'];
    isExit = json['isExit'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['price'] = price;
    _data['description'] = description;
    _data['category'] = category;
    _data['image'] = image;
    _data['time'] = time;
    _data['quantity'] = quantity;
    _data['isExit'] = isExit;
    return _data;
  }
}