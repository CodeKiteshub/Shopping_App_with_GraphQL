import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styleclub/app/services/variables.dart';
import 'package:velocity_x/velocity_x.dart';


class LetsstyleController extends GetxController {
  //TODO: Implement ScanCardController
 final option = 0.obs;
  final screen = false.obs;
  final counter = 0.obs;

  final count = 0.obs;
  final selectedColor = Vx.orange500;
  final List<bool> value = List<bool>.generate(100, (index) => false);
  final onboadingHeight = 220.0;
  final currentPage = 0.obs;

  void increment() => count.value++;

  Widget buildOption(String title) => title.text.white.bold.center
      .size(18)
      .fontFamily('ave_black')
      .fontWeight(FontWeight.w800)
      .make()
      .pOnly(left: 20, right: 20, top: 10, bottom: 10)
      .box
      .rounded
      .hexColor("#273A4F")
      .make();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

}
