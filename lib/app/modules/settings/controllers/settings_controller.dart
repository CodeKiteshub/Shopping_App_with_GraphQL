import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styleclub/app/modules/elevate_page/views/elevate_page_view.dart';

class SettingsController extends GetxController {
  //TODO: Implement SettingsController

  RxBool isPasscode = false.obs;
  RxBool isprivate = false.obs;
  TextEditingController passcode = TextEditingController();
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    if (query.user!.user.digitalProfile!.passCode != "") {
      isPasscode(true);
      passcode.text = query.user!.user.digitalProfile!.passCode;
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
