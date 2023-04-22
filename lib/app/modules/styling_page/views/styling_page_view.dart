import 'dart:ui';
import 'dart:developer' as dev;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:styleclub/app/modules/shop_page/controllers/shop_page_controller.dart'
    as shop;
import 'package:styleclub/app/routes/app_pages.dart';
import 'package:styleclub/gen/assets.gen.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/resources/app_resources.dart';
import '../../../core/widgets/app_widgets.dart';
import '../controllers/styling_page_controller.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StylingPageView extends GetView<StylingPageController> {
  StylingPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildAppBar(),
          10.heightBox,
          SizedBox(
            height: 60,
            child: TabBar(
              tabs: const [
                Text(
                  'STYLEHUB',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'dmsans',
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  'LOOKS',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'dmsans',
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  'PERSONALIZE',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'dmsans',
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  'SHOP',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'dmsans',
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  'BRANDS',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'dmsans',
                      fontWeight: FontWeight.w700),
                )
              ],
              unselectedLabelColor: Vx.gray200,
              indicatorColor: Vx.white,
              labelColor: Vx.white,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 3.0,
              indicatorPadding: const EdgeInsets.all(10),
              isScrollable: true,
              controller: controller.tabController,
            ),
          ),
          TabBarView(controller: controller.tabController, children: [
            BuildStylehubTab(),
            BuildLooksTab(),
            BuildPersonalizeTab(),
            BuildFashionTab(),
            BuildBrandsTab(),
          ]).expand(),
        ],
      )
          .marginAll(10)
          .safeArea()
          .box
          .withDecoration(scaffoldGradient)
          .height(double.infinity)
          .width(double.infinity)
          .make(),
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
        buildMainTitle("STYLING", 22).expand(),
        Row(
          children: [
            const Icon(
              Icons.search,
              color: Vx.gray200,
            ),
            5.widthBox,
            "Search".text.size(18).gray200.make()
          ],
        ).onInkTap(() {
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
        })
      ],
    );
  }
}

class BuildBrandsTab extends StatefulWidget {
  BuildBrandsTab({Key? key}) : super(key: key);

  @override
  State<BuildBrandsTab> createState() => _BuildBrandsTabState();
}

class _BuildBrandsTabState extends State<BuildBrandsTab> {
  LooksProducts looks = Get.put(LooksProducts());
  StylePratners2 controller3 = Get.put(StylePratners2());

  StylePratners controller2 = Get.put(StylePratners());
  final scrollController = ScrollController();
  final scrollController2 = ScrollController();
  int pageno = 1;
  int page2no = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    scrollController2.addListener(() {
      _scrollListener();
    });
    scrollController.addListener(() {
      _scrollListener();
    });
  }

  Future<void> _scrollListener() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      pageno = pageno + 1;
      await controller2.refresh1(pageno);

      dev.log("Called");
      dev.log(pageno.toString());
    } else {
      dev.log("Not");
    }
    if (scrollController2.position.pixels ==
        scrollController2.position.maxScrollExtent) {
      pageno = page2no + 1;
      await controller3.refresh1(pageno);

      dev.log("Called");
      dev.log(page2no.toString());
    } else {
      dev.log("Not");
    }

    // print("...........");
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTitle("CHECK OUT CLOTHING"),
          controller2.obx(
            onLoading: Shimmer.fromColors(
              baseColor: const Color.fromARGB(
                255,
                52,
                65,
                83,
              ),
              highlightColor: Colors.grey[100] as Color,
              child: SingleChildScrollView(
                child: Container(
                  height: 1000,
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 4,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    itemCount: 4,
                    itemBuilder: ((context, index) => Column(
                          children: [
                            Stack(
                              children: [
                                Image.network(
                                    "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/shirt.png"),
                                SvgPicture.network(
                                        "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/circles.svg")
                                    .positioned(right: 10, bottom: 10)
                              ],
                            ),
                            10.heightBox,
                            "data[index][name]"
                                .toString()
                                .text
                                .size(10)
                                .fontFamily('dmsans')
                                .fontWeight(FontWeight.w800)
                                .bold
                                .make()
                          ],
                        ).p(10).box.white.roundedSM.make()),
                    staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
                  ),
                ),
              ),
            ),
            (data) => Container(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: StaggeredGridView.countBuilder(
                  crossAxisCount: 4,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  shrinkWrap: true,
                  controller: scrollController,
                  itemCount: data!.length,
                  itemBuilder: ((context, index) {
                    List images = data[index]["imageAndVideos"];

                    return Column(
                      children: [
                        Stack(
                          children: [
                            images.isEmpty
                                ? Image.network(
                                    "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/deals.png")
                                : Image.network(
                                    data[index]["imageAndVideos"][0]["url"],
                                    width: double.infinity,
                                    height: 140,
                                    fit: BoxFit.cover,
                                  ),
                            // SvgPicture.network("https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/"Assets.images.circles)
                            //     .positioned(right: 10, bottom: 10)
                          ],
                        ),
                        10.heightBox,
                        data[index]["title"]
                            .toString()
                            .text
                            .size(10)
                            .fontFamily('dmsans')
                            .fontWeight(FontWeight.w800)
                            .bold
                            .make()
                      ],
                    ).p(10).box.white.roundedSM.make();
                  }),
                  staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
                ),
              ),
            ),
          ),
          buildTitle("ACCESSORISE YOURSELF"),
          controller3.obx(
            onLoading: Shimmer.fromColors(
              baseColor: const Color.fromARGB(
                255,
                52,
                65,
                83,
              ),
              highlightColor: Colors.grey[100] as Color,
              child: SingleChildScrollView(
                child: Container(
                  height: 400,
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 4,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    itemCount: 4,
                    itemBuilder: ((context, index) => Column(
                          children: [
                            Stack(
                              children: [
                                Image.network(
                                    "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/shirt.png"),
                                SvgPicture.network(
                                        "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/circles.svg")
                                    .positioned(right: 10, bottom: 10)
                              ],
                            ),
                            10.heightBox,
                            "data[index][name]"
                                .toString()
                                .text
                                .size(10)
                                .fontFamily('dmsans')
                                .fontWeight(FontWeight.w800)
                                .bold
                                .make()
                          ],
                        ).p(10).box.white.roundedSM.make()),
                    staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
                  ),
                ),
              ),
            ),
            (data) => Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 400,
                child: StaggeredGridView.countBuilder(
                  physics: AlwaysScrollableScrollPhysics(),
                  controller: scrollController2,
                  crossAxisCount: 4,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  itemCount: data!.length,
                  itemBuilder: ((context, index) {
                    List images = data![index]["imageAndVideos"];

                    return Column(
                      children: [
                        Stack(
                          children: [
                            images.isEmpty
                                ? Image.network(
                                    "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/deals.png")
                                : Image.network(
                                    data![index]["imageAndVideos"][0]["url"],
                                    width: double.infinity,
                                    height: 140,
                                    fit: BoxFit.cover,
                                  ),
                            // SvgPicture.network("https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/"Assets.images.circles)
                            //     .positioned(right: 10, bottom: 10)
                          ],
                        ),
                        10.heightBox,
                        data![index]["title"]
                            .toString()
                            .text
                            .size(10)
                            .fontFamily('dmsans')
                            .fontWeight(FontWeight.w800)
                            .bold
                            .make()
                      ],
                    ).p(10).box.white.roundedSM.make();
                  }),
                  staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTitle(String title) => title.text.bold
      .size(12)
      .fontFamily('ave_black')
      .fontWeight(FontWeight.w800)
      .color(goldenColorEnd)
      .make()
      .paddingOnly(left: 10, top: 5, bottom: 5);
}

class BuildLooksTab extends StatefulWidget {
  BuildLooksTab({Key? key}) : super(key: key);

  @override
  State<BuildLooksTab> createState() => _BuildLooksTabState();
}

class _BuildLooksTabState extends State<BuildLooksTab> {
  LooksProducts looks = Get.put(LooksProducts());

  StylingPageController stylingPageController = Get.find();
  int pageno = 1;
  bool isLoading = false;
  final scrollController = ScrollController();
  int tabindex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (tabindex == 0 && pageno == 1) {
      apidata();
    }
    scrollController.addListener(() {
      _scrollListener();
    });
  }

  apidata() async {
    setState(() {
      isLoading = true;
    });
    await stylingPageController.getlooksfilter(
        stylingPageController.lookconfigdata!.getLookConfig.topFilters
            .looksTypeFilters[tabindex].id,
        pageno);
    setState(() {
      isLoading = false;
    });
  }

  Future<void> _scrollListener() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      pageno = pageno + 1;

      await stylingPageController.getlooksfilter(
          stylingPageController.lookconfigdata!.getLookConfig.topFilters
              .looksTypeFilters[tabindex].id,
          pageno);
      dev.log("Called");
      dev.log(pageno.toString());
    } else {
      dev.log("Not");
    }
    // print("...........");
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        children: [
          SizedBox(
            height: 100,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: stylingPageController.lookconfigdata!.getLookConfig
                    .topFilters.looksTypeFilters.length,
                itemBuilder: ((context, index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () async {
                          setState(() {
                            tabindex = index;
                            isLoading = true;
                          });
                          await stylingPageController.getlooksfilter(
                              stylingPageController
                                  .lookconfigdata!
                                  .getLookConfig
                                  .topFilters
                                  .looksTypeFilters[tabindex]
                                  .id,
                              1);
                          setState(() {
                            isLoading = false;
                          });
                        },
                        child: CircleAvatar(
                          radius: 45,
                          backgroundColor: tabindex == index
                              ? themeGradientColorEnd
                              : themeGradientColorStart,
                          child: Text(
                            stylingPageController.lookconfigdata!.getLookConfig
                                .topFilters.looksTypeFilters[index].name,
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                      )
                    ],
                  );
                })),
          ),
          10.heightBox,
          Obx(() {
            return isLoading
                ? Center(child: CircularProgressIndicator())
                : StaggeredGridView.countBuilder(
                    crossAxisCount: 4,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: stylingPageController.looklength.value,
                    itemBuilder: ((context, index) {
                      final looks = stylingPageController
                          .looksfilterdata.value.looksFilter!.looks[index];
                      return Column(
                        children: [
                          Stack(
                            children: [
                              Image.network(
                                looks.images.first,
                                width: double.infinity,
                                height: 140,
                                fit: BoxFit.cover,
                              ),
                              SvgPicture.network(
                                      "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/circles.svg")
                                  .positioned(right: 10, bottom: 10)
                            ],
                          ),
                          10.heightBox,
                          looks.title
                              .toString()
                              .text
                              .size(10)
                              .fontFamily('dmsans')
                              .fontWeight(FontWeight.w800)
                              .bold
                              .make()
                        ],
                      ).p(10).box.white.roundedSM.make();
                    }),
                    staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
                  );
          }),
        ],
      ),
    );
  }
}

class BuildStylehubTab extends StatefulWidget {
  BuildStylehubTab({Key? key}) : super(key: key);

  @override
  State<BuildStylehubTab> createState() => _BuildStylehubTabState();
}

class _BuildStylehubTabState extends State<BuildStylehubTab> {
  LooksProducts looks = Get.put(LooksProducts());
  StyleProducts controller3 = Get.put(StyleProducts());
  StylePratners2 controller2 = Get.put(StylePratners2());
  StyleOccassion occassion = Get.put(StyleOccassion());
  shop.CategoryProducts occassionconfig = Get.put(shop.CategoryProducts());
  StylingPageController stylingPageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 8,
            ),
            buildTitle('EXPLORE LOOKS'),
            SizedBox(
              height: 400,
              child: Obx(() {
                return StaggeredGridView.countBuilder(
                  crossAxisCount: 4,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: stylingPageController.looklength.value,
                  itemBuilder: ((context, index) {
                    final looks = stylingPageController
                        .looksfilterdata.value.looksFilter!.looks[index];
                    return Column(
                      children: [
                        Stack(
                          children: [
                            Image.network(
                              looks.images.first,
                              width: double.infinity,
                              height: 140,
                              fit: BoxFit.cover,
                            ),
                            SvgPicture.network(
                                    "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/circles.svg")
                                .positioned(right: 10, bottom: 10)
                          ],
                        ),
                        10.heightBox,
                        looks.title
                            .toString()
                            .text
                            .size(10)
                            .fontFamily('dmsans')
                            .fontWeight(FontWeight.w800)
                            .bold
                            .make()
                      ],
                    ).p(10).box.white.roundedSM.make();
                  }),
                  staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                      'https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/viewmore.png')
                  .centered(),
            ),
            buildTitle('EXPLORE STYLES'),
            occassion.obx(
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
                        itemCount: 4,
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
                              "{data![index][label]}"
                                  .text
                                  .ellipsis
                                  .fontFamily('ave')
                                  .size(10)
                                  .fontFamily('dmsans')
                                  .fontWeight(FontWeight.w800)
                                  .bold
                                  .make(),
                              5.heightBox,
                              '{data![index]["personalizeNote"]}'
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
                ), (data) {
              int n = (data as List).indexWhere((e) => e["name"] == "products");
              final post = data[n]["categories"] as List;
              return Container(
                height: 210,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: post.length,
                    shrinkWrap: true,
                    itemBuilder: (ctx, index) {
                      return post[index]["isEnabledForPersonalize"] == null ||
                              post[index]["isEnabledForPersonalize"] == false
                          ? Container()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                post[index]["personalizeImage"] == null
                                    ? Image.network(
                                        "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/haircuts.png")
                                    : Image.network(
                                        post[index]["personalizeImage"],
                                        height: 137,
                                        width: 138,
                                        fit: BoxFit.fitHeight),
                                10.heightBox,
                                "${post[index]["label"]}"
                                    .text
                                    .ellipsis
                                    .fontFamily('ave')
                                    .size(10)
                                    .fontFamily('dmsans')
                                    .fontWeight(FontWeight.w800)
                                    .bold
                                    .make(),
                                5.heightBox,
                                '${post[index]["personalizeNote"]}'
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
                              .h(210)
                              .w(150);
                    }),
              );
            }),
            buildTitle('SHOPPING'),
            occassion.obx(
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
                ), (data) {
              List post = [];
              int m =
                  (data as List).indexWhere((e) => e["name"] == "accessories");

              final post1 = data[m]["categories"] as List;
              int n = (data as List).indexWhere((e) => e["name"] == "products");
              final post2 = data[n]["categories"] as List;

              int i = 0;
              while (i < post1.length || i < post2.length) {
                if (i < post1.length) {
                  post.add(post1[i]);
                }
                if (i < post2.length) {
                  post.add(post2[i]);
                }
                i++;
              }

              return Container(
                height: 210,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: post.length,
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    return post[index]["isEnabledForPersonalize"] == null ||
                            post[index]["isEnabledForPersonalize"] == false
                        ? Container()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              post[index]["personalizeImage"] == null
                                  ? Image.network(
                                      "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/haircuts.png")
                                  : Image.network(
                                      post[index]["personalizeImage"],
                                      height: 137,
                                      width: 138,
                                      fit: BoxFit.fitHeight),
                              10.heightBox,
                              "${post[index]["label"]}"
                                  .text
                                  .ellipsis
                                  .fontFamily('ave')
                                  .size(10)
                                  .fontFamily('dmsans')
                                  .fontWeight(FontWeight.w800)
                                  .bold
                                  .make(),
                              5.heightBox,
                              '${post[index]["personalizeNote"]}'
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
                            .h(210)
                            .w(150);
                  },
                ),
              );
            }),
            buildTitle('BRANDS'),
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
          ],
        ),
      ),
    );
  }

  Widget buildTitle(String title) => title.text.bold
      .size(12)
      .fontFamily('ave_black')
      .fontWeight(FontWeight.w800)
      .color(goldenColorEnd)
      .make()
      .paddingOnly(left: 10, top: 5, bottom: 5);
}

class BuildPersonalizeTab extends StatelessWidget {
  BuildPersonalizeTab({Key? key}) : super(key: key);
  //LooksProducts looks = Get.put(LooksProducts());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      buildHorizontalListView(Column(
        children: [
          Image.network(
              "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/office.png"),
          10.heightBox,
          "Office"
              .text
              .size(12)
              .fontFamily('ave_black')
              .fontWeight(FontWeight.w800)
              .white
              .make()
        ],
      ).marginAll(10))
          .h(124),
      20.heightBox,
      SingleChildScrollView(
        child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: 5,
            shrinkWrap: true,
            itemBuilder: (ctx, index) {
              return ExpandableNotifier(
                child: Column(
                  children: [
                    ExpandablePanel(
                      collapsed: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Container(
                                color: Colors.white,
                                child: ExpandableButton(
                                  child: Row(
                                    children: [
                                      Image.network(
                                          'https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/Trousers$index.png'),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          "Trouser"
                                              .text
                                              .ellipsis
                                              .hexColor("#723D00")
                                              .fontFamily('ave')
                                              .size(10)
                                              .fontFamily('dmsans')
                                              .fontWeight(FontWeight.w800)
                                              .bold
                                              .make(),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Shirts are the easiest way for you to reflect your\n personal style. ",
                                            style: TextStyle(
                                              fontSize: 10,
                                            ),
                                            softWrap: true,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(height: 30),
                                          "View shirt Details"
                                              .text
                                              .underline
                                              .ellipsis
                                              .hexColor("#723D00")
                                              .fontFamily('ave')
                                              .size(10)
                                              .fontFamily('dmsans')
                                              .fontWeight(FontWeight.w800)
                                              .bold
                                              .make(),
                                        ],
                                      )
                                    ],
                                  ),
                                )),
                          ),
                          Container(
                            height: 20,
                          )
                        ],
                      ),
                      expanded: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Container(
                                color: Colors.white,
                                child: ExpandableButton(
                                  child: Row(
                                    children: [
                                      Image.network(
                                          'https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/Trousers$index.png'),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          "Trouser"
                                              .text
                                              .ellipsis
                                              .hexColor("#723D00")
                                              .fontFamily('ave')
                                              .size(10)
                                              .fontFamily('dmsans')
                                              .fontWeight(FontWeight.w800)
                                              .bold
                                              .make(),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Shirts are the easiest way for you to reflect your\n personal style. ",
                                            style: TextStyle(
                                              fontSize: 10,
                                            ),
                                            softWrap: true,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(height: 30),
                                          "Close shirt Details"
                                              .text
                                              .underline
                                              .ellipsis
                                              .hexColor("#723D00")
                                              .fontFamily('ave')
                                              .size(10)
                                              .fontFamily('dmsans')
                                              .fontWeight(FontWeight.w800)
                                              .bold
                                              .make(),
                                        ],
                                      )
                                    ],
                                  ),
                                )),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            color: Color(0xff273A4F),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(children: [
                                "RECOMMENDED FOR YOU"
                                    .text
                                    .hexColor("#E9DA96")
                                    .fontFamily('ave')
                                    .size(10)
                                    .letterSpacing(4)
                                    .fontWeight(FontWeight.w800)
                                    .bold
                                    .make(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    "1"
                                        .text
                                        .color(Colors.white.withOpacity(0.3))
                                        .fontFamily('ave')
                                        .size(32)
                                        .fontWeight(FontWeight.w800)
                                        .bold
                                        .make(),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: Column(
                                        children: [
                                          "FIT"
                                              .text
                                              .color(Colors.white)
                                              .fontFamily('ave')
                                              .size(20)
                                              .fontWeight(FontWeight.w800)
                                              .bold
                                              .make(),
                                          "We recommend you to wear slim fit shirts."
                                              .text
                                              .color(Colors.white)
                                              .fontFamily('ave')
                                              .size(12)
                                              .align(TextAlign.center)
                                              .fontWeight(FontWeight.w400)
                                              .makeCentered()
                                              .box
                                              .make()
                                              .h(50),
                                        ],
                                      ),
                                    ),
                                    Image.asset(
                                      "assets/shirt.png",
                                      scale: 4,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        "2"
                                            .text
                                            .color(
                                                Colors.white.withOpacity(0.3))
                                            .fontFamily('ave')
                                            .size(32)
                                            .fontWeight(FontWeight.w800)
                                            .bold
                                            .make(),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,
                                          child: Column(
                                            children: [
                                              "COLOURS"
                                                  .text
                                                  .color(Colors.white)
                                                  .fontFamily('ave')
                                                  .size(20)
                                                  .fontWeight(FontWeight.w800)
                                                  .bold
                                                  .make(),
                                              "We recommend you to wear slim fit shirts."
                                                  .text
                                                  .color(Colors.white)
                                                  .fontFamily('ave')
                                                  .size(12)
                                                  .align(TextAlign.center)
                                                  .fontWeight(FontWeight.w400)
                                                  .makeCentered()
                                                  .box
                                                  .make()
                                                  .h(50),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.3,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.15,
                                          color: Colors.yellow,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 100,
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: 8,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            return Row(
                                              children: [
                                                Container(
                                                  height: 80,
                                                  width: 80,
                                                  decoration: BoxDecoration(
                                                      color: Colors.amber,
                                                      border: Border.all(
                                                          color: Colors.white,
                                                          width: 2)),
                                                ),
                                                Container(
                                                  height: 80,
                                                  width: 80,
                                                  color: Colors.cyan,
                                                )
                                              ],
                                            );
                                          }),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        "3"
                                            .text
                                            .color(
                                                Colors.white.withOpacity(0.3))
                                            .fontFamily('ave')
                                            .size(32)
                                            .fontWeight(FontWeight.w800)
                                            .bold
                                            .make(),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,
                                          child: Column(
                                            children: [
                                              "PATTERNS"
                                                  .text
                                                  .color(Colors.white)
                                                  .fontFamily('ave')
                                                  .size(20)
                                                  .fontWeight(FontWeight.w800)
                                                  .bold
                                                  .make(),
                                              "We recommend you to wear slim fit shirts."
                                                  .text
                                                  .color(Colors.white)
                                                  .fontFamily('ave')
                                                  .size(12)
                                                  .align(TextAlign.center)
                                                  .fontWeight(FontWeight.w400)
                                                  .makeCentered()
                                                  .box
                                                  .make()
                                                  .h(50),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.3,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.15,
                                          color: Colors.yellow,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 100,
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: 8,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            return Row(
                                              children: [
                                                Container(
                                                  height: 80,
                                                  width: 80,
                                                  decoration: BoxDecoration(
                                                      color: Colors.amber,
                                                      border: Border.all(
                                                          color: Colors.white,
                                                          width: 2)),
                                                ),
                                                Container(
                                                  height: 80,
                                                  width: 80,
                                                  color: Colors.cyan,
                                                )
                                              ],
                                            );
                                          }),
                                    )
                                  ],
                                )
                              ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
              //   return SingleChildScrollView(
              //     child:
              // Column(
              //       children: [
              //         Padding(
              //           padding: const EdgeInsets.only(left: 10,right: 10),
              //           child: Container(
              //             color: Colors.white,
              //             child:Row(
              //               children: [
              //                Image.network('https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/Trousers$index.png')
              //               ],
              //             )
              //           ),
              //         ),
              //         Container(height: 20,)
              //       ],
              //     ),
              //   );
            }),
      )
    ]));
  }
}

class BuildFashionTab extends StatefulWidget {
  BuildFashionTab({Key? key}) : super(key: key);

  @override
  State<BuildFashionTab> createState() => _BuildFashionTabState();
}

class _BuildFashionTabState extends State<BuildFashionTab> {
  StyleOccassion occassion = Get.put(StyleOccassion());

  LooksProducts looks = Get.put(LooksProducts());

  StyleProducts controller3 = Get.put(StyleProducts());
  StyleAllproducts products = Get.put(StyleAllproducts());
  StylingPageController stylingPageController = Get.find();

  int pageno = 1;
  bool isLoading = false;
  final scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    scrollController.addListener(() {
      _scrollListener();
    });
  }

  Future<void> _scrollListener() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      pageno = pageno + 1;

      await stylingPageController.getlooksfilter(null, pageno);
      dev.log("Called");
      dev.log(pageno.toString());
    } else {
      dev.log("Not");
    }
    // print("...........");
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          occassion.obx(
              onLoading: Shimmer.fromColors(
                baseColor: const Color.fromARGB(
                  255,
                  52,
                  65,
                  83,
                ),
                highlightColor: Colors.grey[100] as Color,
                child: Container(
                  height: 400,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: ((context, index) => Column(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/office.png"),
                            ),
                            10.heightBox,
                            "Office"
                                .text
                                .size(12)
                                .fontFamily('ave_black')
                                .fontWeight(FontWeight.w800)
                                .white
                                .make()
                          ],
                        ).marginAll(10)),
                  ),
                ),
              ), (data) {
            int n = (data as List).indexWhere((e) => e["name"] == "products");
            final post = data[n]["categories"] as List;
            return Container(
              height: 130,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: post.length,
                itemBuilder: ((context, index) {
                  return post[index]["isEnabledForPersonalize"] == null ||
                          post[index]["isEnabledForPersonalize"] == false
                      ? Container()
                      : Column(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundImage:
                                  NetworkImage(post[index]["personalizeImage"]),
                            ),
                            10.heightBox,
                            "${post[index]["label"]}"
                                .text
                                .size(12)
                                .fontFamily('ave_black')
                                .fontWeight(FontWeight.w800)
                                .white
                                .make()
                          ],
                        ).marginAll(10);
                }),
              ),
            );
          }),
          20.heightBox,
          buildMainTitle("CLOTHES THAT WILL SUIT YOU", 12),
          10.heightBox,
          products
              .obx(
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
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            data![index]["category"]["personalizeImage"] ==
                                    null
                                ? Image.network(
                                    "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/haircuts.png")
                                : Image.network(
                                    data![index]["category"]
                                        ["personalizeImage"],
                                    height: 137,
                                    width: 138,
                                    fit: BoxFit.fitHeight),
                            10.heightBox,
                            "${data![index]["category"]["name"]}"
                                .text
                                .ellipsis
                                .fontFamily('ave')
                                .size(10)
                                .fontFamily('dmsans')
                                .fontWeight(FontWeight.w800)
                                .bold
                                .make(),
                            5.heightBox,
                            '${data![index]["masterData"]["note"]}'
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
                            .h(210)
                            .w(150);
                      }),
                ),
              )
              .h(230),
          20.heightBox,
          buildMainTitle("SHOP BY LOOKS", 12),
          20.heightBox,
          Obx(() {
            return StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: stylingPageController.looklength.value,
              itemBuilder: ((context, index) {
                final looks = stylingPageController
                    .looksfilterdata.value.looksFilter!.looks[index];
                return Column(
                  children: [
                    Stack(
                      children: [
                        Image.network(
                          looks.images.first,
                          width: double.infinity,
                          height: 140,
                          fit: BoxFit.cover,
                        ),
                        SvgPicture.network(
                                "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/circles.svg")
                            .positioned(right: 10, bottom: 10)
                      ],
                    ),
                    10.heightBox,
                    looks.title
                        .toString()
                        .text
                        .size(10)
                        .fontFamily('dmsans')
                        .fontWeight(FontWeight.w800)
                        .bold
                        .make()
                  ],
                ).p(10).box.white.roundedSM.make();
              }),
              staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
            );
          }),
          // looks.obx(
          //   onLoading: Shimmer.fromColors(
          //     baseColor: const Color.fromARGB(
          //       255,
          //       52,
          //       65,
          //       83,
          //     ),
          //     highlightColor: Colors.grey[100] as Color,
          //     child: Container(
          //       height: 1000,
          //       child: StaggeredGridView.countBuilder(
          //         crossAxisCount: 4,
          //         mainAxisSpacing: 8,
          //         crossAxisSpacing: 8,
          //         itemCount: 20,
          //         itemBuilder: ((context, index) => Column(
          //               children: [
          //                 Stack(
          //                   children: [
          //                     Image.network(
          //                         "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/shirt.png"),
          //                     SvgPicture.network(
          //                             "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/circles.svg")
          //                         .positioned(right: 10, bottom: 10)
          //                   ],
          //                 ),
          //                 10.heightBox,
          //                 "data[index][name]"
          //                     .toString()
          //                     .text
          //                     .size(10)
          //                     .fontFamily('dmsans')
          //                     .fontWeight(FontWeight.w800)
          //                     .bold
          //                     .make()
          //               ],
          //             ).p(10).box.white.roundedSM.make()),
          //         staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
          //       ),
          //     ),
          //   ),
          //   (data) => Container(
          //     height: 1000,
          //     child: StaggeredGridView.countBuilder(
          //       crossAxisCount: 4,
          //       mainAxisSpacing: 8,
          //       crossAxisSpacing: 8,
          //       itemCount: data!.length,
          //       itemBuilder: ((context, index) => Column(
          //             children: [
          //               Stack(
          //                 children: [
          //                   Image.network(
          //                     data[index]["images"][0],
          //                     width: double.infinity,
          //                     height: 140,
          //                     fit: BoxFit.cover,
          //                   ),
          //                   SvgPicture.network(
          //                           "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/circles.svg")
          //                       .positioned(right: 10, bottom: 10)
          //                 ],
          //               ),
          //               10.heightBox,
          //               data[index]["name"]
          //                   .toString()
          //                   .text
          //                   .size(10)
          //                   .fontFamily('dmsans')
          //                   .fontWeight(FontWeight.w800)
          //                   .bold
          //                   .make()
          //             ],
          //           ).p(10).box.white.roundedSM.make()),
          //       staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
