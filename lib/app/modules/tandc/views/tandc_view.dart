import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:styleclub/app/core/resources/app_resources.dart';
import 'package:styleclub/app/core/widgets/app_widgets.dart';
import 'package:styleclub/app/routes/app_pages.dart';
import 'package:styleclub/gen/assets.gen.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/tandc_controller.dart';

class TANDCView extends GetView<TandCController> {
  const TANDCView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 40, left: 12),
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios_rounded, color: Colors.white)
                    .onTap(() {
                  Get.back();
                }),
                SizedBox(width: 11),
                buildTitle1("TERMS AND CONDITIONS"),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, left: 20, right: 20),
            child: Column(children: [
              Row(
                children: [
                  "PRIVACY POLICY"
                      .text
                      .bold
                      .white
                      .size(16)
                      .fontFamily('ave')
                      .make(),
                  Spacer(),
                  Image.network("https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/goldarr.png")
                ],
              ),
              Divider(
                color: Colors.white,
                height: 30,
                thickness: 1,
              ),
              Row(
                children: [
                  "DISCLAIMER"
                      .text
                      .bold
                      .white
                      .size(16)
                      .fontFamily('ave')
                      .make(),
                  Spacer(),
                  Image.network("https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/goldarr.png")
                ],
              ),
              Divider(
                color: Colors.white,
                height: 30,
                thickness: 1,
              ),
              // Padding(
              //   padding: EdgeInsets.only(top: 12, bottom: 12, right:  MediaQuery.of(context).size.width * 0.1),
              //   child: Image.network("https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/"Assets.images.line.path),
              // ),
              Row(
                children: [
                  "TERMS OF USE"
                      .text
                      .bold
                      .white
                      .size(16)
                      .fontFamily('ave')
                      .make(),
                  Spacer(),
                  Image.network("https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/goldarr.png")
                ],
              ),
              // Padding(
              //   padding: EdgeInsets.only(top: 12, bottom: 12, right: MediaQuery.of(context).size.width * 0.1),
             
              // ),
            ]),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.6),
            child: const ButtonPrimary(
              title: "Accept and Continue",
            ).onTap(() {
              Get.toNamed(Routes.CONGRATS);
            }),
          )
          // "Being a member of style club you get lifelong suggestions from our very own fashion stylist!"
          //     .text
          //     .white
          //     .size(16)
          //     .make()
          //     .marginAll(20),
        
          // 20.heightBox,
          // "Mr. Priya Jaiswal".text.bold.size(28).color(goldenColorEnd).make(),
          // 10.heightBox,
          // "Senior Stylist at My Perfect Fit".text.white.bold.size(18).make(),
          // const Spacer(),
          // const ButtonPrimary(title: "Enter the Club!").onInkTap(() {
          //   Get.toNamed(Routes.MAIN_PAGE);
          // }),
          // 50.heightBox,
        ],
      ).box.withDecoration(scaffoldGradient).make(),
    );
  }
}

buildTitle1(String title) {
  return title.text.white
      .size(24)
      .fontFamily('ave_black')
      .fontWeight(FontWeight.w800)
      .color(goldenColorEnd)
      .bold
      .make();
}
