import 'package:blomal_project/Controller/OfferingController/offeringController.dart';
import 'package:blomal_project/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../Components/blinkingLogo.dart';
import 'Widget/financeWidget.dart';

class FinanceOffering extends StatefulWidget {
  const FinanceOffering({super.key});

  @override
  State<FinanceOffering> createState() => _FinanceOfferingState();
}

class _FinanceOfferingState extends State<FinanceOffering> {
  OfferingController offeringCtrl = Get.find<OfferingController>();
  RefreshController offerRefreshCtrl = RefreshController();
  final ScrollController _scrollController = ScrollController();
  int page = 1;
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      offeringCtrl.fetchOfferingList(page: page);
    });
    _scrollController.addListener(_scrollListner);
  }

  Future<void> _scrollListner() async {
    if (isLoading) return;
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      debugPrint('call');
      setState(() {
        isLoading = true;
      });
      if (page <= (offeringCtrl.offeringModel?.meta?.total ?? 0)) {
        page = page + 1;
        offeringCtrl.fetchOfferingList(page: page);
        setState(() {
          isLoading = false;
        });
      }
    } else {
      debugPrint('Dont call');
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<OfferingController>(
          builder: (OfferingController offeringCtrl) {
        return Column(
          children: [
            // size20h,
            SizedBox(
              height: 660.h,
              child: (offeringCtrl.offeringModel != null)
                  ? (offeringCtrl.offeringModel!.offeringModelList.isEmpty)
                      ? BlinkingLogoProgressIndicator(
                          height: 200.h,
                          width: 200.w,
                        )
                      : SmartRefresher(
                          controller: offerRefreshCtrl,
                          header: WaterDropHeader(
                            waterDropColor: primaryBlueColor,
                          ),
                          onRefresh: () {
                            offeringCtrl.offeringModel = null;
                            page = 1;
                            offeringCtrl
                                .fetchOfferingList(page: page)
                                .then((_) {
                              offerRefreshCtrl.refreshCompleted();
                            });
                            offeringCtrl.update();
                          },
                          child: ListView.builder(
                              controller: _scrollController,
                              shrinkWrap: true,
                              itemCount: offeringCtrl
                                  .offeringModel?.offeringModelList.length,
                              itemBuilder: (context, index) {
                                return FinanceWidget(
                                  offeringModelList: offeringCtrl
                                      .offeringModel?.offeringModelList[index],
                                );
                              }),
                        )
                  : Padding(
                      padding: const EdgeInsets.all(40),
                      child: BlinkingLogoProgressIndicator()),
            )
          ],
        );
      }),
    );
  }
}
