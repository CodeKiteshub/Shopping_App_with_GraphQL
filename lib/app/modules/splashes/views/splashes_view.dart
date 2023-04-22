import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:styleclub/app/core/resources/app_resources.dart';
import 'package:styleclub/gen/assets.gen.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../routes/app_pages.dart';
import '../controllers/splashes_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashesView extends GetView<SplashesController> {
  const SplashesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: themeGradientColorStart,
        bottomNavigationBar: Row(children: [
          const Icon(
            Icons.arrow_back,
            size: 30,
            color: goldenColorEnd,
          ).onInkTap(() {
            if (controller.count.value > 0) {
              controller.count.value = controller.count.value - 1;
            }
          }),
          const Spacer(),
          const Icon(
            Icons.arrow_forward,
            size: 30,
            color: goldenColorEnd,
          ).onInkTap(() {
            if (controller.count.value < 2) {
              controller.count.value = controller.count.value + 1;
            } else {
              Get.toNamed(Routes.ELEVATE_PAGE);
            }
          }),
        ]).p(20).box.color(themeGradientColorStart).make(),
        body: Obx(() {
          return controller.count.value == 0
              ? Heading1(
                  title: "Elevate Lifestyle",
                  image:"https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/heading1-logo.png" ,
                  desc:
                      "We believe in taking your lifestyle journey to the next level by providing highly curated, personalised experiences that affect your lifestyle. We are there for you while you are discovering a new version of yourself through personalised fashion, grooming, wellness, travel, automobiles and gadgets",
                )
              : controller.count.value == 1
                  ? Heading1(
                      title: "Transform Yourself",
                      image:"https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/heading2-logo.png" ,
                      desc:
                          "Get inspired and take your lifestyle journey to the next level. We will together make a plan to craft your look by enabling you to discover your right colours, styles, grooming, and accessories, matching your unique personality and aura. Let's celebrate your next version and keep elevating",
                    )
                  : Heading1(
                      title: "Enjoy Privileges",
                      image:"https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/heading3-logo-3.png",
                      desc:
                          "Being part of the Club provides you with access to exclusive lifestyle partners. You will find highly curated fashion, grooming, wellness, travel, automobiles, gadgets, and lifestyle partners to elevate your lifestyle. As part of the elite club, you get special attention and offers from these club partners",
                    );
        }));
  }
}

class Heading1 extends StatelessWidget {
  const Heading1(
      {Key? key, required this.title, required this.image, required this.desc})
      : super(key: key);
  final String title;
  final String image;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          image,
          width: double.infinity,
          height: 480,
          fit: BoxFit.cover,
        ),
        10.heightBox,
        title.text
            .fontFamily('ave_black')
            .fontWeight(FontWeight.w800)
            .size(35)
            .color(goldenColorEnd)
            .make()
            .marginOnly(left: 30, right: 30),
        Padding(
          padding: EdgeInsets.only(top: 24),
          child: desc.text
              .fontFamily('dmsans')
              .fontWeight(FontWeight.w400)
              .size(16)
              .white
              .make()
              .marginOnly(left: 30, right: 30),
        )
      ],
    )).box.height(double.infinity).withDecoration(scaffoldGradient).make();
  }
}
