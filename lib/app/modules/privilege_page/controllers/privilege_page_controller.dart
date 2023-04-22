import 'package:get/get.dart';
import '../privilage_query.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';

class PrivilegePageController extends GetxController
    with StateMixin<List<dynamic>> {
  //TODO: Implement PrivilegePageController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    Privilage().blog().then((value) {
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

class PrivilegePageController2 extends GetxController
    with StateMixin<List<dynamic>> {
  //TODO: Implement PrivilegePageController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    Privilage().categories().then((value) {
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

class PrivilegePageController3 extends GetxController
    with StateMixin<List<dynamic>> {
  //TODO: Implement PrivilegePageController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    Privilage().branch().then((value) {
      print("success on privillige");
      change(value, status: RxStatus.success());
    }, onError: (error) {
      print("error on privillige");
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
