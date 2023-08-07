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

  static getLocationById(int id) {
    if(id == 0) return "GKUB";
    return locationById[id-1];
  }

  static const locationById = [
    'GKUB', 
    'GKUT', 
    'Depan',
    'Borju',
    'SBM',
    'CRCS', 
    'Saraga'
  ];
}