import 'dart:math';

import 'package:blomal_project/Model/OfferingModel/offeringModel.dart';
import 'package:blomal_project/View/Offering/financeOffering.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../Model/NavBarModel/navBarModel.dart';
import '../../Services/apiServices.dart';
import '../../Services/apiUrls.dart';
import '../../Utils/utils.dart';

enum OfferingTabsEnum {
  Offering,
}

class OfferingController extends GetxController {
  static List<NavBarModel> get offeringTabsList => [
        NavBarModel(
          identifier: OfferingTabsEnum.Offering,
          label: 'Offering',
          page: const FinanceOffering(),
        ),
        NavBarModel(
          identifier: OfferingTabsEnum.Offering,
          label: 'Offering',
          page: const FinanceOffering(),
        ),
      ];

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

  OfferingModel? offeringModel;
  Future fetchOfferingList({int page = 1}) async {
    await ApiServices.getMethod(
      feedUrl: '${ApiUrls.offeringAPI}?page=$page&per_page=5',
      xRequestId: generateUniqueRequestId(),
      xRequestTimeStamp: generateTimeStamp(),
    ).then((res) {
      if (res == null) return null;
      final dataFirst = offeringModelFromJson(res);
      if (page > 1 && offeringModel != null) {
        offeringModel?.offeringModelList.addAll(dataFirst.offeringModelList);
      } else {
        offeringModel = dataFirst;
      }
      logger.i(offeringModel);
      update();
    }).onError((error, stackTrace) {
      debugPrint('Error => $error');
      logger.e('StackTrace => $stackTrace');
      showToast('Refresh again!');
    });
  }
}
