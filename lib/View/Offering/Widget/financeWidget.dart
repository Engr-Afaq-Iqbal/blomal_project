import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../Components/appGradientLinearProgressIndicator.dart';
import '../../../Components/blinkingLogo.dart';
import '../../../Config/appConfig.dart';
import '../../../Model/OfferingModel/offeringModel.dart';
import '../../../Theme/colors.dart';
import '../../../Utils/dimensions.dart';
import '../../../Utils/fontStyles.dart';
import '../../../Widgets/iconWithText.dart';
import '../../../Widgets/titleWithTextGradient.dart';

class FinanceWidget extends StatefulWidget {
  OfferingModelList? offeringModelList;
  FinanceWidget({super.key, this.offeringModelList});

  @override
  State<FinanceWidget> createState() => _FinanceWidgetState();
}

class _FinanceWidgetState extends State<FinanceWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        size20h,
        Container(
          height: 250.h,
          // width: 440.w,
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT)),
          child: Stack(
            children: [
              if (widget
                      .offeringModelList?.attributes?.heroImage?.originalUrl !=
                  null)
                ClipRRect(
                  borderRadius:
                      BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
                  child: CachedNetworkImage(
                    height: 250.h,
                    width: Get.width,
                    imageUrl:
                        '${widget.offeringModelList?.attributes?.heroImage?.originalUrl}',
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        BlinkingLogoProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        BlinkingLogoProgressIndicator(),
                  ),
                ),
              if (widget
                      .offeringModelList?.attributes?.heroImage?.originalUrl ==
                  null)
                BlinkingLogoProgressIndicator(),
              Positioned(
                bottom: 0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SvgPicture.asset(
                    '${imgUrl}shadowRectangle.svg',
                    width: 350.w,
                    // fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconWithText(
                          imageUrl: 'calender.svg',
                          txt:
                              '${widget.offeringModelList?.attributes?.openDate}',
                        ),
                        IconWithText(
                          imageUrl: 'openLock.svg',
                          txt: '48 Month',
                        ),
                      ],
                    ),
                    const Spacer(),
                    customText(
                      text: '${widget.offeringModelList?.attributes?.slug}',
                      textStyle: bold16White,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customText(
                          text: 'Fund Progress',
                          textStyle: bold12White,
                        ),
                        Container(
                          height: 25.h,
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          decoration: BoxDecoration(
                              color: primaryBlueColor,
                              borderRadius: BorderRadius.circular(
                                Dimensions.RADIUS_DEFAULT,
                              )),
                          child: Center(
                            child: customText(
                              text: '45%',
                              textStyle: bold12White,
                            ),
                          ),
                        )
                      ],
                    ),
                    size10h,
                    const GradientLinearProgressIndicator(),
                  ],
                ),
              )
            ],
          ),
        ),
        size20h,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TitleWithTextGradient(
                title: 'Fund Provider:',
                txt: '${widget.offeringModelList?.attributes?.statusTitle}',
              ),
              TitleWithTextGradient(
                title: 'Share Price:',
                txt:
                    '${widget.offeringModelList?.attributes?.pricePerShare?.formatted}',
              ),
            ],
          ),
        ),
        size20h,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TitleWithTextGradient(
                title: 'Raised:',
                txt:
                    '${widget.offeringModelList?.attributes?.raisedAmount?.formatted}',
              ),
              TitleWithTextGradient(
                title: 'Total Coverage:',
                txt:
                    '${widget.offeringModelList?.attributes?.raisedAmountWithPendingFormatted}',
              ),
            ],
          ),
        ),
        size20h,
      ],
    );
  }
}
