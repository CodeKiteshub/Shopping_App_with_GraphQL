import 'package:get/get.dart';

import '../controllers/payment1_controller.dart';

class Payment1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Payment1Controller>(
      () => Payment1Controller(),
    );
  }
}