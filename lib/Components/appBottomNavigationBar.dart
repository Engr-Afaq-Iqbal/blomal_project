import 'package:blomal_project/Config/appConfig.dart';
import 'package:blomal_project/Theme/colors.dart';
import 'package:blomal_project/View/OfferingTabBar/offeringTabBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Utils/dimensions.dart';

class AppBottomNavigationBar extends StatefulWidget {
  const AppBottomNavigationBar({
    super.key,
  });

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  late int currentIndex = 1;
  late List<Widget> screens;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    screens = [
      const OfferingTabBar(),
      const OfferingTabBar(),
      const OfferingTabBar(),
      const OfferingTabBar(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: screens[currentIndex],
      ),
      bottomNavigationBar: Container(
        height: 80.h,
        decoration: BoxDecoration(
            color: kFFFFFF,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 3,
                offset: const Offset(0, 1),
              ),
            ],
            borderRadius: const BorderRadius.only(
              topRight:
                  Radius.circular(Dimensions.PADDING_SIZE_DOUBLE_EXTRA_LARGE),
              topLeft:
                  Radius.circular(Dimensions.PADDING_SIZE_DOUBLE_EXTRA_LARGE),
            )
            // color: const Color(0xff527556).withOpacity(0.90),
            ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                '${imgUrl}home.svg',
                color: (currentIndex == 0)
                    ? primaryBlueColor
                    : secDarkGreyIconColor,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                '${imgUrl}receipt.svg',
                color: (currentIndex == 1)
                    ? primaryBlueColor
                    : secDarkGreyIconColor,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                '${imgUrl}wallet.svg',
                color: (currentIndex == 2)
                    ? primaryBlueColor
                    : secDarkGreyIconColor,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                '${imgUrl}setting.svg',
                color: (currentIndex == 3)
                    ? primaryBlueColor
                    : secDarkGreyIconColor,
              ),
              label: '',
            ),
          ],
          currentIndex: currentIndex,
          elevation: 0,
          unselectedItemColor: secDarkGreyIconColor,
          selectedItemColor: primaryBlueColor,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
