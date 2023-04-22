import 'package:get/get.dart';

import '../controllers/edit_social_media_controller.dart';

class EditSocialMediaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditSocialMediaController>(
      () => EditSocialMediaController(),
    );
  }
}
