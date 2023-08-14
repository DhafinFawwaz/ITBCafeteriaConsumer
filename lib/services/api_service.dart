import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:itb_cafeteria_consumer/model/auth/login_model.dart';
import 'package:itb_cafeteria_consumer/model/auth/register_model.dart';
import 'package:itb_cafeteria_consumer/model/cart/cart_model.dart';
import 'package:itb_cafeteria_consumer/model/order/order_model.dart';
import 'package:itb_cafeteria_consumer/model/product/suggestion_model.dart';
import 'package:itb_cafeteria_consumer/model/profile/profile_edit_model.dart';
import 'package:itb_cafeteria_consumer/model/profile/profile_model.dart';
import 'package:itb_cafeteria_consumer/services/shared_service.dart';

import '../config/config.dart';

class APIService {
  static var client = http.Client();

  static Future<LoginResponse> login(LoginRequest model) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': '*/*'
    };
    var uri = Uri.parse(Config.loginURL);

    var response = await client.post(
      uri,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );
    if (response.statusCode == 200) {
      await SharedService.setLoginDetails(loginResponse(response.body));
    }
    return LoginResponse.fromJson(jsonDecode(response.body));
  }

  static Future<RegisterResponse> register(RegisterRequest model) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ',
    };
    
    var url = Uri.parse(Config.registerURL);
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );
    return registerResponse(response.body);
  }

  static Future<ProfileResponse> getUserProfile() async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer ${loginDetails!.data!.token}',
    };

    var url = Uri.parse('${Config.profileURL}?id=${loginDetails.data!.id}');
    
    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    return ProfileResponse.fromJson(jsonDecode(response.body));
  }


  static Future<ProfileEditResponse> editUserProfile(ProfileEditRequest model) async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer ${loginDetails!.data!.token}',
    };

    var uri = Uri.parse(Config.editProfileURL);
    model.id = loginDetails.data!.id;

    var response = await client.post(
      uri,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    return ProfileEditResponse.fromJson(jsonDecode(response.body));
  }

  static Future<String> editUserImageProfile(String path) async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer ${loginDetails!.data!.token}',
    };

    var uri = Uri.parse('${Config.editProfileImageURL}?id=${loginDetails.data!.id}');


    http.MultipartRequest request = http.MultipartRequest("POST", uri);

    http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
        'image', path);

    request.files.add(multipartFile);
    request.headers.addAll(requestHeaders);

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    return jsonDecode(response.body)["data"]["image"];
  }

  static Future<SuggestionResponse> getProductSuggestion(int locationId, int categoryId) async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer ${loginDetails!.data!.token}',
    };

    var url = Uri.parse('${Config.productSuggestionURL}?location_id=$locationId&category_id=$categoryId');
    
    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    return SuggestionResponse.fromJson(jsonDecode(response.body));
  }


  static Future<OrderResponse> addOrder(OrderRequest model) async {
    var loginDetails = await SharedService.loginDetails();

    model.userId = loginDetails!.data!.id;

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer ${loginDetails!.data!.token}'
    };
    var uri = Uri.parse(Config.addOrderURL);

    var response = await client.post(
      uri,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    return OrderResponse.fromJson(jsonDecode(response.body));
  }

  static Future addOrderById(int orderId) async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer ${loginDetails!.data!.token}'
    };
    var uri = Uri.parse('${Config.addOrderByIdURL}?order_id=$orderId');

    var response = await client.post(
      uri,
      headers: requestHeaders,
    );
  }

  static Future reduceOrder(int orderId) async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer ${loginDetails!.data!.token}'
    };
    var uri = Uri.parse('${Config.reduceOrderURL}?order_id=$orderId');

    var response = await client.post(
      uri,
      headers: requestHeaders,
    );
  }

  static Future<CartResponse> getAllCart() async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer ${loginDetails!.data!.token}',
    };

    var url = Uri.parse('${Config.getAllCart}?user_id=${loginDetails.data!.id}');
    
    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    return CartResponse.fromJson(jsonDecode(response.body));
  }

  static Future payAllCart() async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer ${loginDetails!.data!.token}'
    };
    var uri = Uri.parse('${Config.payAllCart}?user_id=${loginDetails.data!.id}');

    var response = await client.post(
      uri,
      headers: requestHeaders,
    );

    print("Payment done successfully");
  }
}