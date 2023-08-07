class OrderRequest {
  OrderRequest({
    required this.userId,
    required this.shopId,
    required this.productId,
  });
  late int userId;
  late final int shopId;
  late final int productId;
  
  OrderRequest.fromJson(Map<String, dynamic> json){
    userId = json['user_id'];
    shopId = json['shop_id'];
    productId = json['product_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user_id'] = userId;
    _data['shop_id'] = shopId;
    _data['product_id'] = productId;
    return _data;
  }
}

class OrderResponse {
  OrderResponse({
    required this.message,
    required this.data,
  });
  late final String message;
  late final Data data;
  
  OrderResponse.fromJson(Map<String, dynamic> json){
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
    required this.userId,
    required this.shopId,
    required this.productId,
    required this.cartId,
    required this.totalPrice,
  });
  late final int userId;
  late final int shopId;
  late final int productId;
  late final int cartId;
  late final double totalPrice;
  
  Data.fromJson(Map<String, dynamic> json){
    userId = json['user_id'];
    shopId = json['shop_id'];
    productId = json['product_id'];
    cartId = json['cart_id'];
    totalPrice = double.parse(json['total_price']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user_id'] = userId;
    _data['shop_id'] = shopId;
    _data['product_id'] = productId;
    _data['cart_id'] = cartId;
    _data['total_price'] = totalPrice;
    return _data;
  }
}