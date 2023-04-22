import 'package:get/get.dart';
import 'package:styleclub/app/routes/app_pages.dart';
import 'dart:async';

class CongratsController extends GetxController {
  //TODO: Implement ChatPageController

  // final count = 0.obs;
  // final duration = 4;

  @override
  void onInit() {
    // TODO: implement initState
   super.onInit();
    startTime();
  }

  startTime() async {
    var duration = new Duration(seconds: 2);
    return new Timer(duration, route);
  }

  route() {
    Get.toNamed(Routes.WELCOME);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // void increment() => count.value++;
}
