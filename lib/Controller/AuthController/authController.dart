import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Components/appBottomNavigationBar.dart';
import '../../Model/AuthModel/loginModel.dart';
import '../../Services/apiServices.dart';
import '../../Services/apiUrls.dart';
import '../../Utils/utils.dart';

class AuthController extends GetxController {
  bool isCheckBox = false;
  String? token;
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  String generateUniqueRequestId() {
    const uuidPattern = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx';
    var rng = Random();

    String replaceChar(String c) {
      var r = rng.nextInt(16);
      var v = c == 'x' ? r : (r & 0x3 | 0x8);
      return v.toRadixString(16);
    }

    return uuidPattern.replaceAllMapped(
        RegExp('[xy]'), (match) => replaceChar(match.group(0)!));
  }

  String generateTimeStamp() {
    // Generate current timestamp in seconds
    var timestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    return timestamp.toString();
  }

  LoginModel? loginModel;
  Future<bool?> postLogin() async {
    Map<String, String> _field = {
      "email": emailCtrl.text,
      "password": passwordCtrl.text,
    };

    return await ApiServices.postMethod(
      feedUrl: ApiUrls.authLoginAPI,
      fields: _field,
      xRequestId: generateUniqueRequestId(),
      xRequestTimeStamp: generateTimeStamp(),
    ).then((_res) {
      if (_res == null) {
        stopProgress();
        showToast('Credentials are incorrect!\nPlease enter correct ones!');
        return null;
      }

      loginModel = loginModelFromJson(_res);
      if (isCheckBox == true) {
        setToken('${loginModel?.data?.accessToken}');
      }
      Get.offAll(const AppBottomNavigationBar());
      stopProgress();
      return true;
    }).onError((error, stackTrace) {
      debugPrint('Error => $error');
      logger.e('StackTrace => $stackTrace');
      showToast('Try Again!');
      throw '$error';
    });
  }

  getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.containsKey("token")
        ? sharedPreferences.getString("token")!
        : '';
  }

  setToken(
    String token,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("token", '${loginModel?.data?.accessToken}');
  }
}
