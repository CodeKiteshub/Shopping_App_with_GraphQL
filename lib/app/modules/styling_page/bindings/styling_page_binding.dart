import 'package:get/get.dart';

import '../controllers/styling_page_controller.dart';

class StylingPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StylingPageController>(
      () => StylingPageController(),
    );
  }
}
