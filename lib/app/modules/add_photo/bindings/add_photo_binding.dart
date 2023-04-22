import 'package:get/get.dart';

import '../controllers/add_photo_controller.dart';

class AddPhotoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddPhotoController>(
      () => AddPhotoController(),
    );
  }
}
