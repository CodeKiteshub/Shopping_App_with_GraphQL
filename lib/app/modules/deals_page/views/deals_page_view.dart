import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';


import '../../../core/resources/app_resources.dart';
import '../../../core/widgets/app_widgets.dart';
import '../controllers/deals_page_controller.dart';

DealsPageController2 deals = Get.put(DealsPageController2());

class DealsPageView extends GetView<DealsPageController> {
  const DealsPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: deals.obx(
        (data) => SingleChildScrollView(
                child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildMainTitle("DEALS AND VOUCHERS", 20),
            10.heightBox,
            Row(
              children: [
                SizedBox(
                  width: 5,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  data!.getUserDealsAndVoucher!.activeVoucherCount
                      .toString()
                      .text
                      .fontFamily('poppins')
                      .bold
                      .white
                      .size(18)
                      .make(),
                  10.heightBox,
                  "ACTIVE".text.fontFamily('poppins').gray200.bold.make()
                ]).expand(),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  data!.getUserDealsAndVoucher!.totalVoucherCount
                      .toString()
                      .text
                      .fontFamily('poppins')
                      .bold
                      .white
                      .size(18)
                      .make(),
                  10.heightBox,
                  "TOTAL VOUCHERS WON"
                      .text
                      .fontFamily('poppins')
                      .gray200
                      .bold
                      .make()
                ]).expand(),
              ],
            ),
            20.heightBox,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                "TOTAL MONEY Saved"
                    .text
                    .fontFamily('poppins')
                    .bold
                    .size(16)
                    .color(goldenColorEnd)
                    .bold
                    .make()
                    .expand(),
                data!.getUserDealsAndVoucher!.totalMoneySaved
                    .toString()
                    .text
                    .fontFamily('poppins')
                    .size(18)
                    .bold
                    .hexColor("#79F65C")
                    .make()
              ],
            )
                .p(10)
                .box
                .color(themeGradientColorEnd)
                .border(color: Vx.white)
                .roundedSM
                .make(),
            20.heightBox,
            buildMainTitle("REDEEM YOUR VOUCHERS", 18),
            ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: data!.getUserDealsAndVoucher!.vouchers!.length,
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      data!.getUserDealsAndVoucher!.vouchers![index].image == ""
                          ? Image.network("https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/grouphoto.png")
                          : Image.network(data!
                              .getUserDealsAndVoucher!.vouchers![index].image
                              .toString()),
                      10.heightBox,
                      "${data!.getUserDealsAndVoucher!.vouchers![index].title}"
                          .text
                          .fontFamily('ave')
                          .size(10)
                          .fontFamily('dmsans')
                          .fontWeight(FontWeight.w800)
                          .bold
                          .make(),
                      5.heightBox,
                      "${data!.getUserDealsAndVoucher!.vouchers![index].note}"
                          .text
                          .fontFamily('ave')
                          .size(10)
                          .fontFamily('dmsans')
                          .fontWeight(FontWeight.w800)
                          .bold
                          .gray400
                          .make(),
                      5.heightBox,
                      "${data!.getUserDealsAndVoucher!.vouchers![index].redeemedCount}+ people redeemed"
                          .text
                          .fontFamily('ave')
                          .size(10)
                          .fontFamily('dmsans')
                          .fontWeight(FontWeight.w800)
                          .bold
                          .gray400
                          .make()
                    ],
                  )
                      .paddingAll(5)
                      .box
                      .white
                      .roundedSM
                      .margin(const EdgeInsets.all(5))
                      .make();
                }).h(240),
            10.heightBox,
            buildInviteNow(),
            10.heightBox,
            buildPastVouchers()
          ],
        ))
            .marginAll(15)
            .safeArea()
            .box
            .width(double.infinity)
            .height(double.infinity)
            .withDecoration(scaffoldGradient)
            .make(),
        onLoading: SingleChildScrollView(
                child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildMainTitle("DEALS AND VOUCHERS", 20),
            10.heightBox,
            Row(
              children: [
                SizedBox(
                  width: 5,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  "1".text.fontFamily('poppins').bold.white.size(18).make(),
                  10.heightBox,
                  "ACTIVE".text.fontFamily('poppins').gray200.bold.make()
                ]).expand(),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  "6".text.fontFamily('poppins').bold.white.size(18).make(),
                  10.heightBox,
                  "TOTAL VOUCHERS WON"
                      .text
                      .fontFamily('poppins')
                      .gray200
                      .bold
                      .make()
                ]).expand(),
              ],
            ),
            20.heightBox,
            buildMoneySaved(),
            20.heightBox,
            buildMainTitle("REDEEM YOUR VOUCHERS", 18),
            buildHorizontalListView(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network("https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/grouphoto.png"),
                10.heightBox,
                "50% OFF on Haircuts"
                    .text
                    .fontFamily('ave')
                    .size(10)
                    .fontFamily('dmsans')
                    .fontWeight(FontWeight.w800)
                    .bold
                    .make(),
                5.heightBox,
                "Shears by Arun"
                    .text
                    .fontFamily('ave')
                    .size(10)
                    .fontFamily('dmsans')
                    .fontWeight(FontWeight.w800)
                    .bold
                    .gray400
                    .make(),
                5.heightBox,
                "400+ people redeemed"
                    .text
                    .fontFamily('ave')
                    .size(10)
                    .fontFamily('dmsans')
                    .fontWeight(FontWeight.w800)
                    .bold
                    .gray400
                    .make()
              ],
            )
                    .paddingAll(5)
                    .box
                    .white
                    .roundedSM
                    .margin(const EdgeInsets.all(5))
                    .make())
                .h(240),
            10.heightBox,
            buildInviteNow(),
            10.heightBox,
            buildPastVouchers()
          ],
        ))
            .marginAll(15)
            .safeArea()
            .box
            .width(double.infinity)
            .height(double.infinity)
            .withDecoration(scaffoldGradient)
            .make(),
      ),
    );
  }

  Widget buildPastVouchers() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        "VIEW PAST VOUCHERS"
            .text
            .fontFamily('poppins')
            .bold
            .size(16)
            .color(goldenColorEnd)
            .bold
            .make(),
        5.widthBox,
        const Icon(
          Icons.arrow_forward,
          color: goldenColorEnd,
          size: 18,
        )
      ],
    )
        .p(20)
        .box
        .color(themeGradientColorEnd)
        .border(color: Vx.white)
        .roundedSM
        .make();
  }

  Widget buildInviteNow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Easy way to save more"
            .text
            .fontFamily('poppins')
            .bold
            .size(18)
            .hexColor(brownColor)
            .make(),
        10.heightBox,
        "Invite friends, earn vouchers"
            .text
            .fontFamily('poppins')
            .gray500
            .make(),
        10.heightBox,
        "invite now "
            .text
            .fontFamily('poppins')
            .white
            .bold
            .size(18)
            .make()
            .p(10)
            .box
            .roundedSM
            .hexColor(brownColor)
            .make(),
      ],
    ).p(10).box.hexColor("#E3CF88").rounded.width(double.infinity).make();
  }

  Widget buildMoneySaved() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        "TOTAL MONEY Saved"
            .text
            .fontFamily('poppins')
            .bold
            .size(16)
            .color(goldenColorEnd)
            .bold
            .make()
            .expand(),
        "Rs.2460.20"
            .text
            .fontFamily('poppins')
            .size(18)
            .bold
            .hexColor("#79F65C")
            .make()
      ],
    )
        .p(10)
        .box
        .color(themeGradientColorEnd)
        .border(color: Vx.white)
        .roundedSM
        .make();
  }

  Row buildAvailableVoucher() {
    return Row(
      children: [
        SizedBox(
          width: 5,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          "1".text.fontFamily('poppins').bold.white.size(18).make(),
          10.heightBox,
          "ACTIVE".text.fontFamily('poppins').gray200.bold.make()
        ]).expand(),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          "6".text.fontFamily('poppins').bold.white.size(18).make(),
          10.heightBox,
          "TOTAL VOUCHERS WON".text.fontFamily('poppins').gray200.bold.make()
        ]).expand(),
      ],
    );
  }
}
