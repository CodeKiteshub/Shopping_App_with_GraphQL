import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:styleclub/app/modules/haristyle_detail_page/hairstyle_detail_query.dart';

class HaristyleDetailPageController extends GetxController with StateMixin<List<dynamic>>{
  //TODO: Implement HaristyleDetailPageController

  final count = 0.obs;
  @override
  void onInit() {


    super.onInit();
      Hairstyle1().grooming().then((value) {
      change(value, status: RxStatus.success());
    },onError: (error){
      change(null,status: RxStatus.error(error.toString()));
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

class HaristyleDetailPageController2 extends GetxController with StateMixin<List<dynamic>>{
  //TODO: Implement HaristyleDetailPageController

  final count = 0.obs;
  @override
  void onInit() {

    super.onInit();
      Hairstyle1().groomingpartner().then((value) {
      change(value, status: RxStatus.success());
    },onError: (error){
      change(null,status: RxStatus.error(error.toString()));
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
