import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:styleclub/app/core/resources/app_resources.dart';
import 'package:styleclub/app/core/widgets/app_widgets.dart';
import 'package:styleclub/app/modules/elevate_page/views/elevate_page_view.dart';
import 'package:styleclub/app/routes/app_pages.dart';
import 'package:styleclub/app/services/variables.dart';

import 'package:velocity_x/velocity_x.dart';

import '../controllers/create_digital_identity_controller.dart';

class CreateDigitalIdentityView
    extends GetView<CreateDigitalIdentityController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Stack(children: [
        Container(
          height: 0.2,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Color.fromARGB(255, 117, 133, 150),
                spreadRadius: 7,
                blurRadius: 7,
                offset: Offset(0, 0)),
          ]),
        ),
        const ButtonPrimary(title: "Let's Create")
            .box
            .p24
            .withDecoration(scaffoldGradient)
            .make()
            .onInkTap(() {
          print(query.user!.user.digitalProfile);
          Get.toNamed(Routes.EDIT_PROFILE);
        }),
      ]),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTitle("Welcome ${variables.name}!"),
            20.heightBox,
            "Being a member of style club you can now create your own digital identity and share it with people."
                .text
                .size(18)
                .white
                .make()
                .marginOnly(left: 20),
            20.heightBox,
            Stack(children: [
              Image.network(
                "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/mockup.png",
                width: double.infinity,
                fit: BoxFit.cover,
              ).marginOnly(left: 30, right: 30),
              // Container(decoration: BoxDecoration(boxShadow: [
              //     BoxShadow(color: Color.fromARGB(255, 117,133, 150),spreadRadius:30,blurRadius: 5,
              //         offset: Offset(0, 550)),

              //   ]),)
            ])
          ],
        ).marginAll(10),
      )
          .box
          .width(double.infinity)
          .height(double.infinity)
          .withDecoration(scaffoldGradient)
          .make(),
    );
  }
}
