import 'package:get/get.dart';

import '../controllers/splashes_controller.dart';

class SplashesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashesController>(
      () => SplashesController(),
    );
  }
}
