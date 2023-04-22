import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:styleclub/app/core/resources/app_resources.dart';
import 'package:styleclub/app/core/widgets/app_widgets.dart';

import 'package:styleclub/app/routes/app_pages.dart';
import 'package:styleclub/app/services/variables.dart';
import 'package:styleclub/gen/assets.gen.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:styleclub/app/services/queryQuery.dart';
import '../controllers/welcome_controller.dart';

ApiClients query = ApiClients();

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.heightBox,
            buildTitle("It's time to style you!"),
            10.heightBox,
            "Being a member of style club you get lifelong suggestions on what to wear,how to groom yourself, everything."
                .text
                .white
                .size(16)
                .make()
                .marginOnly(left: 20),
            10.heightBox,
            Image.network(
              "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/group.png",
              width: double.infinity,
              fit: BoxFit.cover,
            ).expand(),
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(255, 117, 133, 150),
                    spreadRadius: 12,
                    blurRadius: 12,
                    offset: Offset(10, 0)),
              ]),
            ),
            20.heightBox,
           Obx(() => query.isLoading == true ? Center(child: CircularProgressIndicator()) : ButtonPrimary(
              title: "Let's Get Started",
            ).onInkTap(() {
              query.getCountry();
              // Get.toNamed(Routes.HEIGHT_PAGE);
            }), ),
            20.heightBox,
            "Later, I want to explore!"
                .text
                .bold
                .size(18)
                .underline
                .color(goldenColorEnd)
                .make()
                .onInkTap(() {
              Get.toNamed(Routes.MAIN_PAGE);
            }).centered(),
            20.heightBox
          ],
        ).box.withDecoration(scaffoldGradient).width(double.infinity).make(),
      ),
    );
  }
}
