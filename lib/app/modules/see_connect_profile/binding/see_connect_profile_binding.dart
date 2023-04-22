import 'package:get/get.dart';

import '../controllers/see_connect_profile_controller.dart';



class SeeConnectProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SeeConnectProfileController>(
      () => SeeConnectProfileController(),
    );
  }
}