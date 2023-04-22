import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'influence_query.dart';
class InfluencePageController extends GetxController with GetTickerProviderStateMixin {
  //TODO: Implement InfluencePageController

  final count = 0.obs;
   late final TabController tabController =
      TabController(length: 3, vsync: this);
  @override
  void onInit() {
    super.onInit();
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
class LooksProducts extends GetxController with StateMixin<List<dynamic>>{
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    refresh1();
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
  void refresh1() {
    InfluenceClients().blog().then((value) {
      change(value, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }
}
