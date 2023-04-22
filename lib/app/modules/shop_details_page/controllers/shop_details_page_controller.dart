import 'package:get/get.dart';
import 'package:styleclub/app/modules/shop_details_page/controllers/shop_details_query.dart';

class ShopDetailsPageController extends GetxController {
  //TODO: Implement ShopDetailsPageController
  RxInt pageIndex=0.obs;
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
class LooksProduct extends GetxController with StateMixin<List<dynamic>>{
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
