import 'package:get/get.dart';

import '../controllers/letsstyle_controller.dart';

class LetsstyleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LetsstyleController>(
      () => LetsstyleController(),
    );
  }
}
