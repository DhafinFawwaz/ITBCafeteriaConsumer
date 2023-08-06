import 'dart:convert';

LoginResponse loginResponse(String str) =>
  LoginResponse.fromJson(json.decode(str));

class LoginRequest {
  LoginRequest({
    required this.password,
    required this.email,
  });
  late final String password;
  late final String email;
  
  LoginRequest.fromJson(Map<String, dynamic> json){
    password = json['password'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['password'] = password;
    _data['email'] = email;
    return _data;
  }
}

class LoginResponse {
  LoginResponse({
    required this.message,
    required this.data,
  });
  late final String message;
  late final Data? data;
  
  LoginResponse.fromJson(Map<String, dynamic> json){
    message = json['message'];
    data = json['data'] == null ? null : Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['data'] = data!.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.username,
    required this.password,
    required this.email,
    required this.image,
    required this.createdAt,
    required this.modifiedAt,
    required this.token,
  });
  late final int id;
  late final String username;
  late final String password;
  late final String email;
  late final String image;
  late final String createdAt;
  late final String modifiedAt;
  late final String token;
  
  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    username = json['username'];
    password = json['password'];
    email = json['email'];
    image = json['image'];
    createdAt = json['created_at'];
    modifiedAt = json['modified_at'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['username'] = username;
    _data['password'] = password;
    _data['email'] = email;
    _data['image'] = image;
    _data['created_at'] = createdAt;
    _data['modified_at'] = modifiedAt;
    _data['token'] = token;
    return _data;
  }
}

