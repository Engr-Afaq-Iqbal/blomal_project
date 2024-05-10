import 'package:blomal_project/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

Logger logger = Logger();

showProgress() {
  Get.defaultDialog(
    title: "Loading",
    content: Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: progressIndicator(),
    ),
    barrierDismissible: true,
  );
}

progressIndicator({double? height, double? width}) =>
    Builder(builder: (context) {
      return Center(
        child: SizedBox(
          height: height,
          width: width,
          child: CircularProgressIndicator(
            backgroundColor: Colors.grey,
            color: primaryBlueColor,
            strokeWidth: 1.5,
          ),
        ),
      );
    });

stopProgress() {
  if (Get.isDialogOpen!) Get.back();
}

showToast(String msg, {BuildContext? context}) async {
  await Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: primaryBlueColor,
      textColor: kFFFFFF,
      fontSize: 12.0);
}
