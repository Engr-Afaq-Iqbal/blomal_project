import 'package:blomal_project/Config/appConfig.dart';
import 'package:blomal_project/Controller/AuthController/authController.dart';
import 'package:blomal_project/Utils/dimensions.dart';
import 'package:blomal_project/Utils/fontStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../Components/appCustomButton.dart';
import '../../Components/appFormField.dart';
import '../../Theme/colors.dart';
import '../../Utils/utils.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  AuthController authCtrl = Get.find<AuthController>();
  bool isChecked = false;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: GetBuilder<AuthController>(builder: (AuthController authenCtrl) {
          return SizedBox(
            height: Get.height,
            width: Get.width,
            child: Form(
              key: formKey,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Column(
                      children: [
                        size100h,
                        SvgPicture.asset('${imgUrl}blomalBColor.svg'),
                        size20h,
                        customText(
                          text: 'Welcome back,',
                          textStyle: bold18Blue,
                        ),
                        size5h,
                        customText(
                          text: 'Login to your personal account.',
                          textStyle: regular16NavyBlue,
                        ),
                        size40h,
                        AppFormField(
                          controller: authCtrl.emailCtrl,
                          labelText: 'Email Address',
                          hintText: 'Email Address',
                          keyboardType: TextInputType.emailAddress,
                          validator: (String? v) {
                            if (v!.isEmpty) {
                              return 'Email Required';
                            }
                            return null;
                          },
                        ),
                        size15h,
                        AppFormField(
                          controller: authCtrl.passwordCtrl,
                          labelText: 'Password',
                          hintText: 'Password',
                          keyboardType: TextInputType.text,
                          isPasswordField: true,
                          validator: (String? v) {
                            if (v!.isEmpty) {
                              return 'Password Required';
                            }
                            return null;
                          },
                        ),
                        size20h,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customText(
                              text: 'Forget my Password !',
                              textStyle: regular14PrimaryBlue,
                            ),
                            customText(
                              text: 'Forget my Email !',
                              textStyle: regular14PrimaryBlue,
                            ),
                          ],
                        ),
                        size5h,
                        AppCustomButton(
                          title: customText(
                            text: 'Sign In',
                            textStyle: bold14White,
                          ),
                          onTap: loginHandler,
                          borderRadius: 4,
                        ),
                        size20h,
                        Row(
                          children: [
                            SizedBox(
                              height: 18.h,
                              width: 18.w,
                              child: Checkbox(
                                checkColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                // fillColor:
                                //     MaterialStateProperty.resolveWith(getColor),
                                fillColor: MaterialStateProperty.resolveWith(
                                    getFillColor),
                                side:
                                    BorderSide(width: 1.sp, color: Colors.grey),
                                value: authenCtrl.isCheckBox,
                                activeColor: primaryBlueColor,
                                onChanged: (bool? value) {
                                  setState(() {
                                    authenCtrl.isCheckBox = value!;
                                    authenCtrl.update();
                                  });
                                },
                              ),
                            ),
                            size10w,
                            customText(
                                text: 'Keep me signed in',
                                textStyle: regular14NavyBlue),
                          ],
                        ),
                        // AppCheckBox(
                        //   txt: 'Keep me signed in',
                        //   onChanged: (bool? value) {
                        //     setState(() {
                        //       isChecked = value!;
                        //       authenCtrl.isCheckBox = value!;
                        //       authenCtrl.update();
                        //     });
                        //   },
                        //   isChecked: isChecked,
                        // ),
                        const Spacer(),
                        AppStyles.dividerLine(width: Get.width),
                        size30h,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            customText(
                              text: 'Don\'t have an account?',
                              textStyle: regular14NavyBlue,
                            ),
                            size10w,
                            customText(
                              text: 'Request Account',
                              textStyle: bold14Blue,
                            ),
                          ],
                        ),
                        size40h,
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: -50.h,
                    child: SvgPicture.asset(
                      '${imgUrl}bigB.svg',
                      width: 286.w,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  void loginHandler() async {
    if (!formKey.currentState!.validate()) return;

    FocusScope.of(context).unfocus();
    showProgress();
    authCtrl.postLogin();
  }
}
