import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:styleclub/app/modules/cart_page/controllers/cart_page_controller.dart';
import 'package:styleclub/app/modules/grooming_page/controllers/grooming_page_controller.dart';
import 'package:styleclub/app/modules/main_page/controllers/main_page_controller.dart';
import 'package:styleclub/app/routes/app_pages.dart';
import 'package:styleclub/app/services/variables.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:ui' as ui;

import '../../../core/resources/app_resources.dart';
import '../../../core/widgets/app_widgets.dart';
import '../../../services/queryQuery.dart';
import '../controllers/home_page_controller.dart';
//import 'package:skeletons/skeletons.dart';
import 'package:shimmer/shimmer.dart';
// Drawer drawer() {
//   return Drawer(
//       backgroundColor: const Color.fromARGB(
//         255,
//         52,
//         65,
//         83,
//       ),
//       child: ListView(
//         children: [
//           Column(
//             children: [
//               SizedBox(height: 20),

//               // Center(
//               //   child: CircleAvatar(
//               //     radius: 30,
//               //     backgroundImage: AssetImage('assets/img.jpg'),
//               //   ),
//               // ),
//               Padding(
//                 padding: EdgeInsets.only(right: 200),
//                 child: SizedBox(
//                         child: Image.network('https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/entypo_cross.png'))
//                     .onTap(() {
//                   Navigator. pop(context)
//                 }),
//               ),
//               // Center(),
//             ],
//           ),

//           Container(child: Image.network('https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/Frame 72.png')).onTap(() {
//             Get.toNamed(Routes.CREATE_DIGITAL_IDENTITY);
//           }),

//           SizedBox(child: Image.network('https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/Frame 146.png')),
//           Padding(
//             padding: EdgeInsets.only(bottom: 40, right: 100),
//             child: SizedBox(child: Image.network('https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/Frame 143.png')),
//           ),

//           //     const Divider(
//           //         thickness: .06, color: Color.fromARGB(255, 30, 29, 29)),
//           //     ListTile(
//           //       iconColor: Colors.white,
//           //       leading: const Icon(Icons.person),
//           //       title: const Text('My Profile',
//           //           style: TextStyle(color: Colors.white)),
//           //       onTap: () {
//           //         // Add Navigation logic here
//           //       },
//           //     ),
//           //     ListTile(
//           //       iconColor: Colors.white,
//           //       leading: const Icon(Icons.book),
//           //       title: const Text('My Course',
//           //           style: TextStyle(color: Colors.white)),
//           //       onTap: () {
//           //         // Add Navigation logic here
//           //       },
//           //     ),
//           //     ListTile(
//           //       iconColor: Colors.white,
//           //       leading: const Icon(Icons.subscriptions),
//           //       title: const Text('Go Premium',
//           //           style: TextStyle(color: Colors.white)),
//           //       onTap: () {
//           //         // Add Navigation logic here
//           //       },
//           //     ),
//         ],
//       ));
// }
HomePageController2 controller2 = Get.put(HomePageController2());
HomePageController3 controller3 = Get.put(HomePageController3());

class HomePageView extends GetView<HomePageController> {
  CartPageController cartPageController = Get.put(CartPageController());
  ApiClients query = ApiClients();

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  refresh() {
    controller.refresh1();
    controller1.refresh();
    controller2.refresh();
    controller3.refresh();
    //  await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: Drawer(
          backgroundColor: const Color.fromARGB(
            255,
            52,
            65,
            83,
          ),
          child: ListView(
            children: [
              Column(
                children: [
                  SizedBox(height: 20),

                  // Center(
                  //   child: CircleAvatar(
                  //     radius: 30,
                  //     backgroundImage: AssetImage('assets/img.jpg'),
                  //   ),
                  // ),
                  Padding(
                    padding: EdgeInsets.only(right: 200),
                    child: SizedBox(
                            child: Image.network(
                                'https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/entypo_cross.png'))
                        .onTap(() {
                      Scaffold.of(context).closeDrawer();
                    }),
                  ),
                  // Center(),
                ],
              ),

              Container(
                      child: Image.network(
                          'https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/Frame 72.png'))
                  .onTap(() {
                query.user!.user.digitalProfile == null
                    ? Get.toNamed(Routes.CREATE_DIGITAL_IDENTITY)
                    : Get.toNamed(Routes.SEE_PROFILE);
              }),
              Container(
                  child: Row(
                children: [
                  // CircleAvatar(
                  //   backgroundImage: NetworkImage(variables.profilepic),
                  //   radius: MediaQuery.of(context).size.height * 0.02,
                  // )
                ],
              )).onTap(() {
                Get.toNamed(Routes.CREATE_DIGITAL_IDENTITY);
              }),

              SizedBox(
                  child: Image.network(
                      'https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/Frame 146.png')),
              Padding(
                padding: EdgeInsets.only(bottom: 40, right: 100),
                child: SizedBox(
                    child: Image.network(
                        'https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/Frame 143.png')),
              ),

              //     const Divider(
              //         thickness: .06, color: Color.fromARGB(255, 30, 29, 29)),
              //     ListTile(
              //       iconColor: Colors.white,
              //       leading: const Icon(Icons.person),
              //       title: const Text('My Profile',
              //           style: TextStyle(color: Colors.white)),
              //       onTap: () {
              //         // Add Navigation logic here
              //       },
              //     ),
              //     ListTile(
              //       iconColor: Colors.white,
              //       leading: const Icon(Icons.book),
              //       title: const Text('My Course',
              //           style: TextStyle(color: Colors.white)),
              //       onTap: () {
              //         // Add Navigation logic here
              //       },
              //     ),
              //     ListTile(
              //       iconColor: Colors.white,
              //       leading: const Icon(Icons.subscriptions),
              //       title: const Text('Go Premium',
              //           style: TextStyle(color: Colors.white)),
              //       onTap: () {
              //         // Add Navigation logic here
              //       },
              //     ),
            ],
          )),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: false,
        header: WaterDropHeader(),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus? mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = Text("pull up load");
            } else if (mode == LoadStatus.loading) {
              body = CupertinoActivityIndicator();
            } else if (mode == LoadStatus.failed) {
              body = Text("Load Failed!Click retry!");
            } else if (mode == LoadStatus.canLoading) {
              body = Text("release to load more");
            } else {
              body = Text("No more Data");
            }
            return Container(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        controller: _refreshController,
        onRefresh: refresh,
        //onLoading: _onLoading,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10, left: 10),
                child: Row(
                  children: [
                    // SizedBox(
                    //   width:35,
                    //   height:35,

                    // ),

                    // 10.widthBox,
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     "Hello sushil!".text.fontFamily('poppins').white.size(14).make(),
                    //     5.heightBox,
                    //     "premium".text.color(goldenColorEnd).make(),

                    //   ],
                    // )
                    // SizedBox(width:180),
                    Image.network(
                            'https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/home.png')
                        .onInkTap(() {
                      Scaffold.of(context).openDrawer();
                      // Get.toNamed(Routes.CREATE_DIGITAL_IDENTITY);
                    }),
                    230.widthBox,

                    Image.network(
                            'https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/search_1.png')
                        .onInkTap(() {
                      Get.dialog(const Dialog(
                        alignment: Alignment.topLeft,
                        backgroundColor: Colors.transparent,
                        child: VxTextField(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Vx.white,
                          ),
                          hint: "Blue Shirt and Bla",
                          borderRadius: 10,
                          borderType: VxTextFieldBorderType.roundLine,
                          fillColor: themeGradientColorEnd,
                          borderColor: Vx.white,
                        ),
                      ));
                    }),
                    20.widthBox,
                    Container(
                            child: Image.network(
                                'https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/noti.png'))
                        .onTap(() {
                      Get.toNamed(Routes.NOTI);
                    }),
                    20.widthBox,
                    Container(
                            child: Image.network(
                                'https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/cart.png'))
                        .onTap(() async {
                      await cartPageController.cart();
                      Get.toNamed(Routes.CART_PAGE);
                    }),
                  ],
                ).onInkTap(() {
                  // Get.toNamed(Routes.CREATE_DIGITAL_IDENTITY);
                }),
              ),
              20.heightBox,
              buildTitle("SELECT A CATEGORY"),
              buildCategories(),
              20.heightBox,
              buildTitle("LATEST AT STYLE CLUB"),
              controller.obx(
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
                              data[index]['images'].length == 0
                                  ? Image.network(
                                      "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/grouphoto.png")
                                  : Container(
                                      height: 140,
                                      width: 200,
                                      child: Image.network(
                                          data[index]['images'][0],
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
              ),
              20.heightBox,
              buildTitle("TOP DEALS AND PACKAGES"),

              controller2.obx(
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
                                  "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/deals.png"),
                              10.heightBox,
                              "{data![index][title]}"
                                  .text
                                  .fontFamily('ave')
                                  .size(10)
                                  .fontFamily('dmsans')
                                  .fontWeight(FontWeight.w800)
                                  .bold
                                  .ellipsis
                                  .make(),
                              5.heightBox,
                              "{data![index][name]}"
                                  .text
                                  .fontFamily('ave')
                                  .size(10)
                                  .fontFamily('dmsans')
                                  .fontWeight(FontWeight.w800)
                                  .bold
                                  .gray400
                                  .ellipsis
                                  .make(),
                              5.heightBox,
                              "{data![index]note}"
                                  .text
                                  .ellipsis
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
                              .make()
                              .h(260)
                              .w(150);
                          ;
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
                            data![index]["imageAndVideos"].length == 0
                                ? Image.network(
                                    "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/deals.png")
                                : Image.network(
                                    data![index]["imageAndVideos"][0]["url"],
                                    height: 140,
                                    width: 146,
                                    fit: BoxFit.fitHeight),
                            10.heightBox,
                            "${data![index]["title"]}"
                                .text
                                .fontFamily('ave')
                                .size(10)
                                .fontFamily('dmsans')
                                .fontWeight(FontWeight.w800)
                                .bold
                                .ellipsis
                                .make(),
                            5.heightBox,
                            "${data![index]["name"]}"
                                .text
                                .fontFamily('ave')
                                .size(10)
                                .fontFamily('dmsans')
                                .fontWeight(FontWeight.w800)
                                .bold
                                .gray400
                                .ellipsis
                                .make(),
                            5.heightBox,
                            "${data![index]["note"]}"
                                .text
                                .ellipsis
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
                            .make()
                            .h(260)
                            .w(150);
                        ;
                      }),
                ),
              ),
              20.heightBox,
              buildTitle("TOP TRENDING HAIRCUTS"),
              // buildHorizontalListView(Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //
              //     10.heightBox,
              //     "Tapered Fade"
              //         .text
              //         .fontFamily('ave')
              //         .size(10)
              //         .fontFamily('dmsans')
              //         .fontWeight(FontWeight.w800)
              //         .bold
              //         .make(),
              //     5.heightBox,
              //     "5.23 people clicked"
              //         .text
              //         .fontFamily('ave')
              //         .size(10)
              //         .fontFamily('dmsans')
              //         .fontWeight(FontWeight.w800)
              //         .bold
              //         .gray400
              //         .make(),
              //   ],
              // )
              //         .paddingAll(5)
              //         .box
              //         .white
              //         .roundedSM
              //         .margin(const EdgeInsets.all(5))
              //         .make())
              //     .h(210),
              controller3.obx(
                onLoading: Shimmer.fromColors(
                  baseColor: const Color.fromARGB(
                    255,
                    52,
                    65,
                    83,
                  ),
                  highlightColor: Colors.grey[100] as Color,
                  child: Container(
                    height: 210,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        shrinkWrap: true,
                        itemBuilder: (ctx, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // data![index]["banner"][0]["url"] == null
                              Image.network(
                                  "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/haircuts.png"),
                              // : Image.network(data![index]["banner"][0]["url"],
                              //     height: 137,
                              //     width: 138,
                              //     fit: BoxFit.fitHeight),
                              10.heightBox,
                              "{data![index][name]}"
                                  .text
                                  .ellipsis
                                  .fontFamily('ave')
                                  .size(10)
                                  .fontFamily('dmsans')
                                  .fontWeight(FontWeight.w800)
                                  .bold
                                  .make(),
                              5.heightBox,
                              '{data![index]["banner"][0]["note"]}'
                                  .text
                                  .ellipsis
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
                        }),
                  ),
                ),
                (data) => Container(
                  height: 210,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: data!.length,
                      shrinkWrap: true,
                      itemBuilder: (ctx, index) {
                        List<Object?> list = data[index]["banner"];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            list.isEmpty
                                ? Image.network(
                                    "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/haircuts.png")
                                : Image.network(
                                    data[index]["banner"][0]["url"],
                                    height: 137,
                                    width: 138,
                                    fit: BoxFit.fitHeight),
                            10.heightBox,
                            "${data[index]["name"]}"
                                .text
                                .ellipsis
                                .fontFamily('ave')
                                .size(10)
                                .fontFamily('dmsans')
                                .fontWeight(FontWeight.w800)
                                .bold
                                .make(),
                            5.heightBox,
                            list.isEmpty
                                ? "null"
                                    .text
                                    .ellipsis
                                    .fontFamily('ave')
                                    .size(10)
                                    .fontFamily('dmsans')
                                    .fontWeight(FontWeight.w800)
                                    .bold
                                    .gray400
                                    .make()
                                : '${data![index]["banner"][0]["note"]}'
                                    .text
                                    .ellipsis
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
                      }),
                ),
              ),
              20.heightBox,
              buildTitle("HAIRSTYLE BLOGS"),
              20.heightBox,
              buildStackInfo(
                  "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/blogs.png",
                  "TOP 10 HAIRCUTS OF JULY'22")
            ],
          ).marginAll(10).box.withDecoration(scaffoldGradient).make(),
        ),
      ),
    )
        .safeArea()
        .box
        .width(double.infinity)
        .height(double.infinity)
        .withDecoration(scaffoldGradient)
        .make();
  }

  Widget buildCategories() {
    GroomingPageController groomingPageController =
        Get.put(GroomingPageController());
    return ListView(scrollDirection: Axis.horizontal, children: [
      Column(
        children: [
          Image.network(
              "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/grooming.png"),
          10.heightBox,
          "GROOMING"
              .text
              .size(11)
              .fontFamily('dmsans')
              .fontWeight(FontWeight.w700)
              .bold
              .white
              .make()
        ],
      ).marginAll(10).onInkTap(() async {
        await groomingPageController.getallpost(1);
        await groomingPageController.tophaircuts();
        Get.toNamed(Routes.GROOMING_PAGE);
      }),
      Column(
        children: [
          Image.network(
              "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/profilepic.png"),
          10.heightBox,
          "STYLING"
              .text
              .size(11)
              .fontFamily('dmsans')
              .fontWeight(FontWeight.w700)
              .bold
              .white
              .make()
        ],
      ).marginAll(10).onInkTap(() {
        Get.toNamed(Routes.STYLING_PAGE);
      }),
      Column(
        children: [
          Image.network(
              "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/shop.png"),
          10.heightBox,
          "SHOP"
              .text
              .size(11)
              .fontFamily('dmsans')
              .fontWeight(FontWeight.w700)
              .bold
              .white
              .make()
        ],
      ).marginAll(10).onInkTap(() {
        Get.toNamed(Routes.SHOP_PAGE);
      }),
      Column(
        children: [
          Image.network(
              "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/priviliege.png"),
          10.heightBox,
          "PRIVILEGE"
              .text
              .size(11)
              .fontFamily('dmsans')
              .fontWeight(FontWeight.w700)
              .bold
              .white
              .make()
        ],
      ).marginAll(10).onInkTap(() {
        Get.toNamed(Routes.PRIVILEGE_PAGE);
      })
    ]).h(120);
  }

  Widget buildTitle(String title) => title.text.bold
      .size(12)
      .fontFamily('ave_black')
      .fontWeight(FontWeight.w800)
      .color(goldenColorEnd)
      .make()
      .paddingOnly(left: 8);
}
