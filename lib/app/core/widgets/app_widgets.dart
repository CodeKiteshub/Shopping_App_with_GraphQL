// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styleclub/app/core/resources/app_resources.dart';
import 'package:styleclub/app/modules/onboarding/views/range_tags.dart';
import 'package:styleclub/app/routes/app_pages.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:styleclub/app/modules/onboarding/controllers/onboarding_controller.dart';

import '../../modules/onboarding/controllers/onboarding_controller.dart';
import 'package:sizer/sizer.dart';
//import 'package:auto_size_text/auto_size_text.dart';

OnboardingController controller1 = OnboardingController();

class CustomScaffold extends StatelessWidget {
  const CustomScaffold(
    Key? key,
    this.body,
  ) : super(key: key);

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [themeGradientColorStart, themeGradientColorStart],
            begin: FractionalOffset(0.1, 0.0),
            end: FractionalOffset(0.0, 0.5),
            stops: [0.0, 1.0],
          )),
          child: body),
    );
  }
}

class Imagewidget extends StatelessWidget {
  final String img;
  const Imagewidget({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: img,
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}

class ButtonPrimary extends StatelessWidget {
  const ButtonPrimary({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return title.text.bold
        .fontFamily('ave_black')
        .color(Color.fromARGB(255, 112, 60, 0))
        .maxFontSize(21)
        .minFontSize(20)
        .make()
        .centered()
        .box
        .withDecoration(BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              goldenColorStart,
              goldenColorEnd,
            ],
          ),
          borderRadius: BorderRadius.circular(20),
        ))
        .width(double.infinity)
        .height(50)
        .margin(const EdgeInsets.only(left: 20, right: 20))
        .make();
  }
}

buildOnboadingTitle(String title) {}

buildTextfield() {
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.only(left: 20, right: 70),
        child: SizedBox(
          child: VxTextField(
            hint: 'Please enter your reponse',
            maxLine: 1,
            fillColor: Vx.white,
            borderRadius: 10,
            borderType: VxTextFieldBorderType.roundLine,
            borderColor: Vx.white,
          ),
        ),
      ),
      5.heightBox,
    ],
  );
}

buildImagetext() {}

buildTitle(String title) {
  return title.text.white
      .size(32)
      .fontFamily('ave_black')
      .fontWeight(FontWeight.w800)
      .bold
      .make()
      .marginOnly(left: 20, top: 50);
}

buildintTitle(String title) {
  return title.text.white
      .size(12)
      .fontFamily('ave_black')
      .fontWeight(FontWeight.w800)
      .bold
      .make()
      .marginOnly(left: 20, top: 50);
}

class BuildImageGridOption extends StatelessWidget {
  BuildImageGridOption({Key? key, required this.title, required this.image})
      : super(key: key);

  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.1632,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(50)),
              child: Image.network(
                image,
                fit: BoxFit.cover,
              )),
          title.text
              .size(10)
              .fontFamily('ave_black')
              .fontWeight(FontWeight.w900)
              .bold
              .make(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.004,
          )
        ],
      ),
    )
        //     .p(2)
        //     .box
        //     .white
        //     .border(
        //         color: selectedindex.value ? controller1.selectedColor : Vx.white,
        //         width: 5)
        //     .roundedSM
        //     .margin(const EdgeInsets.all(10))
        //     .make()
        //     .onInkTap(() {
        //   selectedindex.value = !selectedindex.value;
        // }),
        );
  }
}

ListView buildHorizontalListView(Widget listitem) {
  return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      shrinkWrap: true,
      itemBuilder: (ctx, index) {
        return listitem;
      });
}

ListView buildVerticalListView(Widget listitem) {
  return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 5,
      shrinkWrap: true,
      itemBuilder: (ctx, index) {
        return listitem;
      });
}

Widget buildMainTitle(String title, double size) => title.text
    .size(size)
    .fontFamily('ave_black')
    .fontWeight(FontWeight.w800)
    .color(goldenColorEnd)
    .bold
    .make();

buildStackInfo(String image, String title) {
  return Stack(
    children: [
      Column(
        children: [
          Image.network(
            image,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
                color: Vx.hexToColor("#FFECC8"),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          title.text
              .size(12)
              .fontFamily('ave_black')
              .fontWeight(FontWeight.w800)
              .bold
              .hexColor("#723D00")
              .make(),
          Faker()
              .lorem
              .sentences(2)
              .join(" ")
              .text
              .size(10)
              .fontFamily('dmsans')
              .fontWeight(FontWeight.w400)
              .gray400
              .make()
        ],
      )
          .p(10)
          .box
          .roundedSM
          .hexColor("#FFE9A5")
          .margin(const EdgeInsets.only(left: 10, right: 10))
          .make()
          .positioned(bottom: 10, left: 20, right: 20)
    ],
  ).box.width(double.infinity).rounded.margin(const EdgeInsets.all(10)).make();
}
