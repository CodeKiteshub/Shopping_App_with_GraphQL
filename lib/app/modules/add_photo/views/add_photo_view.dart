import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_s3/simple_s3.dart';
import 'package:styleclub/app/core/widgets/app_widgets.dart';
import 'package:styleclub/app/modules/create_digital_identity/controllers/create_digital_identity_controller.dart';
import 'package:styleclub/app/routes/app_pages.dart';
import 'package:styleclub/app/services/variables.dart';

import 'package:velocity_x/velocity_x.dart';

import '../../../core/resources/app_resources.dart';
import '../../photo_upload/views/credentials.dart';
import '../controllers/add_photo_controller.dart';

class AddPhotoView extends StatefulWidget {
  AddPhotoView({Key? key}) : super(key: key);

  @override
  State<AddPhotoView> createState() => _AddPhotoViewState();
}

class _AddPhotoViewState extends State<AddPhotoView> {
  CreateDigitalIdentityController createDigitalIdentityController =
      Get.put(CreateDigitalIdentityController());

  SimpleS3 _simpleS3 = SimpleS3();
  bool isLoading = false;
  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
              child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTitle("A Photo of You"),
          20.heightBox,
          "Add a photo of you, where you look the best.\nPreferably smiling :)"
              .text
              .bold
              .size(16)
              .gray200
              .make()
              .marginOnly(left: 20),
          50.heightBox,
          variables.profilepic == '' || variables.profilepic == null
              ? Image.network(
                      "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/upload.png")
                  .centered()
              : image != null
                  ? CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: MediaQuery.of(context).size.height * 0.1,
                      child: CircleAvatar(
                        backgroundImage: FileImage(File(image!.path)),
                        radius: MediaQuery.of(context).size.height * 0.09,
                      ).onInkTap(() async {
                        image = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                        print(image!.path);
                      })).centered()
                  : CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: MediaQuery.of(context).size.height * 0.1,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(variables.profilepic),
                        radius: MediaQuery.of(context).size.height * 0.09,
                      ).onInkTap(() async {
                        image = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                        print(image!.path);
                      })).centered(),
          20.heightBox,
          "Tap to add a photo"
              .text
              .size(22)
              .bold
              .white
              .size(18)
              .make()
              .centered(),
          100.heightBox,
          isLoading == true
              ? Center(child: CircularProgressIndicator())
              : ButtonPrimary(title: "Preview").onInkTap(() async {
                  setState(() {
                    isLoading = true;
                  });
                  if (image == null) {
                    createDigitalIdentityController.profilepic.value =
                        variables.profilepic;
                  } else {
                    createDigitalIdentityController.profilepic.value =
                        await _simpleS3.uploadFile(
                      File(image!.path),
                      Credentials.s3_bucketName,
                      Credentials.s3_poolD,
                      AWSRegions.apSouth1,
                      debugLog: true,
                      s3FolderPath: "test",
                      accessControl: S3AccessControl.publicRead,
                    );
                    print(createDigitalIdentityController.profilepic.value);
                  }
                  setState(() {
                    isLoading = false;
                  });
                  Get.toNamed(Routes.SETTINGS);
                })
        ],
      ))
          .safeArea()
          .box
          .width(double.infinity)
          .height(double.infinity)
          .withDecoration(scaffoldGradient)
          .make(),
    );
  }
}
