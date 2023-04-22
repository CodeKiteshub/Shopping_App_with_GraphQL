import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';

import 'package:get/get.dart';
import 'package:styleclub/app/core/widgets/app_widgets.dart';

import '../../../../gen/assets.gen.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      key,
      FadeIn(
        duration: Duration(seconds: controller.duration),
        child: Column(children: [
          Image.network("https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/splash-top.png"),
          Padding(
            padding: EdgeInsets.only(top: 77),
            child: Image.network("https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/splash.png"),
          )
        ]),
      ),
    );
  }
}
