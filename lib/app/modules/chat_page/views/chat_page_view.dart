import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:styleclub/app/core/widgets/app_widgets.dart';
import 'package:styleclub/app/modules/book/views/book_view.dart';
import 'package:styleclub/app/modules/chat_page/controllers/chat_query.dart';
import 'package:styleclub/app/routes/app_pages.dart';
import 'package:styleclub/app/services/queryQuery.dart';
import 'package:styleclub/app/services/variables.dart';

import 'package:velocity_x/velocity_x.dart';

import '../../../core/resources/app_resources.dart';
import '../controllers/chat_page_controller.dart';

class ChatPageView extends StatelessWidget {
  // Random random = new Random();

  ChatPageView({Key? key}) : super(key: key);
  ChatPageController controller = Get.put(ChatPageController());
  ApiClients query = Get.put(ApiClients());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: scaffoldGradient,
        child: SingleChildScrollView(
          child: Column(
            children: [
              "YOUR LIFESTYLE EXPERT"
                  .text
                  .color(goldenColorStart)
                  .fontFamily('ave_black')
                  .fontWeight(FontWeight.w800)
                  .size(24)
                  .make()
                  .centered(),
              20.heightBox,
              Center(
                child: CircleAvatar(
                    radius: 100,
                    backgroundImage: query.user!.user.stylist == null
                        ? NetworkImage(
                            "https://mpf-public-data.s3.ap-south-1.amazonaws.com/Images/MPFStyleClub/TeamImages/priya.jpg")
                        : NetworkImage(query.user!.user.stylist!.image)),
              ),
              20.heightBox,
              query.user!.user.stylist == null
                  ? "Priya Jaiswal"
                      .text
                      .fontFamily('ave')
                      .fontWeight(FontWeight.w800)
                      .white
                      .size(24)
                      .make()
                  : "${query.user!.user.stylist!.name}"
                      .text
                      .fontFamily('ave')
                      .fontWeight(FontWeight.w800)
                      .white
                      .size(24)
                      .make(),
              10.heightBox,
              "Your Personal Stylist"
                  .text
                  .fontFamily('ave')
                  .fontWeight(FontWeight.w400)
                  .white
                  .size(24)
                  .make(),
              10.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/whatsapp.png",
                    scale: 4,
                  ),
                  10.widthBox,
                  Image.asset(
                    "assets/email.png",
                    scale: 4,
                  ),
                  10.widthBox,
                  Image.asset(
                    "assets/Call.png",
                    scale: 4,
                  )
                ],
              ),
              24.heightBox,
              query.user!.user.stylist == null
                  ? "I love to help my clients discover the best version of themselves.  Having me on your side can make things easy for you. You can contact me to help you choose the perfect outfit based on your skin tone, personality, and occasion. I can help you with :- \n\nFabric & Colour Selection \nStyling & measurements\nDelivery Co-ordination \nCompleting the look"
                      .text
                      .fontFamily('ave')
                      .fontWeight(FontWeight.w400)
                      .white
                      .size(18)
                      .make()
                      .pOnly(left: 32, top: 8, right: 33)
                  : "${query.user!.user.stylist!.note}"
                      .text
                      .fontFamily('ave')
                      .fontWeight(FontWeight.w400)
                      .white
                      .size(18)
                      .make()
                      .pOnly(left: 32, top: 8, right: 33),
              16.heightBox,
              Image.network(
                      'https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/bookstylist.png')
                  .pSymmetric(v: 10, h: 100)
                  .onTap(() {
                variables.stylistid = query.user == null ? "61330bcda6eddf03e04488e3" : query.user!.user.stylist == "" ||
                        query.user!.user.stylist == null
                    ? "61330bcda6eddf03e04488e3"
                    : query.user!.user.stylist!.id;

                print(variables.stylistid);
                Get.toNamed(Routes.BOOK);
              }),
            ],
          ),
        ),
      ),
    );
    //   stylist.obx(
    //     onLoading: Shimmer.fromColors(
    //       baseColor: const Color.fromARGB(
    //         255,
    //         52,
    //         65,
    //         83,
    //       ),
    //       highlightColor: Colors.grey[100] as Color,
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Image.network(
    //               'https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/lifestyleexp.jpeg'),
    //           16.heightBox,

    //           "YOUR LIFESTYLE EXPERT"
    //               .text
    //               .white
    //               .fontFamily('ave')
    //               .fontWeight(FontWeight.w400)
    //               .size(16)
    //               .make()
    //               .pOnly(left: 32),
    //           // 20.heightBox,
    //           // Image.network("https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/"Assets.images.stylist.path).centered(),
    //           8.heightBox,
    //           "Ritika Goel"
    //               .text
    //               .fontFamily('ave_black')
    //               .fontWeight(FontWeight.w800)
    //               .bold
    //               .color(goldenColorEnd)
    //               .size(24)
    //               .make()
    //               .pOnly(left: 32, top: 8),
    //           24.heightBox,
    //           Faker()
    //               .lorem
    //               .sentences(6)
    //               .join(" ")
    //               .text
    //               .fontFamily('dmsans')
    //               .fontWeight(FontWeight.w400)
    //               .white
    //               .size(18)
    //               .make()
    //               .pOnly(left: 32, top: 8, right: 33),
    //           // "Your Personal Stylist".text.fontFamily('dmsans').fontWeight(FontWeight.w800).white.size(28).make(),
    //           10.heightBox,
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               Image.network(
    //                   "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/whatsapp.png"),
    //               Image.network(
    //                       "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/Call.png")
    //                   .marginOnly(left: 20, right: 20),
    //               Image.network(
    //                   "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/mail.png"),
    //             ],
    //           ),
    //           //40.heightBox,
    //           // buildMainTitle("TOP TRENDING HAIRCUTS", 14),
    //           //20.heightBox,
    //         ],
    //       ),
    //     ),
    //     (data) => Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         // Image.network('https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/lifestyleexp.jpeg'),
    //         Image.network(
    //           data![1]["image"].toString(),
    //           fit: BoxFit.fitWidth,
    //         ),
    //         16.heightBox,

    //         "YOUR LIFESTYLE EXPERT"
    //             .text
    //             .white
    //             .fontFamily('ave')
    //             .fontWeight(FontWeight.w400)
    //             .size(16)
    //             .make()
    //             .pOnly(left: 32),
    //         // 20.heightBox,
    //         // Image.network("https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/"Assets.images.stylist.path).centered(),
    //         8.heightBox,
    //         data[1]["name"]
    //             .toString()
    //             .text
    //             .fontFamily('ave_black')
    //             .fontWeight(FontWeight.w800)
    //             .bold
    //             .color(goldenColorEnd)
    //             .size(24)
    //             .make()
    //             .pOnly(left: 32, top: 8),
    //         24.heightBox,
    //         data[1]["note"]
    //             .toString()
    //             .text
    //             .fontFamily('dmsans')
    //             .fontWeight(FontWeight.w400)
    //             .white
    //             .size(18)
    //             .make()
    //             .pOnly(left: 32, top: 8, right: 33),
    //         // "Your Personal Stylist".text.fontFamily('dmsans').fontWeight(FontWeight.w800).white.size(28).make(),
    //         10.heightBox,
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Image.network(
    //                 "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/whatsapp.png"),
    //             Image.network(
    //                     "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/Call.png")
    //                 .marginOnly(left: 20, right: 20),
    //             Image.network(
    //                 "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/mail.png"),
    //             Image.network(
    //                     'https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/bookstylist.png')
    //                 .w(150)
    //                 .onTap(() {
    //               variables.stylistid =
    //                   data[1]["id"] ?? style.stylistData!.getAllStylists[1].id;
    //               // variables.stylistid = style.stylistData!.getAllStylists[1].id;
    //               Get.toNamed(Routes.BOOK);
    //             }),
    //           ],
    //         ),
    //         //40.heightBox,
    //         // buildMainTitle("TOP TRENDING HAIRCUTS", 14),
    //         //20.heightBox,
    //       ],
    //     ),
    //   ),
    // )
    //     .safeArea()
    //     .box
    //     .width(double.infinity)
    //     .height(double.infinity)
    //     .withDecoration(scaffoldGradient)
    //     .make();
  }
}
