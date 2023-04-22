import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:styleclub/app/modules/create_digital_identity/controllers/create_digital_identity_controller.dart';

import 'package:velocity_x/velocity_x.dart';

import '../../../core/resources/app_resources.dart';
import '../../../core/widgets/app_widgets.dart';
import '../../../routes/app_pages.dart';
import '../controllers/edit_social_media_controller.dart';

bool val = false;

class EditSocialMediaView extends GetView<EditSocialMediaController> {
  EditSocialMediaView({Key? key}) : super(key: key);
  CreateDigitalIdentityController createDigitalIdentityController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTitle("Social Media"),
            20.heightBox,
            "Add all socials, all in one place.\nCopy and Paste Links here"
                .text
                .white
                .size(18)
                .make(),
            60.heightBox,
            Row(
              children: [
                SvgPicture.network(
                    "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/insta2.svg"),
                20.widthBox,
                buildTextField("https://www.instagram.com/..",
                        controller.instagramController)
                    .expand()
              ],
            ),
            40.heightBox,
            Row(
              children: [
                SvgPicture.network(
                    "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/linkdin2.svg"),
                20.widthBox,
                buildTextField("https://www.linkedin.com/..",
                        controller.linkedinController)
                    .expand()
              ],
            ),
            40.heightBox,
            Row(
              children: [
                SvgPicture.network(
                    "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/twitter2.svg"),
                20.widthBox,
                buildTextField("https://www.twitter.com/rachitxdesign",
                        controller.twitterController)
                    .expand()
              ],
            ),
            40.heightBox,
            InkWell(
              onTap: () {
               createDigitalIdentityController. isTapped.value = createDigitalIdentityController. isTapped.value == true ? false : true;
              },
              child: Row(
                children: [
                  SvgPicture.network(
                      "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/add.svg"),
                  20.widthBox,
                buildTextField("Add more", controller.otherController)
                          .onTap(() {
                        val = !val;
                      }).expand()
                ],
              ),
            ),
            20.heightBox,
            Obx(() {
              return createDigitalIdentityController. isTapped.value == false ? Container() : DropdownButton<String>(
                value: createDigitalIdentityController. dropdownValue.value,
                // icon: SvgPicture.network(
                //                   "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/add.svg"),
                // iconSize: 24,
                // elevation: 16,
                style: const TextStyle(color: Colors.white),
                underline: Container(),
                dropdownColor: themeGradientColorEnd,
                onChanged: (String? newValue) {
               createDigitalIdentityController.   dropdownValue.value = newValue!;
                },
                items: <String>["Whatsapp", "Facebook", "Phone"]
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }).toList(),
              )
                  .box
                  .roundedSM
                  .color(themeGradientColorEnd)
                  .padding(EdgeInsets.only(left: 20, right: 20))
                  .make();
            }),
            40.heightBox,
            ButtonPrimary(title: "Add a Photo").onInkTap(() {
              if (controller.instagramController.text.length == 0 ||
                  controller.linkedinController.text.length == 0) {
                Get.defaultDialog(
                    title: "Error", content: Text("Plese Fill all fields."));
              } else {
                createDigitalIdentityController.instagram.value =
                    controller.instagramController.text;
                createDigitalIdentityController.linkedinprofile.value =
                    controller.linkedinController.text;
                createDigitalIdentityController.twitterprofile.value =
                    controller.twitterController.text;
                createDigitalIdentityController.otherprofile.value =
                    controller.otherController.text;
                Get.toNamed(Routes.ADD_PHOTO);
              }
            }),
          ],
        ).marginAll(10),
      )
          .box
          .width(double.infinity)
          .height(double.infinity)
          .withDecoration(scaffoldGradient)
          .make(),
    );
  }

  Widget buildTextField(String hint, TextEditingController controller,
      {int length = 2}) {
    return TextField(
      controller: controller,
      style: TextStyle(color: Vx.gray200),
      decoration: InputDecoration(
          hintStyle: TextStyle(color: Vx.gray200),
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 10),
          hintText: hint),
    ).box.roundedSM.color(themeGradientColorEnd).make();
  }
}
