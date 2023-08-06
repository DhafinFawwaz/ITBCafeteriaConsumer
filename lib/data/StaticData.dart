import 'package:flutter/material.dart';
import 'package:itb_cafeteria_consumer/model/profile/profile_model.dart';

class StaticData {
  static ProfileResponse profileData = ProfileResponse(message: "", data: Data(
    id: 0,
    username: "",
    password: "",
    email: "",
    image: "",
    telephone: "",
    createdAt: DateTime.now(),
    modifiedAt: DateTime.now(),
  ));
}