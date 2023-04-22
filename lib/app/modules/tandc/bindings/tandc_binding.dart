import 'package:get/get.dart';

import '../controllers/tandc_controller.dart';

class TandCBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TandCController>(
      () => TandCController(),
    );
  }
}
