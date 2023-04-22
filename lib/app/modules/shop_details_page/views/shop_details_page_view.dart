import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:styleclub/app/core/resources/app_resources.dart';
import 'package:styleclub/app/core/widgets/app_widgets.dart';

import 'package:styleclub/app/routes/app_pages.dart';
import 'package:styleclub/app/services/queryMutation.dart';
import 'package:styleclub/app/services/variables.dart';
import 'package:styleclub/gen/assets.gen.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/shop_details_page_controller.dart';

class ShopDetailsPageView extends GetView<ShopDetailsPageController> {
  ShopDetailsPageView({Key? key}) : super(key: key);
  LooksProduct look = Get.put(LooksProduct());
  int index = variables.product;
  ApiClients mutation = ApiClients();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: look.obx(
          (state) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Stack(
                    children: [
                      ImageSlideshow(
                        width: double.infinity,
                        height: 400,
                        initialPage: 0,
                        indicatorColor: Colors.blue,
                        indicatorBackgroundColor: Colors.grey,
                        children: [
                          Image.network(
                            state![index]["images"][0],
                            fit: BoxFit.cover,
                          ),
                          Image.network(
                            state![index]["products"][0]["images"][0],
                            fit: BoxFit.cover,
                          ),
                          Image.network(
                            state![index]["products"][0]["images"][1],
                            fit: BoxFit.cover,
                          ),
                        ],
                        onPageChanged: (value) {
                          controller.pageIndex.value = value;
                        },
                        autoPlayInterval: 3000,
                        isLoop: true,
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.arrow_back,
                    color: Vx.white,
                  ).onTap(() {
                    Get.back();
                  }),
                  Image.network(
                          "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/addcart.png")
                      .onInkTap(() {
                    for (int i = 0; i < state[index]["products"].length; i++) {
                    

                      mutation.add_item_cart(
                          state![index]["products"][i]["_id"].toString(),
                          state![index]["products"][i]["catId"].toString(),
                          int.parse(state![index]["products"][i]["deliveryDays"]
                              .toString()),
                          state![index]["products"][i]["title"].toString(),
                          int.parse(
                              state![index]["products"][i]["price"].toString()),
                          state![index]["_id"].toString(),
                          state![index]["products"][i]["images"][0].toString());
                    }
                    //  Get.toNamed(Routes.CART_PAGE);
                  }).positioned(bottom: 30, right: 20),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "${state![index]["title"].toString()}"
                          .text
                          .white
                          .bold
                          .size(28)
                          .make(),
                      10.heightBox,
                      Row(
                        children: [
                          SvgPicture.network(
                              "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/sparklefill.svg"),
                          10.widthBox,
                          "${state![index]["openTags"].toString()}"
                              .text
                              .white
                              .bold
                              .size(14)
                              .make()
                        ],
                      )
                    ],
                  ).positioned(bottom: 30, left: 20)
                ],
              ),
              20.heightBox,
              buildMainTitle("ABOUT", 16).marginOnly(left: 20),
              10.heightBox,

              state![index]["description"]
                  .toString()
                  .text
                  .white
                  .make()
                  .marginOnly(left: 20),
              10.heightBox,
              // buildItems().h(230),
              ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state![index]["products"].length,
                  shrinkWrap: true,
                  itemBuilder: (ctx, index1) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.network(
                                state![index]["products"][index1]["images"][0])
                            .w(90),
                        5.heightBox,
                        "${state![index]["products"][index1]["title"]}"
                            .text
                            .bold
                            .make(),
                        5.heightBox,
                        "₹${state![index]["products"][index1]["discPrice"]}"
                            .text
                            .gray400
                            .make()
                      ],
                    )
                        .p(10)
                        .box
                        .roundedSM
                        .white
                        .margin(const EdgeInsets.all(10))
                        .make();
                  }).h(230),
              20.heightBox,
              buildMainTitle("YOU MIGHT ALSO LIKE", 14).marginOnly(left: 20),
              buildItems().h(230),
              20.heightBox,
            ],
          ),
        ),
      )
          .safeArea()
          .box
          .width(double.infinity)
          .withDecoration(scaffoldGradient)
          .height(double.infinity)
          .make(),
    );
  }

  Widget buildItems() {
    return look.obx(
      onLoading: Shimmer.fromColors(
        baseColor: const Color.fromARGB(
          255,
          52,
          65,
          83,
        ),
        highlightColor: Colors.grey[100] as Color,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            shrinkWrap: true,
            itemBuilder: (ctx, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                      "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/shirt.png"),
                  5.heightBox,
                  "Green Flannnel Shirt".text.bold.make(),
                  5.heightBox,
                  "\$24.99".text.gray400.make()
                ],
              )
                  .p(10)
                  .box
                  .roundedSM
                  .white
                  .margin(const EdgeInsets.all(10))
                  .make();
            }),
      ),
      (data) => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data!.length,
          shrinkWrap: true,
          itemBuilder: (ctx, index1) {
            return index1 != index
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        "${data[index1]["images"][0]}",
                        height: 137,
                        width: 137,
                      ),
                      5.heightBox,
                      data[index1]["title"].toString().text.bold.make(),
                      5.heightBox,
                      "\$${data[index]["price"]}".text.gray400.make()
                    ],
                  )
                    .p(10)
                    .box
                    .roundedSM
                    .white
                    .margin(const EdgeInsets.all(10))
                    .make()
                : SizedBox(
                    width: 0,
                    height: 0,
                  );
          }),
    );
    // return buildHorizontalListView(Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     Image.network("https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/shirt.png"),
    //     5.heightBox,
    //     "Green Flannnel Shirt".text.bold.make(),
    //     5.heightBox,
    //     "\$24.99".text.gray400.make()
    //   ],
    // ).p(10).box.roundedSM.white.margin(const EdgeInsets.all(10)).make());
  }

  Stack BuildImageSlider() {
    return Stack(
      children: [
        Stack(
          children: [
            ImageSlideshow(
              width: double.infinity,
              height: 400,
              initialPage: 0,
              indicatorColor: Colors.blue,
              indicatorBackgroundColor: Colors.grey,
              children: [
                Image.network(
                  "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/slider1.png",
                  fit: BoxFit.cover,
                ),
                Image.network(
                  "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/slider2.png",
                  fit: BoxFit.cover,
                ),
                Image.network(
                  "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/slider1.png",
                  fit: BoxFit.cover,
                ),
              ],
              onPageChanged: (value) {
                controller.pageIndex.value = value;
              },
              autoPlayInterval: 3000,
              isLoop: true,
            ),
          ],
        ),
        const Icon(
          Icons.arrow_back,
          color: Vx.white,
        ).onTap(() {
          Get.back();
        }),
        Image.network(
                "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/addcart.png")
            .onInkTap(() {
          Get.toNamed(Routes.CART_PAGE);
        }).positioned(bottom: 30, right: 20),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "A Fresh Look".text.white.bold.size(28).make(),
            10.heightBox,
            Row(
              children: [
                SvgPicture.network(
                    "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/sparklefill.svg"),
                10.widthBox,
                "Most Popular Look".text.white.bold.size(14).make()
              ],
            )
          ],
        ).positioned(bottom: 30, left: 20)
      ],
    );
  }
}
