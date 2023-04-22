import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:styleclub/app/core/widgets/app_widgets.dart';
import 'package:styleclub/app/routes/app_pages.dart';

import 'package:velocity_x/velocity_x.dart';

import '../../../core/resources/app_resources.dart';
import '../controllers/Congrats_controller.dart';

class CongratsView extends GetView<CongratsController> {
  const CongratsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 231, left: 95, right: 95),
                child: Image.network('https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/bigtick.png'),
              ).onInkTap(() {
                Get.toNamed(Routes.WELCOME);
              }),
              Padding(
                padding: EdgeInsets.only(top: 35, bottom: 16),
                child: "Congratulations!"
                    .text
                    .size(32)
                    .fontFamily('ave_black')
                    .fontWeight(FontWeight.w800)
                    .white
                    .bold
                    .make(),
              ),
              Padding(
                padding: EdgeInsets.only(left: 40, right: 30),
                child: Faker()
                    .lorem
                    .sentences(4)
                    .join(" ")
                    .text
                    .fontFamily('dmsans')
                    .fontWeight(FontWeight.w400)
                    .white
                    .size(16)
                    .make(),
              )
            ],
          ).onTap(() {
            Get.toNamed(Routes.WELCOME);
          })
        ],
      ).box.withDecoration(scaffoldGradient).make(),
    );
  }
}
