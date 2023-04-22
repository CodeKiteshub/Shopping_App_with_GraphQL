import 'package:get/get.dart';
import 'package:styleclub/app/modules/deals_page/controllers/deals.dart';
import 'package:styleclub/app/modules/deals_page/controllers/deals_query.dart';

class DealsPageController extends GetxController {
  //TODO: Implement DealsPageController

  final count = 0.obs;
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
class DealsPageController2 extends GetxController
    with StateMixin<Deals> {
  //TODO: Implement HomePageController

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
   Deal().deal().then((value) {
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
