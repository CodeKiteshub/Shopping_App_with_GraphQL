import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:styleclub/app/core/resources/app_resources.dart';
import 'package:styleclub/app/core/widgets/app_widgets.dart';

import 'package:velocity_x/velocity_x.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controllers/barber_detail_page_controller.dart';
import '../../../services/variables.dart';

class BarberDetailPageView extends GetView<BarberDetailPageController> {
  BarberDetailPageView({Key? key}) : super(key: key);
  late final GoogleMapController googleMapController;

  static const LatLng _center = const LatLng(45.521563, -122.677433);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildImage(),
            10.heightBox,
            buildDescription("Address: ${variables.saloonaddress}"),
            10.heightBox,
            buildDescription("Hourse Open: ${variables.saloonhoursopen}"),
            20.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/call2.png",
                  width: 40,
                  fit: BoxFit.cover,
                  height: 40,
                ),
                10.widthBox,
                Image.network(
                  "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/bookappointment.png",
                  width: 40,
                  fit: BoxFit.cover,
                  height: 40,
                ),
              ],
            ),
            20.heightBox,
            buildMainTitle("PHOTOS", 16).marginOnly(left: 10),
            buildHorizontalListView(Image.network(
                        "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/cutting.png")
                    .marginAll(10))
                .h(150),
            20.heightBox,
            buildMainTitle("TAKE ME THERE", 16).marginOnly(left: 10),
            10.heightBox,
            // Image.network("https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/map.png").centered(),
            SizedBox(
              height: 200,
              child: GoogleMap(
                onMapCreated: (controller) => googleMapController = controller,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 11.0,
                ),
              ),
            ),
            10.heightBox,
            ButtonPrimary(title: "OPEN GOOGLE MAPS").onInkTap(() {
              MapUtils.openMap(variables.saloonlink);
            }),
            20.heightBox,
          ],
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

  Widget buildDescription(String description) {
    return description.text.bold.white.make().marginOnly(left: 20);
  }

  Stack buildImage() {
    return Stack(
      children: [
        Image.network(variables.saloonimage,
            fit: BoxFit.cover, width: double.infinity),
        const Icon(
          Icons.arrow_back,
          color: Vx.white,
        ).marginAll(20).onTap(() {
          Get.back();
        }),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "${variables.saloonname}".text.white.size(22).bold.make(),
            10.heightBox,
            Row(
              children: [
                SvgPicture.network(
                    "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/star.svg"),
                5.widthBox,
                "${variables.saloonrating}(${variables.saloonbranches}) ${variables.saloonaddress}"
                    .text
                    .white
                    .bold
                    .size(14)
                    .make()
              ],
            )
          ],
        ).p(20).positioned(bottom: 0)
      ],
    );
  }
}

class MapUtils {
  MapUtils._();

  static Future<void> openMap(String url) async {
    //y String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not open the map.';
    }
  }
}
