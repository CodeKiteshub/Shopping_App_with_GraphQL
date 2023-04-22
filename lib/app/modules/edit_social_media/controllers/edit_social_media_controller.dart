import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styleclub/app/services/queryQuery.dart';

class EditSocialMediaController extends GetxController {
  //TODO: Implement EditSocialMediaController
  TextEditingController instagramController = TextEditingController();
  TextEditingController linkedinController = TextEditingController();
  TextEditingController twitterController = TextEditingController();
  TextEditingController otherController = TextEditingController();
  ApiClients apiClients = Get.find();

  final count = 0.obs;
  @override
  void onInit() {
    if (apiClients.user!.user.digitalProfile != null) {
instagramController.text = apiClients.user!.user.digitalProfile!.socialMediaLinks
        .firstWhere((element) => element.socialAccount == 'Instagram')
        .value;
  
    linkedinController.text = apiClients.user!.user.digitalProfile!.socialMediaLinks
        .firstWhere((element) => element.socialAccount == 'Linkedin')
        .value;
    twitterController.text = apiClients.user!.user.digitalProfile!.socialMediaLinks
        .firstWhere((element) => element.socialAccount == 'Twitter')
        .value;
        

    }

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
