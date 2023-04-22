import 'package:get/get.dart';

class NotiController extends GetxController {
  //TODO: Implement NotiController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();


  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
