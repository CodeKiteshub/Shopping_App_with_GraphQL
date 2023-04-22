import 'package:get/get.dart';
import 'package:styleclub/app/modules/chat_page/controllers/chat_query.dart';
import 'home_query.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';

class HomePageController extends GetxController with StateMixin<List<dynamic>> {
  //TODO: Implement HomePageController

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
    HomeClients().blog().then((value) {
      change(value, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }
}

class HomePageController2 extends GetxController
    with StateMixin<List<dynamic>> {
  //TODO: Implement HomePageController

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    HomeClients().partner().then((value) {
      change(value, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
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

class HomePageController3 extends GetxController
    with StateMixin<List<dynamic>> {
  //TODO: Implement HomePageController

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    HomeClients().branch().then((value) {
      change(value, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
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
