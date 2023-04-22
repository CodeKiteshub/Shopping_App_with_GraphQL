import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:styleclub/app/services/variables.dart';
import 'package:styleclub/app/services/variables.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/resources/app_resources.dart';
import '../../../services/variables.dart';
import '../controllers/influence_page_controller.dart';

class InfluencePageView extends GetView<InfluencePageController> {
  const InfluencePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 730,
                child: Stack(children: [
                  TabBarView(controller: controller.tabController, children: [
                    BuildLooksTab(),
                    BuildWatch(),
                    BuildLooksTab(),
                  ]),
                  10.heightBox,
                  buildAppBar(),
                ])),
          ],
        )
            .safeArea()
            .box
            .withDecoration(scaffoldGradient)
            .height(double.maxFinite)
            .width(double.maxFinite)
            .make(),
      ),
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
        15.widthBox,
        SizedBox(
          height: 60,
          child: TabBar(
            tabs: [
              Text(
                'Browse',
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'dmsans',
                    fontWeight: FontWeight.w700),
              ).onTap(() {
                variables.fullscreen = false;
              }),
              Text(
                'Watch',
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'dmsans',
                    fontWeight: FontWeight.w700),
              ).onTap(() {
                variables.fullscreen = true;
              }),
              Text(
                'People',
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'dmsans',
                    fontWeight: FontWeight.w700),
              ),
            ],
            unselectedLabelColor: Vx.gray200,
            indicatorColor: goldenColorEnd,
            labelColor: Vx.white,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 3.0,
            indicatorPadding: const EdgeInsets.all(10),
            isScrollable: true,
            controller: controller.tabController,
          ),
        ),
      ],
    );
  }
}

class BuildLooksTab extends StatelessWidget {
  BuildLooksTab({Key? key}) : super(key: key);
  LooksProducts looks = Get.put(LooksProducts());
  @override
  Widget build(BuildContext context) {
    return looks.obx(
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
      (data) => Column(
        children: [
          SizedBox(height: 50),
          Container(
            height: MediaQuery.of(context).size.height * 0.805,
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
                            fit: BoxFit.fitHeight,
                          ),
                          SvgPicture.network(
                                  "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/circles.svg")
                              .positioned(right: 10, bottom: 10)
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
                  ).p(10).box.white.roundedSM.make()),
              staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
            ),
          ),
        ],
      ),
    );
  }
}
// class BuildLooksTab extends StatelessWidget {
//   const BuildLooksTab({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(height: 50),
//         GridView.builder(
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisSpacing: 10, mainAxisSpacing: 10, crossAxisCount: 2),
//             itemBuilder: (ctx, index) {
//               return Column(
//                 children: [
//                   Stack(
//                     children: [
//                       Image.network(
//                         Assets.images.styling1.path,
//                         width: double.infinity,
//                         height: MediaQuery.of(context).size.height*0.18,
//                         fit: BoxFit.cover,
//                       ),
//                       SvgPicture.network("https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/"Assets.images.circles)
//                           .positioned(right: 10, bottom: 10)
//                     ],
//                   ),
//                   10.heightBox,
//                   "A Fresh Formal Look"
//                       .text
//                       .size(10)
//                       .fontFamily('dmsans')
//                       .fontWeight(FontWeight.w700)
//                       .bold
//                       .make()
//                 ],
//               ).p(5).box.white.roundedSM.make();
//             }).expand()
//       ],
//     );
//   }
// }

class BuildWatch extends StatefulWidget {
  const BuildWatch({Key? key}) : super(key: key);

  @override
  State<BuildWatch> createState() => _BuildWatchState();
}

class _BuildWatchState extends State<BuildWatch> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          // borderRadius: BorderRadius.circular(10),
          child: Container(
            child: Image.network(
                "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/watch.png",
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 1),
          ),
        ),
        Column(
          children: [
            Row(
              children: [
                "rituraj.fashion"
                    .text
                    .size(20)
                    .fontFamily('ave_black')
                    .fontWeight(FontWeight.w800)
                    .white
                    .bold
                    .make()
                    .expand(),
                "Follow"
                    .text
                    .bold
                    .size(16)
                    .fontFamily('ave_black')
                    .fontWeight(FontWeight.w800)
                    .white
                    .make()
                    .pOnly(left: 20, right: 20, top: 10, bottom: 10)
                    .box
                    .color(goldenColorEnd)
                    .roundedSM
                    .make()
              ],
            ),
            10.heightBox,
            Faker().lorem.sentences(2).join(" ").text.gray200.make()
          ],
        ).positioned(bottom: 10, left: 10, right: 10)
      ],
    ).w(double.infinity).h(double.infinity);
  }
}
