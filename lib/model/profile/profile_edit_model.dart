class ProfileEditRequest {
  ProfileEditRequest({
    this.id = 0,
    required this.username,
    required this.telephone,
  });
  late int id;
  late final String username;
  late final String telephone;
  
  ProfileEditRequest.fromJson(Map<String, dynamic> json){
    id = json['id'];
    username = json['username'];
    telephone = json['telephone'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['username'] = username;
    _data['telephone'] = telephone;
    return _data;
  }
}

class ProfileEditResponse {
  ProfileEditResponse({
    required this.message,
    required this.data,
  });
  late final String message;
  late final Data data;
  
  ProfileEditResponse.fromJson(Map<String, dynamic> json){
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
    required this.username,
    required this.telephone,
  });
  late final int id;
  late final String username;
  late final String telephone;
  
  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    username = json['username'];
    telephone = json['telephone'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['username'] = username;
    _data['telephone'] = telephone;
    return _data;
  }
}