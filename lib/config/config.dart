class Config {
  static const String appName = "ITBCafeteria";
  // static const String apiURL = "https://itb-cafeteria-server.vercel.app";
  static const String apiURL = "http://192.168.68.17:3000";
  static const String loginURL = apiURL + "/login";
  static const String registerURL = apiURL + "/register";
  static const String profileURL = apiURL + "/profile";
  static const String editProfileURL = apiURL + "/profile/edit";
  static const String editProfileImageURL = apiURL + "/profile/edit/image";
  static const String productSuggestionURL = apiURL + "/product/suggestion";
  
  static const String addOrderURL = apiURL + "/order/add";
  static const String addOrderByIdURL = apiURL + "/order/addById";
  static const String reduceOrderURL = apiURL + "/order/reduce";
  static const String getAllCart= apiURL + "/cart";
}