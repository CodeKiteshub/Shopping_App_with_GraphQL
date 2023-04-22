import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:styleclub/app/core/resources/app_resources.dart';
import 'package:styleclub/app/modules/see_profile/controllers/see_profile_controller.dart';
// import 'package:qr_flutter/qr_flutter.dart';

class QrScanner extends StatefulWidget {
  const QrScanner({super.key});

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  final qrKey = GlobalKey(debugLabel: "QR");
  String? digitalid;
  Barcode? barcode;
  QRViewController? controller;
  TextEditingController passcodecontroller = TextEditingController();
  SeeProfileController seeProfileController = Get.put(SeeProfileController());

  @override
  void dispose() {
    controller?.dispose();

    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back, color: Colors.black)),
      ),
      body: Obx(
        () {
          return seeProfileController.isLoading.value ?  Center(child: CircularProgressIndicator()) : Column(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: buildQrView(context)),
            ],
          );
        }
      ),
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
    this.controller = controller;
    controller.scannedDataStream.listen((barcode) {
      setState(() {
        this.barcode = barcode;
      });
      if (barcode != null) {
        setState(() {
          digitalid = barcode.code!.split("dp/").last.split("/").first;
        });
      seeProfileController.isLoading.value ? Container() : Get.defaultDialog(
            title: "Passcode",
            content: TextField(
              controller: passcodecontroller,
          
              decoration: InputDecoration(fillColor: themeGradientColorEnd),
            ),
            onCancel: () {},
            onConfirm: () async {
              await seeProfileController.getdigitalidentity(digitalid!,passcodecontroller.text);
            });
      }
    });
  }
}
