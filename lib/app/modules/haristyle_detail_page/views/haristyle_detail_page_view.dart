import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:styleclub/app/modules/grooming_page/views/grooming_page_view.dart';
import 'package:styleclub/app/modules/haristyle_detail_page/hairstyle_detail_query.dart';
import 'package:styleclub/app/services/variables.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/resources/app_resources.dart';
import '../../../core/widgets/app_widgets.dart';
import '../controllers/haristyle_detail_page_controller.dart';

HaristyleDetailPageController2 hairstyle =
    Get.put(HaristyleDetailPageController2());

class HaristyleDetailPageView extends GetView<HaristyleDetailPageController> {
  const HaristyleDetailPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(leading: BackButton(),
      backgroundColor: Colors.transparent,
      elevation: 0,),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                constraints: BoxConstraints(minHeight: 
   MediaQuery.of(context).size.height * 0.6,
                minWidth: MediaQuery.of(context).size.width,
                ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(image: NetworkImage(variables.attributeimg),
                    fit: BoxFit.fill)
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(variables.attributename,
                      style: TextStyle(
                        fontSize: 26,
                        fontFamily: 'poppins',
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),),
                         Container(width: MediaQuery.of(context).size.width ,
                           child: Text(variables.attributenote,
                                               style: TextStyle(
                                                 fontSize: 18,
                                                 fontFamily: 'dmsans',
                                                 color: Colors.white,
                                                 fontWeight: FontWeight.w500
                                               ),),
                         ),
                    ],
                  ))
              ],
            ),
            20.heightBox,
             hairstyle.obx(
          (data1) => controller.obx(
            (data) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
             
                buildMainTitle("GET ONE NOW AT THE FOLLOWING", 16)
                    .marginOnly(left: 10),
                ListView.builder(
                  padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: data1!.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (ctx, index) {
                      return Row(
                        children: [
                          Container(
                            height: 140,
                            width: 140,
                            child: Image.network(data1[index]['images'][0],
                                fit: BoxFit.fitHeight),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40)),
                          ),
                          10.widthBox,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                child: "${data1[index]['title']}"
                                    .text
                                    .size(10)
                                    .overflow(TextOverflow.fade)
                                    .fontFamily('dmsans')
                                    .fontWeight(FontWeight.w700)
                                    .bold
                                    .ellipsis
                                    .make(),
                              ),
                              5.heightBox,
                              Row(
                                children: [
                                  SvgPicture.network("https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/star.svg"),
                                  5.widthBox,
                                  Container(
                                    width: 190,
                                    child: "${data1[index]['address']}"
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
                                  SvgPicture.network("https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/sparklefill.svg"),
                                  5.widthBox,
                                  Container(
                                    width: 190,
                                    child: "${data1[index]['note']}"
                                        .text
                                        .ellipsis
                                        .size(10)
                                        .fontFamily('dmsans')
                                        .fontWeight(FontWeight.w700)
                                        .gray400
                                        .make(),
                                  )
                                ],
                              ),
                              10.heightBox,
                              Stack(children: [
                                Image.network("https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/Rectangle 40.png").h(40),
                                Padding(
                                  padding: EdgeInsets.only(top: 10.0, left: 16),
                                  child: "${data1[index]['serialNo']}"
                                      .text
                                      .bold
                                      .size(10)
                                      .color(Color(0xff795A00))
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
                          .make();
                    }),
              ],
            ),
          ),
        ),
          ],
        ),
      
      )
          
          .box
          .width(double.infinity)
          .withDecoration(scaffoldGradient)
          .height(double.infinity)
          .make(),
    );
  }

  Widget buildDescription(String description) {
    return description.text.bold.white.make().marginOnly(left: 20);
  }
}
