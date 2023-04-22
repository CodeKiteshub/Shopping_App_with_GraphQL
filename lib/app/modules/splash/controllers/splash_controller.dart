import 'package:get/get.dart';
import 'package:styleclub/app/routes/app_pages.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  final count = 0.obs;
  final duration = 4;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: duration), () {
      Get.toNamed(Routes.SPLASHES);
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
