class SuggestionResponse {
  SuggestionResponse({
    required this.message,
    required this.data,
  });
  late String message;
  late final List<Data> data;
  
  SuggestionResponse.fromJson(Map<String, dynamic> json){
    message = json['message'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.shopId,
    required this.locationId,
    required this.username,
    required this.email,
    required this.telephone,
    required this.image,
    required this.description,
    required this.productArray,
  });
  late final int shopId;
  late final int locationId;
  late final String username;
  late final String email;
  late final String telephone;
  late final String image;
  late final String description;
  late final List<Product> productArray;
  
  Data.fromJson(Map<String, dynamic> json){
    shopId = json['shop_id'];
    locationId = json['location_id'];
    username = json['username'];
    email = json['email'];
    telephone = json['telephone'];
    image = json['shop_image'];
    description = json['shop_description'];
    productArray = List.from(json['product_array']).map((e)=>Product.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['shop_id'] = shopId;
    _data['location_id'] = locationId;
    _data['username'] = username;
    _data['email'] = email;
    _data['telephone'] = telephone;
    _data['shop_image'] = image;
    _data['shop_description'] = description;
    _data['product_array'] = productArray.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Product {
  Product({
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
    required this.productId,
    required this.categoryId,
    required this.description,
  });
  late final String name;
  late final String image;
  late final int price;
  late final int quantity;
  late final int productId;
  late final int categoryId;
  late final String description;
  
  Product.fromJson(Map<String, dynamic> json){
    name = json['name'];
    image = json['image'];
    price = json['price'];
    quantity = json['quantity'];
    productId = json['product_id'];
    categoryId = json['category_id'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['image'] = image;
    _data['price'] = price;
    _data['quantity'] = quantity;
    _data['product_id'] = productId;
    _data['category_id'] = categoryId;
    _data['description'] = description;
    return _data;
  }
}


