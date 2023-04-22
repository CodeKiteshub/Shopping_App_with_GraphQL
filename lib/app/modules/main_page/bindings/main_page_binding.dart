import 'package:get/get.dart';
import 'package:styleclub/app/modules/home_page/controllers/home_page_controller.dart';

import '../../influence_page/controllers/influence_page_controller.dart';
import '../controllers/main_page_controller.dart';

class MainPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InfluencePageController>(
      () => InfluencePageController(),
    );
    Get.lazyPut<MainPageController>(
      () => MainPageController(),
    );
    Get.lazyPut<HomePageController>(() => HomePageController());
  }
}
