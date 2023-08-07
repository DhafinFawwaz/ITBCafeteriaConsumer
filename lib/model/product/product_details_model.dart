class ProductDetailsResponse {
  ProductDetailsResponse({
    required this.message,
    required this.data,
  });
  late final String message;
  late final Data data;
  
  ProductDetailsResponse.fromJson(Map<String, dynamic> json){
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.shopId,
    required this.locationId,
    required this.categoryId,
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.image,
    required this.createdAt,
    required this.modifiedAt,
    required this.deletedAt,
  });
  late final int id;
  late final int shopId;
  late final int locationId;
  late final int categoryId;
  late final String name;
  late final String description;
  late final double price;
  late final int quantity;
  late final String image;
  late final String createdAt;
  late final String modifiedAt;
  late final String deletedAt;
  
  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    shopId = json['shop_id'];
    locationId = json['location_id'];
    categoryId = json['category_id'];
    name = json['name'];
    description = json['description'];
    price = double.parse(json['price']);
    quantity = json['quantity'];
    image = json['image'];
    createdAt = json['created_at'];
    modifiedAt = json['modified_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['shop_id'] = shopId;
    _data['location_id'] = locationId;
    _data['category_id'] = categoryId;
    _data['name'] = name;
    _data['description'] = description;
    _data['price'] = price;
    _data['quantity'] = quantity;
    _data['image'] = image;
    _data['created_at'] = createdAt;
    _data['modified_at'] = modifiedAt;
    _data['deleted_at'] = deletedAt;
    return _data;
  }
}