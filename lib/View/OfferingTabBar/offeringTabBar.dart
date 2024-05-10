import 'package:blomal_project/Config/appConfig.dart';
import 'package:blomal_project/Controller/OfferingController/offeringController.dart';
import 'package:blomal_project/Theme/colors.dart';
import 'package:blomal_project/Utils/fontStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Utils/dimensions.dart';

class OfferingTabBar extends StatefulWidget {
  const OfferingTabBar({super.key});

  @override
  State<OfferingTabBar> createState() => _OfferingTabBarState();
}

class _OfferingTabBarState extends State<OfferingTabBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 190.h,
              decoration: BoxDecoration(
                  color: secBorderColor,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(
                          Dimensions.PADDING_SIZE_DOUBLE_EXTRA_LARGE),
                      bottomRight: Radius.circular(
                          Dimensions.PADDING_SIZE_DOUBLE_EXTRA_LARGE))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: 40.w, right: 40.w, top: 60.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                          '${imgUrl}blomalBColor.svg',
                          width: 24.w,
                          height: 39.h,
                        ),
                        SvgPicture.asset(
                          '${imgUrl}bell.svg',
                          width: 24.w,
                          height: 24.h,
                        ),
                      ],
                    ),
                  ),
                  TabBar(
                    tabs: OfferingController.offeringTabsList.map((orderTab) {
                      return Tab(text: orderTab.label);
                    }).toList(),
                    labelStyle: bold16Blue,
                    dividerColor: Colors.transparent,
                    indicatorSize: TabBarIndicatorSize.tab,
                    // labelPadding: const EdgeInsets.symmetric(horizontal: 0),
                    indicatorPadding:
                        const EdgeInsets.symmetric(horizontal: 35),
                    unselectedLabelColor: primaryBlueColor.withOpacity(0.5),
                    labelColor: primaryBlueColor,
                    indicatorColor: primaryBlueColor,
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                  children: OfferingController.offeringTabsList
                      .map((orderTab) => orderTab.page)
                      .toList()),
            ),
          ],
        ),
      ),
    );
  }
}
