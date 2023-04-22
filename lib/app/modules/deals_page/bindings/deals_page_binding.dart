import 'package:get/get.dart';

import '../controllers/deals_page_controller.dart';

class DealsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DealsPageController>(
      () => DealsPageController(),
    );
  }
}
