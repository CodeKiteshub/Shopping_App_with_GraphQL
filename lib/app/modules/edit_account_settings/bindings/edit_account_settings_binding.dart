import 'package:get/get.dart';

import '../controllers/edit_account_settings_controller.dart';

class EditAccountSettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditAccountSettingsController>(
      () => EditAccountSettingsController(),
    );
  }
}
