import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:styleclub/app/core/widgets/app_widgets.dart';
import 'package:styleclub/app/routes/app_pages.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../gen/assets.gen.dart';
import '../../../core/resources/app_resources.dart';
import '../controllers/scan_card_controller.dart';

class ScanCardView extends StatefulWidget {
   ScanCardView({Key? key}) : super(key: key);

  @override
  State<ScanCardView> createState() => _ScanCardViewState();
}

class _ScanCardViewState extends State<ScanCardView> {
 final qrKey = GlobalKey(debugLabel: "QR");

  Barcode? barcode;

  QRViewController? qrController;


  
  @override
  void dispose() {
    qrController?.dispose();

    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await qrController!.pauseCamera();
    }
    qrController!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTitle("Welcome Rachit!"),
            20.heightBox,
            Image.network("https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/card.png"),
            10.heightBox,
            "Tap the card on your phone, near the camera to correct"
                .text
                .size(14)
                .white
                .make()
                .marginOnly(left: 20),
            30.heightBox,
            Image.network("https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/styleclub.png").centered(),
            30.heightBox,
            "or".text.white.bold.make().centered(),
            30.heightBox,
            const ButtonPrimary(title: "Scan the QR").onInkTap(() {
              Get.to(() =>   Container(
              height: MediaQuery.of(context).size.height * 0.5,
              child: buildQrView(context)),);
            }).onInkTap(() {
           //   Get.toNamed(Routes.CONNECTED);
            }),
            10.heightBox,
            "Check the back of you card".text.white.make().centered()
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

  Widget buildQrView(BuildContext context) => QRView(
        key: qrKey,
        cameraFacing: CameraFacing.back,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
            borderColor: Colors.black,
            borderRadius: 15,
            borderLength: 20,
            borderWidth: 10,
            cutOutSize: MediaQuery.of(context).size.width * 0.8),
      );

  void onQRViewCreated(QRViewController controller) {
    this.qrController = controller;
    controller.scannedDataStream.listen((barcode) {
      setState(() {
        this.barcode = barcode;
      });
    });
  }
}
