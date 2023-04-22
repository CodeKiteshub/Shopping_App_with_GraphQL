import 'package:get/get.dart';

import '../controllers/shop_page_controller.dart';

class ShopPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShopPageController>(
      () => ShopPageController(),
    );
  }
}
