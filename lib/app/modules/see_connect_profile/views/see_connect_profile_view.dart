import 'dart:collection';
import 'dart:developer';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:styleclub/app/core/resources/app_resources.dart';
import 'package:styleclub/app/core/widgets/app_widgets.dart';
import 'package:styleclub/app/modules/create_digital_identity/controllers/create_digital_identity_controller.dart';
import 'package:styleclub/app/modules/elevate_page/views/elevate_page_view.dart';
import 'package:styleclub/app/modules/qr_screen.dart';
import 'package:styleclub/app/modules/see_profile/controllers/see_profile_controller.dart';
import 'package:styleclub/app/modules/see_profile/views/see_profile_view.dart';
import 'package:styleclub/app/routes/app_pages.dart';
import 'package:styleclub/app/services/queryQuery.dart';
import 'package:styleclub/app/services/variables.dart';
import 'package:styleclub/gen/assets.gen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/see_connect_profile_controller.dart';

class SeeConnectProfileView extends GetView<SeeConnectProfileController> {
  SeeConnectProfileView({Key? key}) : super(key: key);
  SeeProfileController seeProfileController = Get.put(SeeProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Stack(children: [
        Container(
          height: 0,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Color.fromARGB(255, 117, 133, 150),
                spreadRadius: 7,
                blurRadius: 7,
                offset: Offset(0, 0)),
          ]),
        ),
        const ButtonPrimary(title: "See More")
            .box
            .p24
            .withDecoration(scaffoldGradient)
            .make()
            .onInkTap(() {
          Get.to(() => QRScreen());
        }),
      ]),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.arrow_back,
                      color: Vx.white,
                    ).onTap(() {
                      Get.back();
                    }),
                    const Spacer(),
                    Image.network(
                            "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/share.png")
                        .onInkTap(() {
                      Get.toNamed(Routes.SHARE);
                    })
                  ],
                ).p(10).box.height(200).black.make(),
                100.heightBox,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        // "${variables.name}"
                     seeProfileController.digitalprofile!.getDigitalProfileById == null
                            ? ""
                                .text
                                .white
                                .fontWeight(FontWeight.w800)
                                .fontFamily('ave_black')
                                .size(32)
                                .make()
                                .expand()
                            : "${seeProfileController.digitalprofile!.getDigitalProfileById.firstName.value} ${seeProfileController.digitalprofile!.getDigitalProfileById!.lastName.value}"
                                .text
                                .white
                                .fontWeight(FontWeight.w800)
                                .fontFamily('ave_black')
                                .size(32)
                                .make()
                                .expand(),
                        const Icon(
                          Icons.edit,
                          color: Vx.white,
                          size: 28,
                        ).onInkTap(() {
                          log("tap");
                          Get.toNamed(Routes.EDIT_PROFILE);
                        })
                      ],
                    ).onInkTap(() {
                      Get.toNamed(Routes.EDIT_PROFILE);
                    }),
                    8.heightBox,
                    "${seeProfileController.digitalprofile!.getDigitalProfileById!.designation.value} | ${seeProfileController.digitalprofile!.getDigitalProfileById!.organization.value}"
                        .text
                        .white
                        .bold
                        .size(24)
                        .make(),
                    10.heightBox,
                    "${seeProfileController.digitalprofile!.getDigitalProfileById!.connections.length.toString()} Connects"
                        .text
                        .size(16)
                        .color(goldenColorEnd)
                        .underline
                        .make(),
                    20.heightBox,
                    buildWhiteText(
                     seeProfileController.digitalprofile!.getDigitalProfileById!.bio.value),
                    20.heightBox,
                    buildMainTitle("Reach out:", 16),
                    10.heightBox,
                    Row(
                      children: [
                        "${seeProfileController.digitalprofile!.getDigitalProfileById!.email.value}"
                            .text
                            .size(16)
                            .underline
                            .white
                            .make(),
                        55.widthBox,
                        Image.network(
                            'https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/eimage.png')
                      ],
                    ),
                    10.heightBox,
                    "${seeProfileController.digitalprofile!.getDigitalProfileById!.phone.value}"
                        .text
                        .size(16)
                        .underline
                        .white
                        .make(),
                    20.heightBox,
                    buildMainTitle("Social", 16),
                    20.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () async {
                            var url = 
                                seeProfileController.digitalprofile!.getDigitalProfileById!.socialMediaLinks
                                .firstWhere((element) =>
                                    element.socialAccount == 'Instagram')
                                .value;
                            print(url);
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          child: Image.network(
                              'https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/imstagram1.png'),
                        ),
                        InkWell(
                          onTap: () async {
                            var url = 
                                seeProfileController.digitalprofile!.getDigitalProfileById!.socialMediaLinks
                                .firstWhere((element) =>
                                    element.socialAccount == 'Linkedin')
                                .value;
                            print(url);
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          child: Image.network(
                              'https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/linkedin0.png'),
                        ),
                        InkWell(
                          onTap: () async {
                            var url = 
                                seeProfileController.digitalprofile!.getDigitalProfileById!.socialMediaLinks
                                .firstWhere((element) =>
                                    element.socialAccount == 'Twitter')
                                .value;
                            print(url);
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          child: Image.network(
                              'https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/twitter0.png'),
                        ),
                        InkWell(
                          onTap: () async {
                            var url = 
                                seeProfileController.digitalprofile!.getDigitalProfileById!.socialMediaLinks
                                .firstWhere((element) =>
                                    element.socialAccount == 'Whatsapp')
                                .value;
                            print(url);
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          child: Image.network(
                              'https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/whatsapp0.png'),
                        ),
                      ],
                    ),
                    20.heightBox,
                    buildMainTitle("Company Bio", 16),
                    10.heightBox,
                    buildWhiteText(
                        "${seeProfileController.digitalprofile!.getDigitalProfileById!.companyBio.value}")
                  ],
                ).marginAll(20)
              ],
            ).w(double.infinity),
            Align(
              child: variables.profilepic == null
                  ? Image.network(
                      "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/uploaded.png")
                  : CircleAvatar(
                      backgroundColor: goldenColorStart,
                      radius: MediaQuery.of(context).size.height * 0.1,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(variables.profilepic),
                        radius: MediaQuery.of(context).size.height * 0.09,
                      )),
            ).positioned(top: 100, left: 0, right: 0),
          ],
        ),
      ).box.height(double.infinity).withDecoration(scaffoldGradient).make(),
    );
  }

  Widget buildWhiteText(String text) {
    return text.text
        .size(16)
        .fontFamily('dmsans')
        .fontWeight(FontWeight.w500)
        .white
        .make();
  }
}
