import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:styleclub/app/core/resources/app_resources.dart';
import 'package:styleclub/app/core/widgets/app_widgets.dart';
import 'package:styleclub/app/modules/elevate_page/views/elevate_page_view.dart';
import 'package:styleclub/app/routes/app_pages.dart';
import 'package:styleclub/app/services/queryMutation.dart';
import 'package:styleclub/app/services/variables.dart';
import 'package:styleclub/gen/assets.gen.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/success_page_controller.dart';

class SuccessPageView extends GetView<SuccessPageController> {
  SuccessPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("111½11"+query.user!.user.toString());
    print(query.user!.user.stylist);
    return Scaffold(
      body: Column(
        children: [
          20.heightBox,
          buildTitle("You are all Set!"),
          "Being a member of style club you get lifelong suggestions from our very own fashion stylist!"
              .text
              .white
              .size(16)
              .make()
              .marginAll(20),
          query.user!.user.stylist == null
              ? Image.network(
                  "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/uploaded.png")
              : CircleAvatar(
                  backgroundColor: goldenColorStart,
                  radius: MediaQuery.of(context).size.height * 0.1,
                  child: CircleAvatar(
                    backgroundImage:
                        NetworkImage(query.user!.user.stylist!.image),
                    radius: MediaQuery.of(context).size.height * 0.09,
                  )),
          20.heightBox,
          query.user!.user.stylist == null
              ? "".text.bold.size(28).color(goldenColorEnd).make()
              : "${query.user!.user.stylist!.name}"
                  .text
                  .bold
                  .size(28)
                  .color(goldenColorEnd)
                  .make(),
          10.heightBox,
          query.user!.user.stylist == null
              ? "".text.white.bold.size(18).make().marginAll(20)
              : "${query.user!.user.stylist!.note}"
                  .text
                  .white
                  .bold
                  .size(18)
                  .make()
                  .marginAll(20),
          const ButtonPrimary(title: "Enter the Club!").onInkTap(() {
            query.getuser();
            print(variables.profilepic);
            Get.offNamed(Routes.MAIN_PAGE);
            //Get.toNamed();
          }),
        ],
      ).box.withDecoration(scaffoldGradient).make(),
    );
  }
}
