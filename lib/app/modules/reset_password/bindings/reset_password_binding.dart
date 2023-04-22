import 'package:get/get.dart';

import '../controllers/reset_password_controller.dart';

class ResetPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResetPageController>(
      () => ResetPageController(),
    );
  }
}
