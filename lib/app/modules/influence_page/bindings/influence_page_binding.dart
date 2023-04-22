import 'package:get/get.dart';

import '../controllers/influence_page_controller.dart';

class InfluencePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InfluencePageController>(
      () => InfluencePageController(),
    );
  }
}
