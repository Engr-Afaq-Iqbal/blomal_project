import 'package:get/get.dart';

import '../AuthController/authController.dart';
import '../OfferingController/offeringController.dart';

class AppController {
  static void initializeControllers() {
    Get.put(AuthController());
    Get.put(OfferingController());
  }
}
