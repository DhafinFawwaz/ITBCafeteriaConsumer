import 'dart:convert';

RegisterResponse registerResponse(String str) =>
  RegisterResponse.fromJson(json.decode(str));

class RegisterRequest {
  RegisterRequest({
    required this.username,
    required this.password,
    required this.email,
  });
  late final String username;
  late final String password;
  late final String email;
  
  RegisterRequest.fromJson(Map<String, dynamic> json){
    username = json['username'];
    password = json['password'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['username'] = username;
    _data['password'] = password;
    _data['email'] = email;
    return _data;
  }
}

class RegisterResponse {
  RegisterResponse({
    required this.message,
    required this.data,
  });
  late final String message;
  late final Data? data;
  
  RegisterResponse.fromJson(Map<String, dynamic> json){
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
  });
  late final int id;
  late final String username;
  late final String password;
  late final String email;
  
  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    username = json['username'];
    password = json['password'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['username'] = username;
    _data['password'] = password;
    _data['email'] = email;
    return _data;
  }
}