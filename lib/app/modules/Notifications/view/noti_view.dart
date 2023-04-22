import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:styleclub/app/core/widgets/app_widgets.dart';
import 'package:styleclub/app/routes/app_pages.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../gen/assets.gen.dart';
import '../../../core/resources/app_resources.dart';
import '../controllers/noti_controllers.dart';

class NotiView extends GetView<NotiController> {
  const NotiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 65),
              child: Row(
                children: [
                  Image.network(
                      'https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/Vector.png'),
                  SizedBox(width: 20),
                  "NOTIFICATIONS"
                      .text
                      .bold
                      .size(24)
                      .fontFamily('ave_black')
                      .fontWeight(FontWeight.w800)
                      .color(goldenColorEnd)
                      .make()
                      .paddingOnly(left: 8)
                ],
              ),
            ),
            "THIS WEEK"
                .text
                .bold
                .size(12)
                .fontFamily('dmsans')
                .fontWeight(FontWeight.w400)
                .white
                .make()
                .paddingOnly(
                  top: 15,
                  left: 15,
                  right: 15,
                ),
            SingleChildScrollView(
              child: Container(
                height: 270,
                child: ListView.builder(
                    itemCount: 7,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          child: Column(
                        children: [
                          Image.network(
                              'https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/Frame 150.png'),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.015),
                        ],
                      )).onTap(() {
                        Get.toNamed(Routes.PAYMENT1);
                      });
                    }),
              ),
            ),
            "THIS  MONTH"
                .text
                .size(12)
                .fontFamily('dmsans')
                .fontWeight(FontWeight.w400)
                .white
                .make()
                .paddingOnly(
                  top: 15,
                  left: 15,
                  right: 15,
                ),
            SingleChildScrollView(
              child: Container(
                height: 400,
                child: ListView.builder(
                    itemCount: 8,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          child: Column(
                        children: [
                          Image.network(
                              'https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/Frame 150.png'),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.015),
                        ],
                      ));
                    }),
              ),
            ),
          ],
        ).marginAll(20),
      )
          .box
          .withDecoration(scaffoldGradient)
          .height(double.infinity)
          .width(double.infinity)
          .make(),
    );
  }
}
