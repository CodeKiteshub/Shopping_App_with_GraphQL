import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:styleclub/app/core/resources/app_resources.dart';
import 'package:styleclub/app/core/widgets/app_widgets.dart';
import 'package:styleclub/app/services/queryQuery.dart';
import 'package:styleclub/app/services/variables.dart';

import 'package:velocity_x/velocity_x.dart';

import '../../../services/razorpaycontroller.dart';
import '../controllers/cart_page_controller.dart';

class CartPageView extends GetView<CartPageController> {
  CartPageView({Key? key}) : super(key: key);
  RazorpayController razorPayController = Get.put(RazorpayController());
  ApiClients query = ApiClients();
  RxBool isTapped = false.obs;
  TextEditingController coupontext = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const ButtonPrimary(title: "Continue to Payment")
          .marginAll(15)
          .box
          .color(themeGradientColorStart)
          .make()
          .onInkTap(() async {
        razorPayController.doPayment(
            controller.cartdata!.getProductCartByUserId.totalPrice,
            variables.name,
            variables.phone,
            variables.userid);
      }),
      body: Obx(() {
        return controller.isLoading.value == true
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.arrow_back, color: Vx.white).onTap(() {
                          Get.back();
                        }),
                        10.widthBox,
                        buildMainTitle("CART", 18)
                      ],
                    ).marginAll(10),
                    10.heightBox,
                    buildCartItems(),
                    //  Image.network('https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/Line3.png'),
                    //   SizedBox(height: 150),
                    Row(
                      children: [
                        "Sub Total".text.white.make().expand(),
                        buildMainTitle(
                            "₹${controller.cartdata!.getProductCartByUserId.totalPrice}",
                            22)
                      ],
                    ).marginOnly(left: 10, right: 10),
                    20.heightBox,
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            isTapped.value =
                                isTapped.value == false ? true : false;
                          },
                          child: Row(
                            children: [
                              "APPLY COUPON"
                                  .text
                                  .color(goldenColorStart)
                                  .make()
                                  .expand(),
                              const Icon(
                                Icons.arrow_forward,
                                color: goldenColorStart,
                              )
                            ],
                          ),
                        ),
                        Obx(() {
                          return isTapped.value == false
                              ? Container()
                              : Row(
                                  children: [
                                    Expanded(
                                        child: TextField(
                                          controller: coupontext,
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    InkWell(
                                      onTap: () async {
                                        await controller.validatecoupon(coupontext.text);
                                      },
                                      child: Text(
                                        "Apply",
                                        style:
                                            TextStyle(color: goldenColorStart),
                                      ),
                                    )
                                  ],
                                );
                        }),
                      ],
                    )
                        .p(20)
                        .box
                        .color(themeGradientColorEnd)
                        .border(color: Vx.white)
                        .roundedSM
                        .margin(const EdgeInsets.all(10))
                        .make(),

                    Column(
                      children: [
                        Row(
                          children: [
                            "Order Summary"
                                .text
                                .color(goldenColorStart)
                                .make()
                                .expand(),
                          ],
                        ),
                        20.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "ITEM TOTAL",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "dmsans",
                                  fontSize: 12),
                            ),
                            Text(
                              "₹${controller.cartdata!.getProductCartByUserId.totalPrice - ((controller.cartdata!.getProductCartByUserId.totalPrice * 12) / 100)}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "dmsans",
                                  fontSize: 13),
                            )
                          ],
                        ),
                        10.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "ITEM DISCOUNT",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "dmsans",
                                  fontSize: 12),
                            ),
                            Text(
                              "₹${controller.cartdata!.getProductCartByUserId.totalDiscount}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "dmsans",
                                  fontSize: 13),
                            )
                          ],
                        ),
                        10.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "GST",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "dmsans",
                                  fontSize: 12),
                            ),
                            Text(
                              '₹' +
                                  ((controller.cartdata!.getProductCartByUserId
                                                  .totalPrice *
                                              12) /
                                          100)
                                      .toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "dmsans",
                                  fontSize: 13),
                            )
                          ],
                        ),
                        20.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "TOTAL",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "dmsans",
                                  fontSize: 20),
                            ),
                            Text(
                              "₹${controller.cartdata!.getProductCartByUserId.totalDiscountedPrice}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "dmsans",
                                  fontSize: 20),
                            )
                          ],
                        )
                      ],
                    )
                        .p(20)
                        .box
                        .color(themeGradientColorEnd)
                        .border(color: Vx.white)
                        .roundedSM
                        .margin(const EdgeInsets.all(10))
                        .make(),
                  ],
                ),
              );
      })
          .safeArea()
          .box
          .withDecoration(scaffoldGradient)
          .width(double.infinity)
          .height(double.infinity)
          .make(),
    );
  }

  Widget buildCartItems() {
    return ListView.separated(
        itemCount: controller.cartdata!.getProductCartByUserId.items.length,
        shrinkWrap: true,
        separatorBuilder: (ctx, index) {
          return Image.network(
              'https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/Line3.png');
        },
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (ctx, index) {
          print(controller.cartdata!.getProductCartByUserId.items..length);
          return Row(
            children: [
              Image.network(
                controller
                    .cartdata!.getProductCartByUserId.items[index].images[0],
                height: 100,
                width: 100,
              ),
              10.widthBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "${controller.cartdata!.getProductCartByUserId.items[index].name}"
                      .text
                      .white
                      .size(18)
                      .bold
                      .make(),
                  5.heightBox,
                  "Color: Red | Size: ${controller.cartdata!.getProductCartByUserId.items[index].size}"
                      .text
                      .gray200
                      .make(),
                  10.heightBox,
                  Row(
                    children: [
                      "₹${controller.cartdata!.getProductCartByUserId.items[index].price}"
                          .text
                          .white
                          .size(15)
                          .make()
                          .expand(),
                      Row(
                        children: [
                          "-"
                              .text
                              .size(24)
                              .color(goldenColorStart)
                              .make()
                              .onInkTap(() async {
                            var value = controller.cartdata!
                                    .getProductCartByUserId.items[index].qty -
                                1;
                            await controller.cartupdate(
                                controller.cartdata!.getProductCartByUserId.id,
                                controller.cartdata!.getProductCartByUserId
                                    .items[index].itemId,
                                value);
                            await controller.cart();
                          }),
                          "${controller.cartdata!.getProductCartByUserId.items[index].qty}"
                              .text
                              .white
                              .make()
                              .marginOnly(left: 20, right: 20),
                          "+"
                              .text
                              .size(22)
                              .color(goldenColorEnd)
                              .make()
                              .onInkTap(() async {
                            var value = controller.cartdata!
                                    .getProductCartByUserId.items[index].qty +
                                1;
                            await controller.cartupdate(
                                controller.cartdata!.getProductCartByUserId.id,
                                controller.cartdata!.getProductCartByUserId
                                    .items[index].itemId,
                                value);
                            await controller.cart();
                          })
                        ],
                      )
                          .pOnly(left: 10, right: 10)
                          .box
                          .roundedSM
                          .color(themeGradientColorEnd)
                          .make()
                    ],
                  )
                ],
              ).expand()
            ],
          ).marginAll(10);
        });
  }
}
