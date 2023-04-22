import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:styleclub/app/modules/grooming_page/views/post_detail_view.dart';
import 'package:styleclub/app/routes/app_pages.dart';
import 'package:styleclub/app/services/variables.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/resources/app_resources.dart';
import '../../../core/widgets/app_widgets.dart';
import '../controllers/grooming_page_controller.dart';
import 'package:sizer/sizer.dart';

GroomingPartners groomer = Get.put(GroomingPartners());
GroomingStyles styler = Get.put(GroomingStyles());
GroomingStyles2 styler2 = Get.put(GroomingStyles2());
GroomingStyles3 trending = Get.put(GroomingStyles3());

class GroomingPageView extends GetView<GroomingPageController> {
  const GroomingPageView({Key? key}) : super(key: key);
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
                  'SALONS',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'dmsans',
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  'HAIRSTYLE',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'dmsans',
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  'BEARRD STYLE',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'dmsans',
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  'TRENDING',
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
            BuildSALONSTAB(),
            BuildHairStyle2(),
            BuildHairStyle(),
            BuildTrending()
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
        buildMainTitle("GROOMING", 22).expand(),
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

class BuildSALONSTAB extends StatelessWidget {
  BuildSALONSTAB({Key? key}) : super(key: key);
  GroomingPageController groomingPageController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildMainTitle("LATEST TRENDS AND UPDATES", 12),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.32,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: groomingPageController
                    .allpostdata!.getPostsByFilter.posts.length,
                itemBuilder: (context, index) {
                  final post = groomingPageController
                      .allpostdata!.getPostsByFilter.posts[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      post.imageOrVideo.isVideo == false &&
                              post.imageOrVideo.url != ""
                          ? Image.network(
                              post.imageOrVideo.url,
                              scale: 4,
                              fit: BoxFit.fill,
                              height: 170,
                              width: double.infinity,
                            )
                          : Container(),
                      10.heightBox,
                      "${post.heading}"
                          .text
                          .overflow(TextOverflow.ellipsis)
                          .fontFamily('ave')
                          .size(10)
                          .fontFamily('dmsans')
                          .fontWeight(FontWeight.w800)
                          .bold
                          .make(),
                      5.heightBox,
                      "${post.note}"
                          .text
                          .overflow(TextOverflow.ellipsis)
                          .fontFamily('ave')
                          .size(10)
                          .fontFamily('dmsans')
                          .fontWeight(FontWeight.w800)
                          .bold
                          .gray400
                          .make(),
                    ],
                  )
                      .p(5)
                      .box
                      .width(160)
                      .white
                      .roundedSM
                      .margin(const EdgeInsets.all(10))
                      .make()
                      .onInkTap(() {
                    variables.attributename = post.heading;
                    variables.attributenote = post.note;
                    variables.attributeimg =
                        post.imageOrVideo.isVideo == false &&
                                post.imageOrVideo.url != ""
                            ? post.imageOrVideo.url
                            : "";

                    Get.to(() => PostDetail());
                  });
                }),
          ),
          20.heightBox,
          buildMainTitle("TOP SALON DEALS", 12),
          buildSalonDeal(),
          10.heightBox,
          const ButtonPrimary(title: "VIEW MORE"),
          40.heightBox,
          buildMainTitle("TOP TRENDING HAIRCUTS", 12),
          10.heightBox,
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.32,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: groomingPageController.tophaircutdata!
                    .getUserGroomingRecommendedAttributes.length,
                itemBuilder: ((context, index) {
                  return Column(
                    children: [
                      Image.network(
                        groomingPageController
                            .tophaircutdata!
                            .getUserGroomingRecommendedAttributes[index]
                            .masterData
                            .personalizeImage,
                        //   "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/haircuts.png",
                        fit: BoxFit.fill,
                        height: 170,
                        width: double.infinity,
                      ),
                      10.heightBox,
                      "${groomingPageController.tophaircutdata!.getUserGroomingRecommendedAttributes[index].masterData.name}"
                          .text
                          .size(10)
                          .fontFamily('dmsans')
                          .fontWeight(FontWeight.w700)
                          .black
                          .bold
                          .make(),
                      5.heightBox,
                      "5.23 people clicked"
                          .text
                          .size(10)
                          .fontFamily('dmsans')
                          .fontWeight(FontWeight.w700)
                          .gray400
                          .make(),
                    ],
                  )
                      .p(5)
                      .box
                      .width(160)
                      .white
                      .roundedSM
                      .margin(const EdgeInsets.all(10))
                      .make()
                      .onInkTap(() {
                    variables.attributename = groomingPageController
                        .tophaircutdata!
                        .getUserGroomingRecommendedAttributes[index]
                        .masterData
                        .name;
                    variables.attributenote = groomingPageController
                        .tophaircutdata!
                        .getUserGroomingRecommendedAttributes[index]
                        .masterData
                        .note;
                    variables.attributeimg = groomingPageController
                        .tophaircutdata!
                        .getUserGroomingRecommendedAttributes[index]
                        .masterData
                        .personalizeImage;

                    Get.toNamed(Routes.HARISTYLE_DETAIL_PAGE);
                  });
                })),
          ),
          20.heightBox,
          buildMainTitle("HAIRSTYLE BLOGS", 12),
          10.heightBox,
          buildStackInfo(
              "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/hairstyleblog.png",
              "TOP 10 HAIRCUTS of JULY'22")
        ],
      ),
    );
  }

  buildSalonDeal() {
    return groomer.obx(
      onEmpty: const Text("No deals found"),
      onError: (error) {
        return Text(error!);
      },
      onLoading: Shimmer.fromColors(
        baseColor: const Color.fromARGB(
          255,
          52,
          65,
          83,
        ),
        highlightColor: Colors.grey[100] as Color,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (ctx, index) {
              return BuildSalon(
                name: 'name',
                rating: 5,
                offer: 'note',
                location: 'address',
                title: 'title',
                branch: 10,
                image:
                    'https://www.shutterstock.com/image-photo/portrait-handsome-man-black-suit-260nw-460050457.jpg',
                link: 'googlePageLink',
                hoursopen: 'hoursOpen',
              );
            }),
      ),
      (data) => ListView.builder(
          shrinkWrap: true,
          itemCount: data!.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (ctx, index) {
            List<Object?> list = data[index]["banner"];

            return BuildSalon(
              name: data[index]['name'],
              rating: data[index]['googleRating'],
              offer: data[index]['note'] == null || data[index]["note"] == ""
                  ? "null"
                  : data[index]['note'],
              location: data[index]['address'],
              title: data[index]['title'],
              branch: data[index]['brandPartnerBranchNo'],
              image: list.isEmpty
                  ? "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/haircuts.png"
                  : data[index]['banner'][0]['url'],
              link: data[index]['googlePageLink'],
              hoursopen: data[index]['hoursOpen'],
            );
          }),
    );
  }
}

class BuildSalon extends StatefulWidget {
  String name;
  int rating;
  String offer;
  String location;
  String title;
  int branch;
  String image;
  String hoursopen;
  String link;
  BuildSalon(
      {Key? key,
      required this.hoursopen,
      required this.link,
      required this.name,
      required this.rating,
      required this.offer,
      required this.location,
      required this.title,
      required this.branch,
      required this.image})
      : super(key: key);

  @override
  State<BuildSalon> createState() => _BuildSalonState();
}

class _BuildSalonState extends State<BuildSalon> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 140,
          width: 140,
          child: Image.network(widget.image, fit: BoxFit.fitHeight),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
        ),
        10.widthBox,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            "${widget.name}"
                .text
                .size(10)
                .fontFamily('dmsans')
                .fontWeight(FontWeight.w700)
                .bold
                .make(),
            5.heightBox,
            Row(
              children: [
                SvgPicture.network(
                    "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/star.svg"),
                5.widthBox,
                Container(
                  width: 170,
                  child:
                      "${widget.rating}(${widget.branch}+) ${widget.location}"
                          .text
                          .ellipsis
                          .size(9)
                          .fontFamily('dmsans')
                          .fontWeight(FontWeight.w700)
                          .gray400
                          .make(),
                )
              ],
            ),
            5.heightBox,
            Row(
              children: [
                SvgPicture.network(
                    "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/sparklefill.svg"),
                5.widthBox,
                "${widget.title}"
                    .text
                    .overflow(TextOverflow.ellipsis)
                    .size(10)
                    .fontFamily('dmsans')
                    .fontWeight(FontWeight.w700)
                    .gray400
                    .make()
                    .p(2)
                    .box
                    .make()
                    .expand()
              ],
            ),
            10.heightBox,
            Stack(children: [
              Image.network(
                      "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/Rectangle 40.png")
                  .h(40),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 16),
                child: "${widget.offer}"
                    .text
                    .bold
                    .size(10)
                    .color(const Color(0xff795A00))
                    .make(),
              )
            ])
          ],
        ).expand()
      ],
    )
        .p(10)
        .box
        .white
        .roundedSM
        .margin(const EdgeInsets.all(10))
        .make()
        .onInkTap(() {
      variables.saloonname = widget.name;
      variables.saloonaddress = widget.location;
      variables.saloonimage = widget.image;
      variables.saloonlink = widget.link;
      variables.saloonbranches = widget.branch;
      variables.saloonhoursopen = widget.hoursopen;
      variables.saloonrating = widget.rating;
      Get.toNamed(Routes.BARBER_DETAIL_PAGE);
    });
  }
}

class BuildHairStyle2 extends StatelessWidget {
  const BuildHairStyle2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return styler2.obx(
      onLoading: Shimmer.fromColors(
        baseColor: const Color.fromARGB(
          255,
          52,
          65,
          83,
        ),
        highlightColor: Colors.grey[100] as Color,
        child: StaggeredGridView.countBuilder(
            crossAxisCount: 4,
            mainAxisSpacing: 4,
            crossAxisSpacing: 2,
            itemCount: 10,
            staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
            itemBuilder: ((context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/haircuts.png",
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),

                    //                   Image.network(
                    //  data[index]["masterData"]["personalizeImage"],
                    //   fit: BoxFit.cover,
                    //   width: double.infinity,
                    // ),
                    10.heightBox,
                    "uivrvrrk"
                        .text
                        .size(10)
                        .fontFamily('dmsans')
                        .fontWeight(FontWeight.w700)
                        .black
                        .bold
                        .make(),
                    5.heightBox,
                    "5.23 people clicked"
                        .text
                        .size(10)
                        .fontFamily('dmsans')
                        .fontWeight(FontWeight.w700)
                        .gray400
                        .bold
                        .make(),
                  ],
                )
                    .p(5)
                    .box
                    .white
                    .roundedSM
                    .margin(const EdgeInsets.all(10))
                    .make())),
      ),
      (data) => StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          crossAxisSpacing: 2,
          itemCount: data!.length,
          staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
          itemBuilder: ((context, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  data[index]["masterData"]["personalizeImage"] == null ||
                          data[index]["masterData"]["personalizeImage"] == ""
                      ? Image.network(
                          "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/haircuts.png",
                          fit: BoxFit.cover,
                          width: double.infinity,
                        )
                      : Image.network(
                          data[index]["masterData"]["personalizeImage"],
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                  //                   Image.network(
                  //  data[index]["masterData"]["personalizeImage"],
                  //   fit: BoxFit.cover,
                  //   width: double.infinity,
                  // ),
                  10.heightBox,
                  data[index]["masterData"]["name"]
                      .toString()
                      .text
                      .size(10)
                      .fontFamily('dmsans')
                      .fontWeight(FontWeight.w700)
                      .black
                      .bold
                      .make(),
                  5.heightBox,
                  "5.23 people clicked"
                      .text
                      .size(10)
                      .fontFamily('dmsans')
                      .fontWeight(FontWeight.w700)
                      .gray400
                      .bold
                      .make(),
                ],
              )
                  .p(5)
                  .box
                  .white
                  .roundedSM
                  .margin(const EdgeInsets.all(10))
                  .make()
                  .onInkTap(() {
                variables.attributename =
                    data[index]["masterData"]["name"].toString();
                variables.attributenote =
                    data[index]["masterData"]["note"].toString();

                variables.attributeimg = data[index]["masterData"]
                                ["personalizeImage"] ==
                            null ||
                        data[index]["masterData"]["personalizeImage"] == ""
                    ? "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/haircuts.png"
                    : data[index]["masterData"]["personalizeImage"];

                Get.toNamed(Routes.HARISTYLE_DETAIL_PAGE);
              }))),
    );
  }
}

class BuildHairStyle extends StatelessWidget {
  const BuildHairStyle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return styler.obx(
      onLoading: Shimmer.fromColors(
        baseColor: const Color.fromARGB(
          255,
          52,
          65,
          83,
        ),
        highlightColor: Colors.grey[100] as Color,
        child: StaggeredGridView.countBuilder(
            crossAxisCount: 4,
            mainAxisSpacing: 4,
            crossAxisSpacing: 2,
            itemCount: 10,
            staggeredTileBuilder: (int index) => const StaggeredTile.fit(2),
            itemBuilder: ((context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/haircuts.png",
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),

                    //                   Image.network(
                    //  data[index]["masterData"]["personalizeImage"],
                    //   fit: BoxFit.cover,
                    //   width: double.infinity,
                    // ),
                    10.heightBox,
                    "uivrvrrk"
                        .text
                        .size(10)
                        .fontFamily('dmsans')
                        .fontWeight(FontWeight.w700)
                        .black
                        .bold
                        .make(),
                    5.heightBox,
                    "5.23 people clicked"
                        .text
                        .size(10)
                        .fontFamily('dmsans')
                        .fontWeight(FontWeight.w700)
                        .gray400
                        .bold
                        .make(),
                  ],
                )
                    .p(5)
                    .box
                    .white
                    .roundedSM
                    .margin(const EdgeInsets.all(10))
                    .make())),
      ),
      (data) => StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          crossAxisSpacing: 2,
          itemCount: data!.length,
          staggeredTileBuilder: (int index) => const StaggeredTile.fit(2),
          itemBuilder: ((context, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  data[index]["masterData"]["personalizeImage"] == null ||
                          data[index]["masterData"]["personalizeImage"] == ""
                      ? Image.network(
                          "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/haircuts.png",
                          fit: BoxFit.cover,
                          width: double.infinity,
                        )
                      : Image.network(
                          data[index]["masterData"]["personalizeImage"],
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                  //                   Image.network(
                  //  data[index]["masterData"]["personalizeImage"],
                  //   fit: BoxFit.cover,
                  //   width: double.infinity,
                  // ),
                  10.heightBox,
                  data[index]["masterData"]["name"]
                      .toString()
                      .text
                      .size(10)
                      .fontFamily('dmsans')
                      .fontWeight(FontWeight.w700)
                      .black
                      .bold
                      .make(),
                  5.heightBox,
                  "5.23 people clicked"
                      .text
                      .size(10)
                      .fontFamily('dmsans')
                      .fontWeight(FontWeight.w700)
                      .gray400
                      .bold
                      .make(),
                ],
              )
                  .p(5)
                  .box
                  .white
                  .roundedSM
                  .margin(const EdgeInsets.all(10))
                  .make()
                  .onInkTap(() {
                variables.attributename =
                    data[index]["masterData"]["name"].toString();
                variables.attributenote =
                    data[index]["masterData"]["note"].toString();

                variables.attributeimg = data[index]["masterData"]
                                ["personalizeImage"] ==
                            null ||
                        data[index]["masterData"]["personalizeImage"] == ""
                    ? "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/haircuts.png"
                    : data[index]["masterData"]["personalizeImage"];

                Get.toNamed(Routes.HARISTYLE_DETAIL_PAGE);
              }))),
    );
  }
}

class BuildTrending extends StatelessWidget {
  const BuildTrending({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return trending.obx(
      onLoading: Shimmer.fromColors(
        baseColor: const Color.fromARGB(
          255,
          52,
          65,
          83,
        ),
        highlightColor: Colors.grey[100] as Color,
        child: StaggeredGridView.countBuilder(
            crossAxisCount: 4,
            mainAxisSpacing: 4,
            crossAxisSpacing: 2,
            itemCount: 10,
            staggeredTileBuilder: (int index) => const StaggeredTile.fit(2),
            itemBuilder: ((context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/haircuts.png",
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),

                    //                   Image.network(
                    //  data[index]["masterData"]["personalizeImage"],
                    //   fit: BoxFit.cover,
                    //   width: double.infinity,
                    // ),
                    10.heightBox,
                    "uivrvrrk"
                        .text
                        .size(10)
                        .fontFamily('dmsans')
                        .fontWeight(FontWeight.w700)
                        .black
                        .bold
                        .make(),
                    5.heightBox,
                    "5.23 people clicked"
                        .text
                        .size(10)
                        .fontFamily('dmsans')
                        .fontWeight(FontWeight.w700)
                        .gray400
                        .bold
                        .make(),
                  ],
                )
                    .p(5)
                    .box
                    .white
                    .roundedSM
                    .margin(const EdgeInsets.all(10))
                    .make())),
      ),
      (data) => StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          crossAxisSpacing: 2,
          itemCount: data!.length,
          staggeredTileBuilder: (int index) => const StaggeredTile.fit(2),
          itemBuilder: ((context, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  data[index]["images"] == null || data[index]["images"] == ""
                      ? Image.network(
                          "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/haircuts.png",
                          fit: BoxFit.cover,
                          width: double.infinity,
                        )
                      : Image.network(
                          data[index]["images"][0],
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                  //                   Image.network(
                  //  data[index]["masterData"]["personalizeImage"],
                  //   fit: BoxFit.cover,
                  //   width: double.infinity,
                  // ),
                  10.heightBox,
                  data[index]["title"]
                      .toString()
                      .text
                      .size(10)
                      .fontFamily('dmsans')
                      .fontWeight(FontWeight.w700)
                      .black
                      .bold
                      .make(),
                  5.heightBox,
                  "5.23 people clicked"
                      .text
                      .size(10)
                      .fontFamily('dmsans')
                      .fontWeight(FontWeight.w700)
                      .gray400
                      .bold
                      .make(),
                ],
              )
                  .p(5)
                  .box
                  .white
                  .roundedSM
                  .margin(const EdgeInsets.all(10))
                  .make()
                  .onInkTap(() {}))),
    );
  }
}
