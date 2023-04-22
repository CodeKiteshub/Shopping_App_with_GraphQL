import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:styleclub/app/routes/app_pages.dart';
import 'package:styleclub/app/services/variables.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../gen/assets.gen.dart';
import '../../../core/resources/app_resources.dart';
import '../../../core/widgets/app_widgets.dart';
import '../controllers/shop_page_controller.dart'as prefix;

class ShopPageView extends GetView<prefix.ShopPageController> {
  const ShopPageView({Key? key}) : super(key: key);

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
                  'FASHION',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'dmsans',
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  'GROOMING',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'dmsans',
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  'LIFESTYLE',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'dmsans',
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  'BLOGS',
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
            BuildFashionTab(),
            BuildFashionTab(),
            BuildFashionTab(),
            BuildFashionTab()
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
        buildMainTitle("SHOP", 22).expand(),
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

class BuildFashionTab extends StatelessWidget {
  BuildFashionTab({Key? key}) : super(key: key);
  prefix.CategoryProducts category = Get.put(prefix.CategoryProducts());
   prefix.LooksProducts looks = Get.put(prefix.LooksProducts());
  prefix.StyleProducts controller3 = Get.put(prefix.StyleProducts());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: category.obx(
        (data) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: data!.length,
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            NetworkImage(data[index]["image"]),
                        radius: MediaQuery.of(context).size.height * 0.04,
                      ),
                      //  CircleAvatar(child: Image.network(data[index]["categories"][0]["image"]),radius: 30,),
                      10.heightBox,
                      "${data[index]["label"]}"
                          .text
                          .size(12)
                          .fontFamily('ave_black')
                          .fontWeight(FontWeight.w800)
                          .white
                          .make()
                    ],
                  ).marginAll(10);
                }).h(124),
            // buildHorizontalListView(Column(
            //   children: [
            //     Image.network("https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/"Assets.images.office.path),
            //     10.heightBox,
            //     "Office"
            //         .text
            //         .size(12)
            //         .fontFamily('ave_black')
            //         .fontWeight(FontWeight.w800)
            //         .white
            //         .make()
            //   ],
            // ).marginAll(10))
            //     .h(124),
            20.heightBox,
            // buildMainTitle("CLOTHES THAT WILL SUIT YOU", 12),
            // 10.heightBox,
            buildMainTitle("CLOTHES THAT WILL SUIT YOU", 12),
            10.heightBox,
            controller3
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
                              data![index]["masterData"]["personalizeImage"] ==
                                      null
                                  ? Image.network(
                                      "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/haircuts.png")
                                  : Image.network(
                                      data![index]["masterData"]
                                          ["personalizeImage"],
                                      height: 137,
                                      width: 138,
                                      fit: BoxFit.fitHeight),
                              10.heightBox,
                              "${data![index]["masterData"]["name"]}"
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
            looks.obx(
              onLoading: Shimmer.fromColors(
                baseColor: const Color.fromARGB(
                  255,
                  52,
                  65,
                  83,
                ),
                highlightColor: Colors.grey[100] as Color,
                child: Container(
                  height: 1000,
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 4,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    itemCount: 20,
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
              (data) => Container(
                height: 1000,
                child: StaggeredGridView.countBuilder(
                  crossAxisCount: 4,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  itemCount: data!.length,
                  itemBuilder: ((context, index) => Column(
                        children: [
                          Stack(
                            children: [
                              Image.network(
                                data[index]["images"][0],
                                width: double.infinity,
                                height: 140,
                                fit: BoxFit.cover,
                              ),
                              SvgPicture.network(
                                      "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/circles.svg")
                                  .positioned(right: 10, bottom: 10)
                            ],
                          ).onInkTap(() {
                            variables.product = index;
                            variables.selectedcat =
                                data[index]["products"][0]["catId"];
                            print(data[index]["products"][0]["catId"]);
                            print(variables.product);
                            Get.toNamed(Routes.SHOP_DETAILS_PAGE);
                          }),
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
                      ).p(10).box.white.roundedSM.make()),
                  staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
