import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:styleclub/app/core/widgets/app_widgets.dart';
import 'package:styleclub/app/modules/create_digital_identity/controllers/create_digital_identity_controller.dart';
import 'package:styleclub/app/modules/elevate_page/views/elevate_page_view.dart';
import 'package:styleclub/app/routes/app_pages.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/resources/app_resources.dart';
import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  SettingsView({Key? key}) : super(key: key);
  CreateDigitalIdentityController createDigitalIdentityController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const ButtonPrimary(title: "Continue")
          .p(30)
          .box
          .color(themeGradientColorStart)
          .make()
          .onInkTap(() async {
        createDigitalIdentityController.passcode.value = controller.passcode.text;
        if (query.user!.user.digitalProfile == null) {
          await createDigitalIdentityController.savedigitalidentity();
        } else {
          await createDigitalIdentityController.savedigitalidentity(
              id: query.user!.user.digitalProfile!.id);
        }

        Get.toNamed(Routes.SCAN_CARD);
      }),
      body: SingleChildScrollView(
        child: Column(children: [
          "Account Settings"
              .text
              .white
              .size(32)
              .fontFamily('ave_black')
              .fontWeight(FontWeight.w800)
              .bold
              .make()
              .marginOnly(right: 70, top: 50),
          20.heightBox,
          "Just to make sure that you're comfortable sharing the details, if not you can turn your profile private!"
              .text
              .white
              .size(18)
              .make(),
          40.heightBox,
          buildSwitch("Turn your profile private",controller. isprivate),
          20.heightBox,
          buildSwitch("Passcode", controller.isPasscode),
          Obx(() => controller.isPasscode.value
              ? TextField(
                  controller: controller.passcode,
                  style: TextStyle(color: Vx.gray200),
                  decoration: InputDecoration(
                      hintStyle: TextStyle(color: Vx.gray200),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 10),
                      hintText: 'Passcode'),
                )
                  .box
                  .roundedSM
                  .color(themeGradientColorEnd)
                  .margin(EdgeInsets.all(10))
                  .make()
              : Container())
        ]).marginAll(10),
      ).box.height(double.infinity).withDecoration(scaffoldGradient).make(),
    );
  }

  Widget buildSwitch(String title, RxBool newvalue) {
    return Row(
      children: [
        title.text.white.make().expand(),
        Obx(() {
          return Switch(
              value: newvalue.value,
              onChanged: (value) {
                print(value);
                newvalue.value = value;
              });
        })
      ],
    )
        .p(10)
        .box
        .color(themeGradientColorEnd)
        .margin(const EdgeInsets.all(10))
        .roundedSM
        .make();
  }
}
