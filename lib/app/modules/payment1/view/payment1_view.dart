import 'dart:developer';
import 'dart:ui';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:styleclub/app/core/resources/app_resources.dart';
import 'package:styleclub/app/core/widgets/app_widgets.dart';
import 'package:styleclub/app/routes/app_pages.dart';
import 'package:styleclub/gen/assets.gen.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/payment1_controller.dart';

class Payment1View extends GetView<Payment1Controller> {
  const Payment1View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
              child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 44),
            child: Stack(
              children: [
                Image.network(
                    'https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/payment1blue.png'),
                Padding(
                  padding: EdgeInsets.only(top: 42, left: 45),
                  child: Image.network(
                      'https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/spark.png'),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 40,
              left: 13,
            ),
            child: Text(
              'Get Style Club Membership',
              style: TextStyle(
                  fontFamily: 'ave_black',
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                  color: Colors.white),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16, left: 34, right: 32),
            child: Text(
              'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
              style: TextStyle(
                  fontFamily: 'ave',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 24,
            ),
            child: Image.network(
                'https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/Line3.png'),
          ),
          Padding(
              padding: EdgeInsets.only(
                top: 24,
              ),
              child: Stack(
                children: [
                  Image.network(
                      'https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/onetime.png'),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 42, left: 16),
                        child: Image.network(
                            'https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/star.png'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16, left: 16),
                        child: Image.network(
                            'https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/star.png'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16, left: 16),
                        child: Image.network(
                            'https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/star.png'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16, left: 16),
                        child: Image.network(
                            'https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/star.png'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16, left: 25),
                        child: Image.network(
                            'https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/lifetime.png'),
                      ),
                    ],
                  ),
                ],
              )),
          Padding(
              padding: EdgeInsets.only(
                top: 16,
              ),
              child: Image.network(
                  'https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/joinpay1.png')),
          Padding(
              padding: EdgeInsets.only(
                top: 16,
              ),
              child: Image.network(
                  'https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/buystyle.png')),
          Padding(
            padding: EdgeInsets.only(
              top: 7,
            ),
            child: "Skip"
                .text
                .bold
                .size(16)
                .fontFamily('ave_black')
                .fontWeight(FontWeight.w800)
                .underline
                .color(goldenColorEnd)
                .make()
                .centered()
                .onTap(() {}),
          ),
        ],
      ))
          .box
          .width(double.infinity)
          .height(double.infinity)
          .withDecoration(scaffoldGradient)
          .make(),
    );
  }

  Widget buildWhiteText(String text) {
    return text.text.size(18).white.make();
  }
}
