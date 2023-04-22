import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styleclub/app/modules/shop_page/controllers/shop_query.dart';

class ShopPageController extends GetxController  with GetTickerProviderStateMixin {
  //TODO: Implement ShopPageController

  final count = 0.obs;
   late final TabController tabController =
      TabController(length: 4, vsync: this);
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
class CategoryProducts extends GetxController with StateMixin<List<dynamic>>{
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
    StylingClients().ocassion().then((value) {
      change(value, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }
  
}
class StyleProducts extends GetxController with StateMixin<List<dynamic>>{
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
    StylingClients().styles().then((value) {
      change(value, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }
  
}
class StylePratners extends GetxController with StateMixin<List<dynamic>>{
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
    StylingClients().partner().then((value) {
      change(value, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }
  
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
    StylingClients().blog().then((value) {
      change(value, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }
}
