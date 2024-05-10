import '../Config/appConfig.dart';

class ApiUrls {
  // login / get access token
  static String authLoginAPI = "${AppConfig.baseUrl}auth/login";
  static String offeringAPI = "${AppConfig.baseUrl}public/offerings";
}
