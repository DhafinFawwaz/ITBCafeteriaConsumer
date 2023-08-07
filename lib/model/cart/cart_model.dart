class CartResponse {
  CartResponse({
    required this.message,
    required this.data,
  });
  late final String message;
  late final List<Data> data;
  
  CartResponse.fromJson(Map<String, dynamic> json){
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
    required this.userId,
    required this.shopId,
    required this.username,
    required this.image,
    required this.paymentMethodId,
    required this.paymentStatusId,
    required this.cartStatusId,
    required this.pickupAt,
    required this.totalPrice,
    required this.note,
    required this.orderItem,
  });
  late final int userId;
  late final int shopId;
  late final String username;
  late final String image;
  late final int paymentMethodId;
  late final int paymentStatusId;
  late final int cartStatusId;
  late final String pickupAt;
  late final double totalPrice;
  late final String note;
  late final List<OrderItem> orderItem;
  
  Data.fromJson(Map<String, dynamic> json){
    userId = json['user_id'];
    shopId = json['shop_id'];
    username = json['shop_name'];
    image = json['shop_image'];
    paymentMethodId = json['payment_method_id'];
    paymentStatusId = json['payment_status_id'];
    cartStatusId = json['cart_status_id'];
    pickupAt = json['pickup_at'];
    totalPrice = double.parse(json['total_price']);
    note = json['note'];
    orderItem = List.from(json['order_item']).map((e)=>OrderItem.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user_id'] = userId;
    _data['shop_id'] = shopId;
    _data['shop_name'] = username;
    _data['shop_image'] = image;
    _data['payment_method_id'] = paymentMethodId;
    _data['payment_status_id'] = paymentStatusId;
    _data['cart_status_id'] = cartStatusId;
    _data['pickup_at'] = pickupAt;
    _data['total_price'] = totalPrice;
    _data['note'] = note;
    _data['order_item'] = orderItem.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class OrderItem {
  OrderItem({
    required this.orderItemId,
    required this.cartId,
    required this.quantity,
    required this.productId,
    required this.productName,
    required this.productImage,
    required this.productPrice,
  });
  late final int orderItemId;
  late final int cartId;
  late final int quantity;
  late final int productId;
  late final String productName;
  late final String productImage;
  late final num productPrice;
  
  OrderItem.fromJson(Map<String, dynamic> json){
    orderItemId = json['order_item_id'];
    cartId = json['cart_id'];
    quantity = json['quantity'];
    productId = json['product_id'];
    productName = json['product_name'];
    productImage = json['product_image'];
    productPrice = json['product_price'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['order_item_id'] = orderItemId;
    _data['cart_id'] = cartId;
    _data['quantity'] = quantity;
    _data['product_id'] = productId;
    _data['product_name'] = productName;
    _data['product_image'] = productImage;
    _data['product_price'] = productPrice;
    return _data;
  }
}