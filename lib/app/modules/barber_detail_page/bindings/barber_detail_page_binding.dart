import 'package:get/get.dart';

import '../controllers/barber_detail_page_controller.dart';

class BarberDetailPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BarberDetailPageController>(
      () => BarberDetailPageController(),
    );
  }
}
