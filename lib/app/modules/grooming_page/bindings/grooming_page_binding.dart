import 'package:get/get.dart';

import '../controllers/grooming_page_controller.dart';

class GroomingPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GroomingPageController>(
      () => GroomingPageController(),
    );
    Get.lazyPut<GroomingPartners>(() =>GroomingPartners());
  }
}
