import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styleclub/app/services/variables.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../services/models/selectionmodel.dart';

class OnboardingController extends GetxController {
  //TODO: Implement OnboardingController
  final option = 0.obs;
  final screen = false.obs;
  final counter = 0.obs;
  final page15selection = <SelectionModel>[].obs;
  RxList<int> indexselection = <int>[].obs;
  RxList<int> indexselection2 = <int>[].obs;
  RxInt tabselection = 0.obs;
  RxString tabselection2 = "".obs;
  RxString socialbio = "".obs;
  RxString socialimg = "".obs;
  final answerCollection = <SelectionModel>[].obs;
  final count = 0.obs;
  final selectedColor = Vx.orange500;
  final List<bool> value = List<bool>.generate(100, (index) => false);
  final onboadingHeight = 220.0;
  final currentPage = 0.obs;

  void increment() => count.value++;

  Widget buildOption(String title) => title.text.white.bold.center
      .maxLines(3)
      .size(18)
      .fontFamily('ave_black')
      .fontWeight(FontWeight.w800)
      .make()
      // .pOnly(left: 20, right: 20, top: 10, bottom: 10)
      .box
      .rounded
      .hexColor("#273A4F")
      .make();
}
