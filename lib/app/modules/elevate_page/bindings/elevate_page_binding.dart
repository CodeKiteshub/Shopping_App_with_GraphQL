import 'package:get/get.dart';

import '../controllers/elevate_page_controller.dart';

class ElevatePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ElevatePageController>(
      () => ElevatePageController(),
    );
  }
}
