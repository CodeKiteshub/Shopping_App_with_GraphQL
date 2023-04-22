import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import 'package:styleclub/app/modules/onboarding/views/persona_page1.dart';
import 'package:styleclub/app/modules/photo_upload/controllers/photo_upload_controller.dart';

import 'package:styleclub/app/routes/app_pages.dart';
import 'package:styleclub/app/services/models/selectionmodel.dart';
import 'package:styleclub/app/services/queryMutation.dart' as prefix;
import 'package:styleclub/app/services/variables.dart';
import 'dart:developer';
import 'package:velocity_x/velocity_x.dart';
import '../../../core/resources/app_resources.dart';
import '../../../services/queryQuery.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  ApiClients apiClients = Get.put(ApiClients());
  prefix.ApiClients mutation = prefix.ApiClients();
  PhotoUploadController photoUploadController =
      Get.put(PhotoUploadController());
  RxBool isLoading = false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(bottomNavigationBar: Obx(() {
      return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Visibility(
            visible: controller.counter.value > 0,
            child: "Back"
                .text
                .bold
                .color(goldenColorEnd)
                .make()
                .onInkTap(() async {
              controller.indexselection.value.clear();
              controller.indexselection2.value.clear();

              controller.answerCollection.value.clear();
              variables.formIds = "";
              await apiClients.getCountry();

              controller.counter.value = controller.counter.value - 1;
              controller.screen.value = !controller.screen.value;
            })),
        Obx(() {
          return "${controller.counter.value + 1}/${variables.screens}"
              .text
              .size(16)
              .bold
              .color(goldenColorStart)
              .make();
        }),
        isLoading.value == true
            ? CircularProgressIndicator.adaptive()
            : "Next".text.bold.color(goldenColorEnd).make().onInkTap(() async {
                //  print("page1...." + controller.answerCollection.value.length.toString());
                isLoading(true);

                if (controller.counter.value < (variables.screens - 1)) {
                  //     //  Get.snackbar('No of ids selcted', variables.formIds.toString());

                  if (controller.counter.value == 14) {
                    isLoading(false);
                    controller.page15selection.value.clear();
                    controller.answerCollection.value.map(
                      (e) {
                        controller.page15selection.value.add(e);
                      },
                    ).toList();
                    controller.page15selection
                        .forEach((element) => log(element.toJson().toString()));
                    controller.counter.value = controller.counter.value + 1;
                    controller.screen.value = !controller.screen.value;
                  } else if (controller.counter.value == 15) {
                    isLoading(false);

                    Future(() {
                      controller.answerCollection.value.map(
                        (e) {
                          controller.page15selection.value.add(e);
                        },
                      ).toList();
                    }).then((_) {
                      controller.answerCollection.value.clear();
                      Future(() => controller.page15selection.value.map(
                            (e) {
                              controller.answerCollection.value.add(e);
                            },
                          ).toList());
                    }).then((value) => mutation.save_option(variables.formIds));

                    controller.counter.value = controller.counter.value + 1;
                    controller.screen.value = !controller.screen.value;
                  } else {
                    if (controller.answerCollection.value.length >=
                        variables
                            .form
                            .getPersonalizeForm!
                            .screens![controller.counter.toInt()]
                            .questions!
                            .length) {
                      await mutation.save_option(variables.formIds);

                      controller.indexselection.value.clear();
                      controller.indexselection2.value.clear();
                      await apiClients.getCountry();
                      controller.answerCollection.value.clear();
                      variables.formIds = "";
                      isLoading(false);
                      controller.counter.value = controller.counter.value + 1;
                      controller.screen.value = !controller.screen.value;
                    } else {
                      isLoading(false);

                      Get.defaultDialog(
                          title: "Error", content: Text("Please Select one."));
                    }
                  }
                } else {
                  isLoading(false);
                  if (controller.socialbio.value != "") {
                    controller.answerCollection.value.add(SelectionModel(
                        mastername: variables
                            .form
                            .getPersonalizeForm!
                            .screens![controller.counter.toInt()]
                            .questions![1]
                            .question!
                            .masterName
                            .toString(),
                        value: controller.socialbio.value,
                        image: ""));
                  }
                  photoUploadController.getbodyimages();
                  await mutation.save_option(variables.formIds);

                  Get.toNamed(Routes.PHOTO_UPLOAD);
                }
              }),
      ]).p(20).box.color(themeGradientColorStart).make();
    }), body: Obx(() {
      return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: scaffoldGradient,
          child: controller.screen.value == true
              ? SingleChildScrollView(child: BuildPersona())
              : SingleChildScrollView(child: BuildPersona())
          // child: controller.currentPage.value == 0
          //     ? SingleChildScrollView(child: BuildPersona())
          //     : controller.currentPage.value == 1
          //         ? BuildOutfit()
          //         : controller.currentPage.value == 2
          //             ? BuildOutfitPersonality()
          //             : controller.currentPage.value == 3
          //                 ? BuildPersona()
          //                 : controller.currentPage.value == 4
          //                     ? BuildVeinColor()
          //                     : controller.currentPage.value == 5
          //                         ? BuildHairColor()
          //                         : controller.currentPage.value == 6
          //                             ? BuildBodyType()
          //                             : controller.currentPage.value == 7
          //                                 ? BuildFaceShape()
          //                                 : controller.currentPage.value == 8
          //                                     ? BuildHairGrowth()
          //                                     : controller.currentPage.value ==
          //                                             9
          //                                         ? BuildHairType()
          //                                         : controller.currentPage
          //                                                     .value ==
          //                                                 10
          //                                             ? BuildHairLength()
          //                                             : controller.currentPage
          //                                                         .value ==
          //                                                     11
          //                                                 ? BuildBeardType()
          //                                                 : controller.currentPage
          //                                                             .value ==
          //                                                         12
          //                                                     ? BuildFacialHairPreference()
          //                                                     : controller.currentPage
          //                                                                 .value ==
          //                                                             13
          //                                                         ? BuildSkinType()
          //                                                         : controller.currentPage
          //                                                                     .value ==
          //                                                                 14
          //                                                             ? BuildShoeStyles()
          //                                                             : controller.currentPage.value ==
          //                                                                     15
          //                                                                 ? BuildEyeWear()
          //                                                                 : controller.currentPage.value == 16
          //                                                                     ? BuildWatchStyle()
          //                                                                     : controller.currentPage.value == 17
          //                                                                         ? BuildBudgetType()
          //                                                                         : BuildDressCode()
          );
    }));
  }
}
