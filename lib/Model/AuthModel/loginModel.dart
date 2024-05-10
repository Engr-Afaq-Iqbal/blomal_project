// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  bool? success;
  Data? data;

  LoginModel({
    this.success,
    this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        success: json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
      };
}

class Data {
  String? type;
  String? accessToken;
  int? expireIn;
  String? refreshToken;

  Data({
    this.type,
    this.accessToken,
    this.expireIn,
    this.refreshToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        type: json["type"],
        accessToken: json["access_token"],
        expireIn: json["expire_in"],
        refreshToken: json["refresh_token"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "access_token": accessToken,
        "expire_in": expireIn,
        "refresh_token": refreshToken,
      };
}
