import 'dart:async';

import 'package:blomal_project/Controller/AuthController/authController.dart';
import 'package:blomal_project/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Components/appBottomNavigationBar.dart';
import '../../Config/appConfig.dart';
import '../../Utils/dimensions.dart';
import '../Auth/signInScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AuthController authCtrl = Get.find<AuthController>();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      authCtrl.getToken();
    });
    Timer(const Duration(seconds: 5), () {
      if (authCtrl.token == '' || authCtrl.token == null) {
        Get.offAll(const SignInScreen());
      } else {
        Get.offAll(const AppBottomNavigationBar());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: primaryBlueColor.withOpacity(0.8),
          image: DecorationImage(
              image: AssetImage('${imgUrl}dottedBg2.png'),
              // Replace with your image path
              fit: BoxFit.fill,
              scale: 4
              // Adjust the fit as needed
              ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('${imgUrl}blomalB.svg'),
            size10w,
            SvgPicture.asset('${imgUrl}blomalTitle.svg'),
          ],
        ),
      ),
    );
  }
}
