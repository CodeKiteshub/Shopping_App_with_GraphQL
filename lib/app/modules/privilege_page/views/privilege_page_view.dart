import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:styleclub/app/core/widgets/app_widgets.dart';
import 'package:styleclub/gen/assets.gen.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/resources/app_resources.dart';
import '../controllers/privilege_page_controller.dart';

PrivilegePageController2 category = Get.put(PrivilegePageController2());
PrivilegePageController3 branches = Get.put(PrivilegePageController3());

class PrivilegePageView extends GetView<PrivilegePageController> {
  const PrivilegePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget buildTravelBlogs() {
      return controller.obx(
        onLoading: Shimmer.fromColors(
          baseColor: const Color.fromARGB(
            255,
            52,
            65,
            83,
          ),
          highlightColor: Colors.grey[100] as Color,
          child: Container(
            height: 240,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Image.network(
                            "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/grouphoto.png"),
                        10.heightBox,
                        "{dataindextitle}"
                            .text
                            .fontFamily('ave')
                            .size(10)
                            .ellipsis
                            .fontFamily('dmsans')
                            .fontWeight(FontWeight.w800)
                            .bold
                            .make(),
                        5.heightBox,
                        "{dataindexname}"
                            .text
                            .fontFamily('ave')
                            .size(10)
                            .ellipsis
                            .fontFamily('dmsans')
                            .fontWeight(FontWeight.w800)
                            .bold
                            .gray400
                            .make(),
                        5.heightBox,
                        "{dataindexnote}"
                            .text
                            .fontFamily('ave')
                            .size(10)
                            .ellipsis
                            .fontFamily('dmsans')
                            .fontWeight(FontWeight.w800)
                            .bold
                            .gray400
                            .make()
                      ])
                      .paddingAll(5)
                      .box
                      .white
                      .roundedSM
                      .margin(const EdgeInsets.all(5))
                      .make()
                      .h(240)
                      .w(200);
                }),
          ),
        ),
        (data) => Container(
          height: 240,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: data!.length,
              shrinkWrap: true,
              itemBuilder: (ctx, index) {
                return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      data[index]['images'][0] == null
                          ? Image.network(
                              "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/grouphoto.png")
                          : Container(
                              height: 140,
                              width: 200,
                              child: Image.network(data[index]['images'][0],
                                  fit: BoxFit.fitHeight)),
                      10.heightBox,
                      "${data[index]['title']}"
                          .text
                          .fontFamily('ave')
                          .size(10)
                          .ellipsis
                          .fontFamily('dmsans')
                          .fontWeight(FontWeight.w800)
                          .bold
                          .make(),
                      5.heightBox,
                      "${data[index]['name']}"
                          .text
                          .fontFamily('ave')
                          .size(10)
                          .ellipsis
                          .fontFamily('dmsans')
                          .fontWeight(FontWeight.w800)
                          .bold
                          .gray400
                          .make(),
                      5.heightBox,
                      "${data[index]['note']}"
                          .text
                          .fontFamily('ave')
                          .size(10)
                          .ellipsis
                          .fontFamily('dmsans')
                          .fontWeight(FontWeight.w800)
                          .bold
                          .gray400
                          .make()
                    ])
                    .paddingAll(5)
                    .box
                    .white
                    .roundedSM
                    .margin(const EdgeInsets.all(5))
                    .make()
                    .h(240)
                    .w(200);
              }),
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildAppBar(),
            10.heightBox,
            category.obx(
              onLoading: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.network(
                            "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/travel.png"),
                        10.heightBox,
                        "TRAVEL"
                            .text
                            .size(12)
                            .fontFamily('ave_black')
                            .fontWeight(FontWeight.w800)
                            .make()
                      ],
                    ).marginAll(10);
                  }).h(120),
              (data) => ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data!.length,
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.network(
                            "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/travel.png"),
                        10.heightBox,
                        "${data[index]["title"]}"
                            .text
                            .ellipsis
                            .size(12)
                            .fontFamily('ave_black')
                            .fontWeight(FontWeight.w800)
                            .make()
                      ],
                    ).marginAll(10);
                  }).h(120),
            ),
            // buildHorizontalListView(Column(
            //   mainAxisSize: MainAxisSize.min,
            //   children: [
            //     Image.network("https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/travel.png"),
            //     10.heightBox,
            //     "TRAVEL"
            //         .text
            //         .size(12)
            //         .fontFamily('ave_black')
            //         .fontWeight(FontWeight.w800)
            //         .make()
            //   ],
            // ).marginAll(10))
            //     .h(120),
            20.heightBox,
            buildMainTitle("BOOK TRAVEL", 12),
            buildBookingTravel(),
            10.heightBox,
            const ButtonPrimary(title: "VIEW MORE"),
            40.heightBox,
            buildMainTitle("MPF TRAVEL BLOGS", 12),
            10.heightBox,
            buildTravelBlogs().h(240),
            20.heightBox,
            buildMainTitle("PREMIUM SPF SUGGETS", 12),
            10.heightBox,
            buildStackInfo(
                "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/premiummpf.png",
                "TOP AUGUST 2022 TRAVELS")
          ],
        ).marginAll(10),
      )
          .safeArea()
          .box
          .withDecoration(scaffoldGradient)
          .height(double.infinity)
          .width(double.infinity)
          .make(),
    );
  }

  Widget buildBookingTravel() {
    return branches.obx(
      (data) => ListView.builder(
          shrinkWrap: true,
          itemCount: data!.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (ctx, index) {
            return Row(
              children: [
                Image.network(
                  "${data[index]["imageAndVideos"][0]["url"]}",
                  height: 121,
                  width: 121,
                ),
                10.widthBox,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    "${data[index]["name"]}"
                        .text
                        .size(10)
                        .fontFamily('dmsans')
                        .fontWeight(FontWeight.w800)
                        .bold
                        .make(),
                    5.heightBox,
                    Row(
                      children: [
                        SvgPicture.network(
                            "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/star.svg"),
                        5.widthBox,
                        "${data[index]["googleRating"]}"
                            .text
                            .size(10)
                            .fontFamily('dmsans')
                            .fontWeight(FontWeight.w800)
                            .gray400
                            .make()
                      ],
                    ),
                    5.heightBox,
                    Row(
                      children: [
                        SvgPicture.network(
                            "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/sparklefill.svg"),
                        5.widthBox,
                        "${data[index]["address"]}"
                            .text
                            .size(10)
                            .fontFamily('dmsans')
                            .fontWeight(FontWeight.w800)
                            .gray400
                            .make()
                      ],
                    ),
                    5.heightBox,
                    // "Jubilee Hills, Hyderabad"
                    //     .text
                    //     .size(10)
                    //     .fontFamily('dmsans')
                    //     .fontWeight(FontWeight.w800)
                    //     .gray400
                    //     .make(),
                    5.heightBox,
                    Row(
                      children: [
                        Image.network(
                            "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/call2.png"),
                        10.widthBox,
                        Image.network(
                            "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/bookappointment.png"),
                        10.widthBox,
                      ],
                    )
                  ],
                ).expand()
              ],
            ).p(10).box.white.roundedSM.margin(const EdgeInsets.all(10)).make();
          }),
    );
  }

  buildAppBar() {
    return Row(
      children: [
        const Icon(
          Icons.arrow_back,
          color: Vx.white,
        ).onTap(() {
          Get.back();
        }),
        10.widthBox,
        buildMainTitle("PRIVILEGES", 22).expand(),
        Row(
          children: [
            const Icon(
              Icons.search,
              color: Vx.gray200,
            ),
            5.widthBox,
            "Search".text.size(18).gray200.make()
          ],
        )
      ],
    );
  }
}
