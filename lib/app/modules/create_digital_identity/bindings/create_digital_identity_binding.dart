import 'package:get/get.dart';

import '../controllers/create_digital_identity_controller.dart';

class CreateDigitalIdentityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateDigitalIdentityController>(
      () => CreateDigitalIdentityController(),
    );
  }
}
