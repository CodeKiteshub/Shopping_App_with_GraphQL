import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:pusher_beams/pusher_beams.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:styleclub/app/modules/chat_page/controllers/chat_page_controller.dart';
import 'package:styleclub/app/services/variables.dart';

import '../../../services/queryQuery.dart';

class MainPageController extends GetxController {
  //TODO: Implement MainPageController

  late final PersistentTabController persistentTabController;
  ChatPageController chatPageController = Get.put(ChatPageController());
  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    ApiClients query = ApiClients();
    chatPageController.style();
    persistentTabController = PersistentTabController(initialIndex: 0);
    SharedPreferences prefs = await SharedPreferences.getInstance();
PusherBeams.instance.onMessageReceivedInTheForeground((notification) => Get.defaultDialog(title: "New Notification",
content: Text(notification.toString())
));



    variables.userid = prefs.getString('userid').toString() ?? '';

    if (variables.userid != null) {
      query.getuser();
    }

    variables.name = prefs.getString('name').toString() ?? '';
    variables.email = prefs.getString('email').toString() ?? '';
    variables.profilepic = prefs.getString('profilepic').toString() ?? '';
    variables.phone = prefs.getString('phone').toString() ?? '';
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
