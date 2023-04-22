import 'package:get/get.dart';

import '../controllers/see_profile_controller.dart';

class SeeProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SeeProfileController>(
      () => SeeProfileController(),
    );
  }
}
