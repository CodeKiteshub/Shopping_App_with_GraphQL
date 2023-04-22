import 'dart:collection';
import 'dart:developer';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:styleclub/app/core/resources/app_resources.dart';
import 'package:styleclub/app/core/widgets/app_widgets.dart';
import 'package:styleclub/app/modules/create_digital_identity/controllers/create_digital_identity_controller.dart';
import 'package:styleclub/app/modules/scanner.dart';
import 'package:styleclub/app/modules/see_profile/controllers/see_profile_controller.dart';

import 'package:styleclub/app/routes/app_pages.dart';
import 'package:styleclub/app/services/queryQuery.dart';
import 'package:styleclub/app/services/variables.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

class QRScreen extends StatefulWidget {
  QRScreen({Key? key}) : super(key: key);

  @override
  State<QRScreen> createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  ApiClients apiClients = Get.put(ApiClients());
  SeeProfileController seeProfileController = Get.put(SeeProfileController());
  final qrKey = GlobalKey(debugLabel: "QR");

  Barcode? barcode;

  QRViewController? qrController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: Stack(children: [
      //   Container(
      //     height: 0,
      //     decoration: BoxDecoration(boxShadow: [
      //       BoxShadow(
      //           color: Color.fromARGB(255, 117, 133, 150),
      //           spreadRadius: 7,
      //           blurRadius: 7,
      //           offset: Offset(0, 0)),
      //     ]),
      //   ),
      //   const ButtonPrimary(title: "Scan QR")
      //       .box
      //       .p24
      //       .withDecoration(scaffoldGradient)
      //       .make()
      //       .onInkTap(() async {
      //     Get.to(() => QrScanner());
      //   }),
      // ]),
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
                    InkWell(onTap: 
                    () {
                

                    },
                      child: Image.network(
                              "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/share.png")
                          .onInkTap(() {
                      Share.share(apiClients.user!.user.digitalProfile!.profileUrl,
                      );
                      }),
                    )
                  ],
                ).p(10).box.height(200).black.make(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "Scan to Connect"
                        .text
                        .white
                        .bold
                        .size(20)
                        .make()
                        .centered(),
                    20.heightBox,
                    Center(
                      child: QrImage(
                        backgroundColor: Colors.white,
                        data: apiClients.user!.user.digitalProfile!.profileUrl,
                        version: QrVersions.auto,
                        size: 350.0,
                      ),
                    ),
                    50.heightBox,
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: themeGradientColorEnd,
                          borderRadius: BorderRadius.circular(10)),
                      alignment: Alignment.center,
                      child: Text(
                        "Passcode : ${apiClients.user!.user.digitalProfile!.passCode}",
                        style: TextStyle(
                            color: Colors.grey.shade200, fontSize: 20),
                      ),
                    ),
                  ],
                ).marginAll(20)
              ],
            ).w(double.infinity),
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
