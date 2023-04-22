import 'package:get/get.dart';

import '../controllers/haristyle_detail_page_controller.dart';

class HaristyleDetailPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HaristyleDetailPageController>(
      () => HaristyleDetailPageController(),
    );
  }
}
