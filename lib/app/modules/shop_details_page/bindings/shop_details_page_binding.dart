import 'package:get/get.dart';

import '../controllers/shop_details_page_controller.dart';

class ShopDetailsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShopDetailsPageController>(
      () => ShopDetailsPageController(),
    );
  }
}
