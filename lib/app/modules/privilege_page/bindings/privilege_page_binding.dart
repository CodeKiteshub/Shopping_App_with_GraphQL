import 'package:get/get.dart';

import '../controllers/privilege_page_controller.dart';

class PrivilegePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrivilegePageController>(
      () => PrivilegePageController(),
    );
  }
}
