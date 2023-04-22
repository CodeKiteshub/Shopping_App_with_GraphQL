import 'package:get/get.dart';

import '../controllers/login_page_pass_controller.dart';

class LoginPagePassBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginPagePassController>(
      () => LoginPagePassController(),
    );
  }
}
