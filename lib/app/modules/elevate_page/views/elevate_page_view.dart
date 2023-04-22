import 'package:flutter/material.dart';
import 'package:styleclub/gen/fonts.gen.dart';
import '../../../routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:styleclub/app/core/resources/app_resources.dart';
import 'package:styleclub/app/routes/app_pages.dart';

import 'package:velocity_x/velocity_x.dart';
import 'package:styleclub/app/services/queryQuery.dart';
import '../controllers/elevate_page_controller.dart';
import 'package:slide_to_act/slide_to_act.dart';

ApiClients query = Get.put(ApiClients());
final GlobalKey<SlideActionState> _key = GlobalKey();

class ElevatePageView extends GetView<ElevatePageController> {
  const ElevatePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.network(
                "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/elevate.png",
                width: double.infinity,
                height: 650,
                fit: BoxFit.fill,
              ),
              // Align(
              //   alignment: AlignmentDirectional.bottomCenter,

              //
              //   }),
              // )
            ],
          ).h(
            MediaQuery.of(context).size.height * 0.75,
          ),

          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 18),
            child: "Welcome to Style Club!"
                .text
                .color(goldenColorEnd)
                .bold
                .size(30)
                .fontFamily('ave_black')
                .fontWeight(FontWeight.w800)
                .make(),
          ),

          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 45),
            child: SlideAction(
              height: MediaQuery.of(context).size.height * 0.07,
              outerColor: Color.fromARGB(255, 38, 58, 78),
              key: _key,
              onSubmit: () {
                Get.toNamed(Routes.SIGNUP_PAGE);
                Future.delayed(
                  Duration(seconds: 1),
                  () => _key.currentState?.reset(),
                );
              },
              alignment: Alignment.center,
              child: Text(
                'SWIPE TO ELEVATE',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: FontFamily.ave,
                    fontSize: 24),
              ),
              innerColor: Color.fromARGB(
                255,
                61,
                77,
                94,
              ),
              sliderButtonIcon: Image.network(
                  'https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/arrow.png'),
            ),
          )

          // 8.heightBox,
          // "Swipe up and experience to the best".text.bold.size(17).fontFamily('dmsans').fontWeight(FontWeight.w700).white.make()
        ],
      ).box.withDecoration(scaffoldGradient).make(),
    );
  }
}
