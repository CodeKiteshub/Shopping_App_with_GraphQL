import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:styleclub/app/core/widgets/app_widgets.dart';
import 'package:styleclub/gen/assets.gen.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/resources/app_resources.dart';
import '../controllers/share_controller.dart';

class ShareView extends GetView<ShareController> {
  const ShareView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                  "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/shareback.png"
                 ,
                  width: double.infinity,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: Vx.white,
                    ).onTap(() {
                      Get.back();
                    }),
                    Spacer(),
                    Icon(Icons.settings, color: Vx.white)
                  ],
                ).p(10).marginOnly(top: 50)
              ],
            ),
            20.heightBox,
            "Scan to Connect".text.size(18).white.bold.make(),
            20.heightBox,
            Image.network("https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/qrcode.png"),
            40.heightBox,
            "PASSCODE: 2312"
                .text
                .bold
                .white
                .make()
                .centered()
                .p(25)
                .box
                .color(themeGradientColorEnd)
                .width(double.infinity)
                .roundedSM
                .margin(const EdgeInsets.only(left: 20, right: 20))
                .make(),
            40.heightBox,
            const ButtonPrimary(title: "Share Link")
          ],
        ),
      ).box.height(double.infinity).withDecoration(scaffoldGradient).make(),
    );
  }
}
