import 'package:get/get.dart';

import '../controllers/noti_controllers.dart';

class NotiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotiController>(
      () => NotiController(),
    );
  }
}
