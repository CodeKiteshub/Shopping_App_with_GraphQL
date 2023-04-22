import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:styleclub/app/core/widgets/app_widgets.dart';

import 'package:velocity_x/velocity_x.dart';

import '../../../core/resources/app_resources.dart';
import '../controllers/connected_controller.dart';

class ConnectedView extends GetView<ConnectedController> {
  const ConnectedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Column(mainAxisSize: MainAxisSize.min, children: [
        const ButtonPrimary(title: "Set it up!"),
        20.heightBox,
        "Later, I want to Explore!"
            .text
            .bold
            .underline
            .color(goldenColorEnd)
            .make(),
        30.heightBox,
      ]).p(10).box.color(themeGradientColorStart).make(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network("https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/right.png"),
          20.heightBox,
          "Connected!".text.size(22).white.bold.make()
        ],
      )
          .safeArea()
          .box
          .width(double.infinity)
          .height(double.infinity)
          .withDecoration(scaffoldGradient)
          .make(),
    );
  }
}
