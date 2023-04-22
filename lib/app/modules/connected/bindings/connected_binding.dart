import 'package:get/get.dart';

import '../controllers/connected_controller.dart';

class ConnectedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConnectedController>(
      () => ConnectedController(),
    );
  }
}
