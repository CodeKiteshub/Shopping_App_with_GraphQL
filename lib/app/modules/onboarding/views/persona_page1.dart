import 'dart:io';
import 'dart:math';
import 'dart:developer' as dev;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/Picker.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_s3/simple_s3.dart';
import 'package:styleclub/app/core/resources/app_resources.dart';
import 'package:styleclub/app/core/widgets/app_widgets.dart';
import 'package:styleclub/gen/assets.gen.dart';
import 'package:styleclub/gen/fonts.gen.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:styleclub/app/services/variables.dart';
import '../../../services/models/selectionmodel.dart';
import '../../photo_upload/views/credentials.dart';
import '../controllers/onboarding_controller.dart';
import 'package:direct_select/direct_select.dart';
import 'package:styleclub/app/services/queryMutation.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

ApiClients mutation = ApiClients();

class BuildPersona extends StatefulWidget {
  BuildPersona({Key? key}) : super(key: key);

  @override
  State<BuildPersona> createState() => _BuildPersonaState();
}

class _BuildPersonaState extends State<BuildPersona> {
  final OnboardingController controller = Get.find();
  TextEditingController textcontroller = TextEditingController();
  String? image;
  int selectedIndex2 = 0;
  int selected3 = 0;

  SimpleS3 _simpleS3 = SimpleS3();

  List<RxInt> selected = [
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    200.obs,
    200.obs,
    200.obs,
    200.obs
  ];
  List<List<String>> selected2 = [
    ["0", "0", "0", "0", "0", "0", "0", "0", "0", "0"],
    ["0", "0", "0", "0", "0", "0", "0", "0", "0", "0"],
    ["0", "0", "0", "0", "0", "0", "0", "0", "0", "0"],
    ["0", "0", "0", "0", "0", "0", "0", "0", "0", "0"],
    ["0", "0", "0", "0", "0", "0", "0", "0", "0", "0"],
    ["0", "0", "0", "0", "0", "0", "0", "0", "0", "0"],
    ["0", "0", "0", "0", "0", "0", "0", "0", "0", "0"],
    ["0", "0", "0", "0", "0", "0", "0", "0", "0", "0"],
    ["0", "0", "0", "0", "0", "0", "0", "0", "0", "0"],
    ["0", "0", "0", "0", "0", "0", "0", "0", "0", "0"],
  ];
  List<List<String>> selection = [
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
  ];

  List<List<String>> images = [
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
  ];
  List<Widget> _buildItems2(int index) {
    var elements2 = [];

    for (int i = 0;
        i <
            variables
                .form
                .getPersonalizeForm!
                .screens![controller.counter.toInt()]
                .questions![index]
                .question!
                .optionsData!
                .length;
        i++) {
      elements2.add(variables
          .form
          .getPersonalizeForm!
          .screens![controller.counter.toInt()]
          .questions![index]
          .question!
          .optionsData![i]
          .name);
    }
    return elements2
        .map((val) => MySelectionItem(
              title: val,
            ))
        .toList();
  }

  counter() {
    int i = 0;
    int j = 0;
    final value = variables.form.getPersonalizeForm!
        .screens![controller.counter.toInt()].questions!.length.obs;

    ever(controller.counter, (callback) {
      
        controller.indexselection.value.clear();
    

        controller.answerCollection.value.clear();
        controller.indexselection2.value.clear();
   
      print(
          "Questions ... ${variables.form.getPersonalizeForm!.screens![controller.counter.toInt().toInt()].questions!.length}");
      for (i = 0;
          i <
              variables
                  .form
                  .getPersonalizeForm!
                  .screens![controller.counter.toInt().toInt()]
                  .questions!
                  .length;
          i++) {
        selection[i].clear();
        for (j = 0;
            j <
                variables
                    .form
                    .getPersonalizeForm!
                    .screens![controller.counter.toInt().toInt()]
                    .questions![i]
                    .question!
                    .value!
                    .length;
            j++) {
          print("127127127127127127" +
              variables
                  .form
                  .getPersonalizeForm!
                  .screens![controller.counter.toInt().toInt()]
                  .questions![i]
                  .question!
                  .value![j]!);
          selected2[i][j] = variables
              .form
              .getPersonalizeForm!
              .screens![controller.counter.toInt().toInt()]
              .questions![i]
              .question!
              .value![j];

          if (variables
                  .form
                  .getPersonalizeForm!
                  .screens![controller.counter.toInt()]
                  .questions![i]
                  .question!
                  .optionTypeId ==
              '60546863e0646e2994cfb7bf') {
            var n = variables
                .form
                .getPersonalizeForm!
                .screens![controller.counter.toInt()]
                .questions![i]
                .question!
                .optionsData!
                .indexWhere((element) =>
                    element.sId.toString() ==
                    variables
                        .form
                        .getPersonalizeForm!
                        .screens![controller.counter.toInt()]
                        .questions![i]
                        .question!
                        .value![j]);
            selection[i].add(variables
                .form
                .getPersonalizeForm!
                .screens![controller.counter.toInt()]
                .questions![i]
                .question!
                .optionsData![n]
                .sId
                .toString());

            controller.indexselection.value.add(n);

            controller.answerCollection.value.add(SelectionModel(
                catId: variables
                    .form
                    .getPersonalizeForm!
                    .screens![controller.counter.toInt()]
                    .questions![i]
                    .question!
                    .catId,
                mastername: variables
                    .form
                    .getPersonalizeForm!
                    .screens![controller.counter.toInt()]
                    .questions![i]
                    .question!
                    .masterName
                    .toString(),
                value: variables
                    .form
                    .getPersonalizeForm!
                    .screens![controller.counter.toInt()]
                    .questions![i]
                    .question!
                    .optionsData![n]
                    .sId
                    .toString(),
                image: variables
                    .form
                    .getPersonalizeForm!
                    .screens![controller.counter.toInt()]
                    .questions![i]
                    .question!
                    .optionsData![n]
                    .image
                    .toString()));

            print("selection" + selection[i].toString());

            print("selection" + selection[i].length.toString());
            print('A index' + n.toString());
          } else if (variables
                  .form
                  .getPersonalizeForm!
                  .screens![controller.counter.toInt()]
                  .questions![i]
                  .question!
                  .optionTypeId ==
              '60546863e0646e2994cfb7c0') {
            var n = variables
                .form
                .getPersonalizeForm!
                .screens![controller.counter.toInt()]
                .questions![i]
                .question!
                .options!
                .indexOf(variables
                    .form
                    .getPersonalizeForm!
                    .screens![controller.counter.toInt()]
                    .questions![i]
                    .question!
                    .value![j]);
            controller.indexselection2.value.add(n);
            controller.answerCollection.value.add(SelectionModel(
                catId: variables
                    .form
                    .getPersonalizeForm!
                    .screens![controller.counter.toInt()]
                    .questions![i]
                    .question!
                    .catId,
                mastername: variables
                    .form
                    .getPersonalizeForm!
                    .screens![controller.counter.toInt()]
                    .questions![i]
                    .question!
                    .masterName
                    .toString(),
                value: variables
                    .form
                    .getPersonalizeForm!
                    .screens![controller.counter.toInt()]
                    .questions![i]
                    .question!
                    .optionsData![n]
                    .sId
                    .toString(),
                image: variables
                    .form
                    .getPersonalizeForm!
                    .screens![controller.counter.toInt()]
                    .questions![i]
                    .question!
                    .optionsData![n]
                    .image
                    .toString()));

            selection[i].add(variables
                .form
                .getPersonalizeForm!
                .screens![controller.counter.toInt()]
                .questions![i]
                .question!
                .optionsData![n]
                .sId
                .toString());

            print("selection" + selection[i].toString());

            print('B index' + n.toString());
          } else if (variables
                  .form
                  .getPersonalizeForm!
                  .screens![controller.counter.toInt()]
                  .questions![i]
                  .question!
                  .optionTypeId ==
              '60546863e0646e2994cfb7c1') {
            var n = variables
                .form
                .getPersonalizeForm!
                .screens![controller.counter.toInt()]
                .questions![i]
                .question!
                .options!
                .indexOf(variables
                    .form
                    .getPersonalizeForm!
                    .screens![controller.counter.toInt()]
                    .questions![i]
                    .question!
                    .value![j]);
            setState(() {
              selected[i].value = n;
            });
            controller.answerCollection.value.add(SelectionModel(
                mastername: variables
                    .form
                    .getPersonalizeForm!
                    .screens![controller.counter.toInt()]
                    .questions![i]
                    .question!
                    .masterName
                    .toString(),
                value: variables
                    .form
                    .getPersonalizeForm!
                    .screens![controller.counter.toInt()]
                    .questions![i]
                    .question!
                    .optionsData![n]
                    .sId
                    .toString(),
                image: variables
                    .form
                    .getPersonalizeForm!
                    .screens![controller.counter.toInt()]
                    .questions![i]
                    .question!
                    .optionsData![n]
                    .image
                    .toString()));

            selection[i].add(variables
                .form
                .getPersonalizeForm!
                .screens![controller.counter.toInt()]
                .questions![i]
                .question!
                .optionsData![n]
                .sId
                .toString());

            print("selection" + selection[i].toString());
          } else if (variables
                  .form
                  .getPersonalizeForm!
                  .screens![controller.counter.toInt()]
                  .questions![i]
                  .question!
                  .optionTypeId ==
              '60546863e0646e2994cfb7c2') {
            var n = variables
                .form
                .getPersonalizeForm!
                .screens![controller.counter.toInt()]
                .questions![i]
                .question!
                .options!
                .indexOf(variables
                    .form
                    .getPersonalizeForm!
                    .screens![controller.counter.toInt()]
                    .questions![i]
                    .question!
                    .value![j]);
            setState(() {
              selected[i].value = n;
            });
            controller.answerCollection.value.add(SelectionModel(
                mastername: variables
                    .form
                    .getPersonalizeForm!
                    .screens![controller.counter.toInt()]
                    .questions![i]
                    .question!
                    .masterName
                    .toString(),
                value: variables
                    .form
                    .getPersonalizeForm!
                    .screens![controller.counter.toInt()]
                    .questions![i]
                    .question!
                    .optionsData![n]
                    .sId
                    .toString(),
                image: variables
                    .form
                    .getPersonalizeForm!
                    .screens![controller.counter.toInt()]
                    .questions![i]
                    .question!
                    .optionsData![n]
                    .image
                    .toString()));

            selection[i].add(variables
                .form
                .getPersonalizeForm!
                .screens![controller.counter.toInt()]
                .questions![i]
                .question!
                .optionsData![n]
                .sId
                .toString());

            print("selection" + selection[i].toString());
          }
        }

        print("1421421421142142" + selected2[i].toString());
      }
    });
    return value.toInt();
  }

  var selectedindex = 0.obs;
  var selectedindexa = 0.obs;
  var selectedindexb = 0.obs;
  var selectedindexc = 0.obs;
  var selectedindexd = 0.obs;
  var selectedindexe = 0.obs;
  int i = 0;
  @override
  void initState() {
    selection[0].clear();
    controller.indexselection.value.clear();
    controller.answerCollection.value.clear();

    print("*init" +
        variables.form.getPersonalizeForm!.screens![controller.counter.toInt()]
            .questions![0].question!.value
            .toString());
    if (variables.form.getPersonalizeForm!.screens![controller.counter.toInt()]
            .questions![0].question!.value !=
        null) {
      for (int n = 0;
          n <
              variables
                  .form
                  .getPersonalizeForm!
                  .screens![controller.counter.toInt()]
                  .questions![0]
                  .question!
                  .options!
                  .length;
          n++) {
        if (variables.form.getPersonalizeForm!
            .screens![controller.counter.toInt()].questions![0].question!.value!
            .contains(variables
                .form
                .getPersonalizeForm!
                .screens![controller.counter.toInt()]
                .questions![0]
                .question!
                .optionsData![n]
                .sId)) {
          if (selection[0].contains(variables
              .form
              .getPersonalizeForm!
              .screens![controller.counter.toInt()]
              .questions![0]
              .question!
              .optionsData![n]
              .sId)) {
          } else {
            setState(() {
              print("index $n");

              selection[0].add(variables
                  .form
                  .getPersonalizeForm!
                  .screens![controller.counter.toInt()]
                  .questions![0]
                  .question!
                  .optionsData![n]
                  .sId
                  .toString());
              controller.indexselection.value.add(n);

              controller.answerCollection.value.add(SelectionModel(
                  mastername: variables
                      .form
                      .getPersonalizeForm!
                      .screens![controller.counter.toInt()]
                      .questions![0]
                      .question!
                      .masterName
                      .toString(),
                  value: variables
                      .form
                      .getPersonalizeForm!
                      .screens![controller.counter.toInt()]
                      .questions![0]
                      .question!
                      .optionsData![n]
                      .sId
                      .toString(),
                  image: variables
                      .form
                      .getPersonalizeForm!
                      .screens![controller.counter.toInt()]
                      .questions![0]
                      .question!
                      .optionsData![n]
                      .image
                      .toString()));
            });
          }
        }
        print("selection" + selection[0].toString());
        print(controller.indexselection.value);
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(i);
    print("build" + selected.toString());

    return SingleChildScrollView(
      child: Container(
        child: ListView.builder(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: counter(),
            itemBuilder: (BuildContext context, int index) {
              i++;
              print(i);

              if (variables
                      .form
                      .getPersonalizeForm!
                      .screens![controller.counter.toInt()]
                      .questions![index]
                      .question!
                      .masterName ==
                  "introduction_social") {
                textcontroller.text = variables
                            .form
                            .getPersonalizeForm!
                            .screens![controller.counter.toInt()]
                            .questions![index]
                            .question!
                            .value!
                            .length ==
                        0
                    ? ""
                    : variables
                        .form
                        .getPersonalizeForm!
                        .screens![controller.counter.toInt()]
                        .questions![index]
                        .question!
                        .value![0]
                        .toString();
              }

              return SingleChildScrollView(
                child: Column(
                  children: [
                    // buildOnboadingTitle(
                    //     "${variables.form.getPersonalizeForm!.screens![controller.counter.toInt()].questions![index].question!.infoHelpText.toString()}"),
                    Row(
                      children: [
                        Text("${variables.form.getPersonalizeForm!.screens![controller.counter.toInt()].questions![index].question!.input.toString()}")
                            .text
                            .size(32)
                            .fontFamily('ave_black')
                            .fontWeight(FontWeight.w800)
                            .white
                            .bold
                            .make()
                            .expand(),
                        const Icon(
                          Icons.info_outline,
                          color: goldenColorEnd,
                        ).onTap(() {
                          showdialog(
                              '${variables.form.getPersonalizeForm!.screens![controller.counter.toInt()].questions![index].question!.infoHelpText!.toString()}');
                        })
                      ],
                    ).marginOnly(left: 10, top: 50, right: 10),

                    15.heightBox,
                    variables
                                .form
                                .getPersonalizeForm!
                                .screens![controller.counter.toInt()]
                                .questions![index]
                                .question!
                                .optionTypeId ==
                            '60546863e0646e2994cfb7c1'
                        ? Container(
                            child: Column(
                              children: [
                                //                            "Pick Height".text.make().onInkTap(() {
                                // showPickerNumber(context);
                                //})
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.height *
                                          0.05,
                                      right:
                                          MediaQuery.of(context).size.height *
                                              0.05),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 1,
                                    height: MediaQuery.of(context).size.height *
                                        0.07,
                                    child: Obx(
                                      (() => DirectSelect(
                                          mode: DirectSelectMode.tap,
                                          backgroundColor: Color.fromARGB(
                                              255, 117, 133, 150),
                                          itemExtent: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.053,
                                          selectedIndex: variables
                                                      .form
                                                      .getPersonalizeForm!
                                                      .screens![controller
                                                          .counter
                                                          .toInt()]
                                                      .questions![index]
                                                      .question!
                                                      .masterName ==
                                                  "master_height"
                                              ? selected[0].value
                                              : selected[2].value,
                                          child:
                                              "${variables.form.getPersonalizeForm!.screens![controller.counter.toInt()].questions![index].question!.optionsData![selected[index].value].name!.toString()}"
                                                  .text
                                                  .white
                                                  .bold
                                                  .center
                                                  .size(22)
                                                  .fontFamily('ave_black')
                                                  .fontWeight(FontWeight.w800)
                                                  .make()
                                                  .paddingAll(10)
                                                  .box
                                                  .rounded
                                                  .hexColor("#273A4F")
                                                  .make(),
                                          onSelectedItemChanged: (index1) {
                                            print("111111");

                                            print("...." +
                                                variables
                                                    .form
                                                    .getPersonalizeForm!
                                                    .screens![controller.counter
                                                        .toInt()]
                                                    .questions![index]
                                                    .question!
                                                    .optionsData![index1!]
                                                    .sId
                                                    .toString());

                                            setState(() {
                                              if (selection[index].isNotEmpty) {
                                                selection[index].clear();
                                                if (index == 0) {
                                                  controller
                                                      .answerCollection.value
                                                      .removeWhere((element) =>
                                                          element.mastername ==
                                                          "master_height");
                                                } else {
                                                  controller
                                                      .answerCollection.value
                                                      .removeWhere((element) =>
                                                          element.mastername ==
                                                          "master_age");
                                                }
                                                print("true");
                                                selected[index].value = index1!;
                                                selection[index].add(variables
                                                    .form
                                                    .getPersonalizeForm!
                                                    .screens![controller.counter
                                                        .toInt()]
                                                    .questions![index]
                                                    .question!
                                                    .optionsData![index1]
                                                    .sId
                                                    .toString());
                                                controller.answerCollection.value
                                                    .add(SelectionModel(
                                                        mastername: variables
                                                            .form
                                                            .getPersonalizeForm!
                                                            .screens![controller.counter
                                                                .toInt()]
                                                            .questions![index]
                                                            .question!
                                                            .masterName
                                                            .toString(),
                                                        value: variables
                                                            .form
                                                            .getPersonalizeForm!
                                                            .screens![controller
                                                                .counter
                                                                .toInt()]
                                                            .questions![index]
                                                            .question!
                                                            .optionsData![
                                                                index1]
                                                            .sId
                                                            .toString(),
                                                        image: variables
                                                            .form
                                                            .getPersonalizeForm!
                                                            .screens![controller.counter.toInt()]
                                                            .questions![index]
                                                            .question!
                                                            .optionsData![index1]
                                                            .image
                                                            .toString()));
                                                print("....." +
                                                    controller.answerCollection
                                                        .value.length
                                                        .toString());
                                              } else {
                                                print("false");
                                                selected[index].value = index1!;
                                                selection[index].add(variables
                                                    .form
                                                    .getPersonalizeForm!
                                                    .screens![controller.counter
                                                        .toInt()]
                                                    .questions![index]
                                                    .question!
                                                    .optionsData![index1]
                                                    .sId
                                                    .toString());
                                                controller.answerCollection.value
                                                    .add(SelectionModel(
                                                        mastername: variables
                                                            .form
                                                            .getPersonalizeForm!
                                                            .screens![controller.counter
                                                                .toInt()]
                                                            .questions![index]
                                                            .question!
                                                            .masterName
                                                            .toString(),
                                                        value: variables
                                                            .form
                                                            .getPersonalizeForm!
                                                            .screens![controller
                                                                .counter
                                                                .toInt()]
                                                            .questions![index]
                                                            .question!
                                                            .optionsData![
                                                                index1]
                                                            .sId
                                                            .toString(),
                                                        image: variables
                                                            .form
                                                            .getPersonalizeForm!
                                                            .screens![controller.counter.toInt()]
                                                            .questions![index]
                                                            .question!
                                                            .optionsData![index1]
                                                            .image
                                                            .toString()));
                                                print("....." +
                                                    controller.answerCollection
                                                        .value.length
                                                        .toString());

                                                // controller.tabselection.value =
                                                //     variables
                                                //         .form
                                                //         .getPersonalizeForm!
                                                //         .screens![controller
                                                //             .counter
                                                //             .toInt()]
                                                //         .questions![index]
                                                //         .question!
                                                //         .masterName
                                                //         .toString();
                                              }
                                              variables.formIds = variables
                                                  .form
                                                  .getPersonalizeForm!
                                                  .screens![controller.counter
                                                      .toInt()]
                                                  .questions![index]
                                                  .questionId
                                                  .toString();
                                            });
                                          },
                                          items: _buildItems2(index))),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        : variables
                                    .form
                                    .getPersonalizeForm!
                                    .screens![controller.counter.toInt()]
                                    .questions![index]
                                    .question!
                                    .optionTypeId ==
                                '60546863e0646e2994cfb7bf'
                            ? Container(
                                child: GridView.builder(
                                  physics: ClampingScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: variables
                                      .form
                                      .getPersonalizeForm!
                                      .screens![controller.counter.toInt()]
                                      .questions![index]
                                      .question!
                                      .options!
                                      .length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 2.0,
                                          mainAxisSpacing: 2.0),
                                  itemBuilder:
                                      (BuildContext context, int index1) {
                                    print("value.." +
                                        variables
                                            .form
                                            .getPersonalizeForm!
                                            .screens![
                                                controller.counter.toInt()]
                                            .questions![index]
                                            .question!
                                            .value
                                            .toString());

                                    return Container(
                                      child: BuildImageGridOption(
                                              title:
                                                  '${variables.form.getPersonalizeForm!.screens![controller.counter.toInt()].questions![index].question!.optionsData![index1].name}',
                                              image:
                                                  '${variables.form.getPersonalizeForm!.screens![controller.counter.toInt()].questions![index].question!.optionsData![index1].image}')
                                          .p(2)
                                          .box
                                          .white
                                          .border(
                                              // variables.form.getPersonalizeForm!.screens![controller.counter.toInt()].questions![index].question.value
                                              color: variables
                                                          .form
                                                          .getPersonalizeForm!
                                                          .screens![controller
                                                              .counter
                                                              .toInt()]
                                                          .questions![index]
                                                          .question!
                                                          .value ==
                                                      null
                                                  ? Colors.transparent
                                                  : selection[index].contains(
                                                          variables
                                                              .form
                                                              .getPersonalizeForm!
                                                              .screens![
                                                                  controller
                                                                      .counter
                                                                      .toInt()]
                                                              .questions![index]
                                                              .question!
                                                              .optionsData![
                                                                  index1]
                                                              .sId)
                                                      ? controller1
                                                          .selectedColor
                                                      : Colors.transparent,
                                              width: 2)
                                          .roundedSM
                                          .margin(const EdgeInsets.all(15))
                                          .make()
                                          .onInkTap(() {
                                        setState(() {
                                          if (variables
                                                  .form
                                                  .getPersonalizeForm!
                                                  .screens![controller.counter
                                                      .toInt()]
                                                  .questions![index]
                                                  .question!
                                                  .isMultipleChoice ==
                                              true) {
                                            if (selection[index].contains(
                                                variables
                                                    .form
                                                    .getPersonalizeForm!
                                                    .screens![controller.counter
                                                        .toInt()]
                                                    .questions![index]
                                                    .question!
                                                    .optionsData![index1]
                                                    .sId)) {
                                              print("true");
                                              selection[index].remove(variables
                                                  .form
                                                  .getPersonalizeForm!
                                                  .screens![controller.counter
                                                      .toInt()]
                                                  .questions![index]
                                                  .question!
                                                  .optionsData![index1]
                                                  .sId
                                                  .toString());

                                              controller.answerCollection.value
                                                  .removeWhere((element) =>
                                                      element.value ==
                                                      variables
                                                          .form
                                                          .getPersonalizeForm!
                                                          .screens![controller
                                                              .counter
                                                              .toInt()]
                                                          .questions![index]
                                                          .question!
                                                          .optionsData![index1!]
                                                          .sId);
                                              print("....." +
                                                  controller.answerCollection
                                                      .value.length
                                                      .toString());
                                              controller.indexselection.value
                                                  .remove(index1);
                                            } else {
                                              print("false");
                                              selection[index].add(variables
                                                  .form
                                                  .getPersonalizeForm!
                                                  .screens![controller.counter
                                                      .toInt()]
                                                  .questions![index]
                                                  .question!
                                                  .optionsData![index1]
                                                  .sId
                                                  .toString());

                                              controller.answerCollection.value
                                                  .add(SelectionModel(
                                                      catId: variables
                                                          .form
                                                          .getPersonalizeForm!
                                                          .screens![controller.counter
                                                              .toInt()]
                                                          .questions![index]
                                                          .question!
                                                          .catId,
                                                      mastername:
                                                          variables.form.getPersonalizeForm!.screens![controller.counter.toInt()].questions![index].question!.masterName
                                                              .toString(),
                                                      value: variables
                                                          .form
                                                          .getPersonalizeForm!
                                                          .screens![controller.counter
                                                              .toInt()]
                                                          .questions![index]
                                                          .question!
                                                          .optionsData![index1]
                                                          .sId
                                                          .toString(),
                                                      image: variables
                                                          .form
                                                          .getPersonalizeForm!
                                                          .screens![controller.counter.toInt()]
                                                          .questions![index]
                                                          .question!
                                                          .optionsData![index1]
                                                          .image
                                                          .toString()));
                                              print("....." +
                                                  controller.answerCollection
                                                      .value.length
                                                      .toString());
                                              controller.indexselection.value
                                                  .add(index1);
                                            }
                                          } else {
                                            if (selection[index].length == 0) {
                                              selection[index].add(variables
                                                  .form
                                                  .getPersonalizeForm!
                                                  .screens![controller.counter
                                                      .toInt()]
                                                  .questions![index]
                                                  .question!
                                                  .optionsData![index1]
                                                  .sId
                                                  .toString());

                                              controller.answerCollection.value
                                                  .add(SelectionModel(
                                                      catId: variables
                                                          .form
                                                          .getPersonalizeForm!
                                                          .screens![controller.counter
                                                              .toInt()]
                                                          .questions![index]
                                                          .question!
                                                          .catId,
                                                      mastername:
                                                          variables.form.getPersonalizeForm!.screens![controller.counter.toInt()].questions![index].question!.masterName
                                                              .toString(),
                                                      value: variables
                                                          .form
                                                          .getPersonalizeForm!
                                                          .screens![controller.counter
                                                              .toInt()]
                                                          .questions![index]
                                                          .question!
                                                          .optionsData![index1]
                                                          .sId
                                                          .toString(),
                                                      image: variables
                                                          .form
                                                          .getPersonalizeForm!
                                                          .screens![controller.counter.toInt()]
                                                          .questions![index]
                                                          .question!
                                                          .optionsData![index1]
                                                          .image
                                                          .toString()));
                                              print("....." +
                                                  controller.answerCollection
                                                      .value.length
                                                      .toString());
                                              controller.indexselection.value
                                                  .add(index1);
                                            } else {
                                              if (selection[index].contains(
                                                  variables
                                                      .form
                                                      .getPersonalizeForm!
                                                      .screens![controller
                                                          .counter
                                                          .toInt()]
                                                      .questions![index]
                                                      .question!
                                                      .optionsData![index1]
                                                      .sId)) {
                                                controller.indexselection.value
                                                    .clear();
                                                controller
                                                    .answerCollection.value
                                                    .clear();
                                                selection[index].clear();
                                              } else {
                                                controller.indexselection.value
                                                    .clear();
                                                controller
                                                    .answerCollection.value
                                                    .clear();
                                                selection[index].clear();

                                                selection[index].add(variables
                                                    .form
                                                    .getPersonalizeForm!
                                                    .screens![controller.counter
                                                        .toInt()]
                                                    .questions![index]
                                                    .question!
                                                    .optionsData![index1]
                                                    .sId
                                                    .toString());

                                                controller.answerCollection.value.add(SelectionModel(
                                                    catId: variables
                                                        .form
                                                        .getPersonalizeForm!
                                                        .screens![controller
                                                            .counter
                                                            .toInt()]
                                                        .questions![index]
                                                        .question!
                                                        .catId,
                                                    mastername:
                                                        variables.form.getPersonalizeForm!.screens![controller.counter.toInt()].questions![index].question!.masterName
                                                            .toString(),
                                                    value: variables
                                                        .form
                                                        .getPersonalizeForm!
                                                        .screens![controller
                                                            .counter
                                                            .toInt()]
                                                        .questions![index]
                                                        .question!
                                                        .optionsData![index1]
                                                        .sId
                                                        .toString(),
                                                    image: variables
                                                        .form
                                                        .getPersonalizeForm!
                                                        .screens![controller.counter.toInt()]
                                                        .questions![index]
                                                        .question!
                                                        .optionsData![index1]
                                                        .image
                                                        .toString()));
                                                print("....." +
                                                    controller.answerCollection
                                                        .value.length
                                                        .toString());
                                                controller.indexselection.value
                                                    .add(index1);
                                              }
                                            }
                                          }

                                          // selected[index].value = index1;
                                          images[index].add(variables
                                              .form
                                              .getPersonalizeForm!
                                              .screens![
                                                  controller.counter.toInt()]
                                              .questions![index]
                                              .question!
                                              .optionsData![index1]
                                              .image
                                              .toString());
                                          print(
                                              controller.indexselection.value);

                                          print("++++++++++");

                                          print(
                                            selection[index]
                                                .toString()
                                                .replaceAll('[', '')
                                                .replaceAll(']', ''),
                                          );

                                          variables.formIds = variables
                                              .form
                                              .getPersonalizeForm!
                                              .screens![
                                                  controller.counter.toInt()]
                                              .questions![index]
                                              .questionId
                                              .toString();

                                          //  print(selected[index].value);
                                        });
                                      }),
                                    );
                                  },
                                ),
                              )
                            : variables
                                        .form
                                        .getPersonalizeForm!
                                        .screens![controller.counter.toInt()]
                                        .questions![index]
                                        .question!
                                        .optionTypeId ==
                                    '60546863e0646e2994cfb7c0'
                                ? Container(
                                    child: GridView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: variables
                                            .form
                                            .getPersonalizeForm!
                                            .screens![
                                                controller.counter.toInt()]
                                            .questions![index]
                                            .question!
                                            .options!
                                            .length,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                childAspectRatio: (1 / .30),
                                                crossAxisCount: 2,
                                                crossAxisSpacing: 4.0,
                                                mainAxisSpacing: 4.0),
                                        itemBuilder:
                                            (BuildContext context, int index1) {
                                          return Container(
                                                  child: controller.buildOption(
                                                      '${variables.form.getPersonalizeForm!.screens![controller.counter.toInt()].questions![index].question!.optionsData![index1].name}'))
                                              .box
                                              .border(
                                                  color: variables
                                                              .form
                                                              .getPersonalizeForm!
                                                              .screens![
                                                                  controller
                                                                      .counter
                                                                      .toInt()]
                                                              .questions![index]
                                                              .question!
                                                              .value ==
                                                          null
                                                      ? Colors.transparent
                                                      : selection[index].contains(variables
                                                              .form
                                                              .getPersonalizeForm!
                                                              .screens![
                                                                  controller
                                                                      .counter
                                                                      .toInt()]
                                                              .questions![index]
                                                              .question!
                                                              .options![index1])
                                                          ? controller1
                                                              .selectedColor
                                                          : Colors.transparent,
                                                  width: 3)
                                              .rounded
                                              .make()
                                              .onInkTap(() {
                                            setState(() {
                                              if (variables
                                                      .form
                                                      .getPersonalizeForm!
                                                      .screens![controller
                                                          .counter
                                                          .toInt()]
                                                      .questions![index]
                                                      .question!
                                                      .isMultipleChoice ==
                                                  true) {
                                                if (selection[index].contains(
                                                    variables
                                                        .form
                                                        .getPersonalizeForm!
                                                        .screens![controller
                                                            .counter
                                                            .toInt()]
                                                        .questions![index]
                                                        .question!
                                                        .options![index1])) {
                                                  print("true");
                                                  selection[index].remove(
                                                      variables
                                                          .form
                                                          .getPersonalizeForm!
                                                          .screens![controller
                                                              .counter
                                                              .toInt()]
                                                          .questions![index]
                                                          .question!
                                                          .optionsData![index1]
                                                          .sId
                                                          .toString());

                                                  controller
                                                      .answerCollection.value
                                                      .removeWhere((element) =>
                                                          element.value ==
                                                          variables
                                                              .form
                                                              .getPersonalizeForm!
                                                              .screens![
                                                                  controller
                                                                      .counter
                                                                      .toInt()]
                                                              .questions![index]
                                                              .question!
                                                              .optionsData![
                                                                  index1!]
                                                              .sId);
                                                  print("....." +
                                                      controller
                                                          .answerCollection
                                                          .value
                                                          .length
                                                          .toString());
                                                  controller
                                                      .indexselection2.value
                                                      .remove(index1);
                                                } else {
                                                  print("false");
                                                  selection[index].add(variables
                                                      .form
                                                      .getPersonalizeForm!
                                                      .screens![controller
                                                          .counter
                                                          .toInt()]
                                                      .questions![index]
                                                      .question!
                                                      .optionsData![index1]
                                                      .sId
                                                      .toString());

                                                  controller.answerCollection.value.add(SelectionModel(
                                                      catId: variables
                                                          .form
                                                          .getPersonalizeForm!
                                                          .screens![controller
                                                              .counter
                                                              .toInt()]
                                                          .questions![index]
                                                          .question!
                                                          .catId,
                                                      mastername:
                                                          variables.form.getPersonalizeForm!.screens![controller.counter.toInt()].questions![index].question!.masterName
                                                              .toString(),
                                                      value: variables
                                                          .form
                                                          .getPersonalizeForm!
                                                          .screens![controller
                                                              .counter
                                                              .toInt()]
                                                          .questions![index]
                                                          .question!
                                                          .optionsData![index1]
                                                          .sId
                                                          .toString(),
                                                      image: variables
                                                          .form
                                                          .getPersonalizeForm!
                                                          .screens![controller.counter.toInt()]
                                                          .questions![index]
                                                          .question!
                                                          .optionsData![index1]
                                                          .image
                                                          .toString()));
                                                  print("....." +
                                                      controller
                                                          .answerCollection
                                                          .value
                                                          .length
                                                          .toString());
                                                  controller
                                                      .indexselection2.value
                                                      .add(index1);
                                                }
                                              } else {
                                                if (selection[index].length <
                                                    1) {
                                                  selection[index].add(variables
                                                      .form
                                                      .getPersonalizeForm!
                                                      .screens![controller
                                                          .counter
                                                          .toInt()]
                                                      .questions![index]
                                                      .question!
                                                      .optionsData![index1]
                                                      .sId
                                                      .toString());

                                                  controller.answerCollection.value.add(SelectionModel(
                                                      catId: variables
                                                          .form
                                                          .getPersonalizeForm!
                                                          .screens![controller
                                                              .counter
                                                              .toInt()]
                                                          .questions![index]
                                                          .question!
                                                          .catId,
                                                      mastername:
                                                          variables.form.getPersonalizeForm!.screens![controller.counter.toInt()].questions![index].question!.masterName
                                                              .toString(),
                                                      value: variables
                                                          .form
                                                          .getPersonalizeForm!
                                                          .screens![controller
                                                              .counter
                                                              .toInt()]
                                                          .questions![index]
                                                          .question!
                                                          .optionsData![index1]
                                                          .sId
                                                          .toString(),
                                                      image: variables
                                                          .form
                                                          .getPersonalizeForm!
                                                          .screens![controller.counter.toInt()]
                                                          .questions![index]
                                                          .question!
                                                          .optionsData![index1]
                                                          .image
                                                          .toString()));
                                                  print("....." +
                                                      controller
                                                          .answerCollection
                                                          .value
                                                          .length
                                                          .toString());
                                                  controller
                                                      .indexselection2.value
                                                      .add(index1);
                                                } else {
                                                  controller
                                                      .indexselection2.value
                                                      .clear();
                                                  controller
                                                      .answerCollection.value
                                                      .clear();
                                                  selection[index].clear();

                                                  selection[index].add(variables
                                                      .form
                                                      .getPersonalizeForm!
                                                      .screens![controller
                                                          .counter
                                                          .toInt()]
                                                      .questions![index]
                                                      .question!
                                                      .optionsData![index1]
                                                      .sId
                                                      .toString());

                                                  controller.answerCollection.value.add(SelectionModel(
                                                      catId: variables
                                                          .form
                                                          .getPersonalizeForm!
                                                          .screens![controller
                                                              .counter
                                                              .toInt()]
                                                          .questions![index]
                                                          .question!
                                                          .catId,
                                                      mastername:
                                                          variables.form.getPersonalizeForm!.screens![controller.counter.toInt()].questions![index].question!.masterName
                                                              .toString(),
                                                      value: variables
                                                          .form
                                                          .getPersonalizeForm!
                                                          .screens![controller
                                                              .counter
                                                              .toInt()]
                                                          .questions![index]
                                                          .question!
                                                          .optionsData![index1]
                                                          .sId
                                                          .toString(),
                                                      image: variables
                                                          .form
                                                          .getPersonalizeForm!
                                                          .screens![controller.counter.toInt()]
                                                          .questions![index]
                                                          .question!
                                                          .optionsData![index1]
                                                          .image
                                                          .toString()));
                                                  print("....." +
                                                      controller
                                                          .answerCollection
                                                          .value
                                                          .length
                                                          .toString());
                                                  controller
                                                      .indexselection2.value
                                                      .add(index1);
                                                }
                                              }
                                              // selected[index].value = index1;
                                              images[index].add(variables
                                                  .form
                                                  .getPersonalizeForm!
                                                  .screens![controller.counter
                                                      .toInt()]
                                                  .questions![index]
                                                  .question!
                                                  .optionsData![index1]
                                                  .image
                                                  .toString());

                                              print(selection[index]);
                                              print(selection.length);
                                              print("3333333333");

                                              variables.formIds = variables
                                                  .form
                                                  .getPersonalizeForm!
                                                  .screens![controller.counter
                                                      .toInt()]
                                                  .questions![index]
                                                  .questionId
                                                  .toString();
                                              selected[index].value = index1;
                                            });
                                          });
                                        }),
                                  )
                                : variables
                                            .form
                                            .getPersonalizeForm!
                                            .screens![
                                                controller.counter.toInt()]
                                            .questions![index]
                                            .question!
                                            .optionTypeId ==
                                        '60546863e0646e2994cfb7c2'
                                    ? Container(
                                        child: Column(
                                          children: [
                                            //                            "Pick Height".text.make().onInkTap(() {
                                            // showPickerNumber(context);
                                            //})
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.05,
                                                  right: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.05),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    1,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.07,
                                                child: Obx(
                                                  (() => DirectSelect(
                                                      mode: DirectSelectMode
                                                          .tap,
                                                      backgroundColor: Color
                                                          .fromARGB(255, 117,
                                                              133, 150),
                                                      itemExtent: MediaQuery
                                                                  .of(context)
                                                              .size
                                                              .height *
                                                          0.053,
                                                      selectedIndex: selected[
                                                              index]
                                                          .value,
                                                      child:
                                                          "${variables.form.getPersonalizeForm!.screens![controller.counter.toInt()].questions![index].question!.optionsData![selected[index].value].name!.toString()}"
                                                              .text
                                                              .white
                                                              .bold
                                                              .center
                                                              .size(22)
                                                              .fontFamily(
                                                                  'ave_black')
                                                              .fontWeight(
                                                                  FontWeight
                                                                      .w800)
                                                              .make()
                                                              .paddingAll(10)
                                                              .box
                                                              .rounded
                                                              .hexColor(
                                                                  "#273A4F")
                                                              .make(),
                                                      // child: MySelectionItem(
                                                      //   isForList: false,
                                                      //   title: variables
                                                      //       .form
                                                      //       .getPersonalizeForm!
                                                      //       .screens![controller
                                                      //           .counter
                                                      //           .toInt()]
                                                      //       .questions![index]
                                                      //       .question!
                                                      //       .optionsData![value
                                                      //           selectedIndex2]
                                                      //       .name!

                                                      //       .toString(),
                                                      // ),
                                                      onSelectedItemChanged:
                                                          (index1) {
                                                        setState(() {
                                                          if (selection[index]
                                                              .isNotEmpty) {
                                                            selection[index]
                                                                .clear();

                                                            controller
                                                                .answerCollection
                                                                .value
                                                                .removeWhere(
                                                                    (element) =>
                                                                        element
                                                                            .mastername ==
                                                                        "master_weight");
                                                            print("true");
                                                            selected[index]
                                                                    .value =
                                                                index1!;
                                                            selection[index].add(variables
                                                                .form
                                                                .getPersonalizeForm!
                                                                .screens![
                                                                    controller
                                                                        .counter
                                                                        .toInt()]
                                                                .questions![
                                                                    index]
                                                                .question!
                                                                .optionsData![
                                                                    index1]
                                                                .sId
                                                                .toString());
                                                            controller.answerCollection.value.add(SelectionModel(
                                                                mastername: variables.form.getPersonalizeForm!.screens![controller.counter.toInt()].questions![index].question!.masterName
                                                                    .toString(),
                                                                value: variables
                                                                    .form
                                                                    .getPersonalizeForm!
                                                                    .screens![controller
                                                                        .counter
                                                                        .toInt()]
                                                                    .questions![
                                                                        index]
                                                                    .question!
                                                                    .optionsData![
                                                                        index1]
                                                                    .sId
                                                                    .toString(),
                                                                image: variables
                                                                    .form
                                                                    .getPersonalizeForm!
                                                                    .screens![controller.counter.toInt()]
                                                                    .questions![index]
                                                                    .question!
                                                                    .optionsData![index1]
                                                                    .image
                                                                    .toString()));
                                                            print("....." +
                                                                controller
                                                                    .answerCollection
                                                                    .value
                                                                    .length
                                                                    .toString());
                                                          } else {
                                                            print("false");
                                                            selected[index]
                                                                    .value =
                                                                index1!;
                                                            selection[index].add(variables
                                                                .form
                                                                .getPersonalizeForm!
                                                                .screens![
                                                                    controller
                                                                        .counter
                                                                        .toInt()]
                                                                .questions![
                                                                    index]
                                                                .question!
                                                                .optionsData![
                                                                    index1]
                                                                .sId
                                                                .toString());
                                                            controller.answerCollection.value.add(SelectionModel(
                                                                mastername: variables.form.getPersonalizeForm!.screens![controller.counter.toInt()].questions![index].question!.masterName
                                                                    .toString(),
                                                                value: variables
                                                                    .form
                                                                    .getPersonalizeForm!
                                                                    .screens![controller
                                                                        .counter
                                                                        .toInt()]
                                                                    .questions![
                                                                        index]
                                                                    .question!
                                                                    .optionsData![
                                                                        index1]
                                                                    .sId
                                                                    .toString(),
                                                                image: variables
                                                                    .form
                                                                    .getPersonalizeForm!
                                                                    .screens![controller.counter.toInt()]
                                                                    .questions![index]
                                                                    .question!
                                                                    .optionsData![index1]
                                                                    .image
                                                                    .toString()));
                                                            print("....." +
                                                                controller
                                                                    .answerCollection
                                                                    .value
                                                                    .length
                                                                    .toString());

                                                            // controller.tabselection.value =
                                                            //     variables
                                                            //         .form
                                                            //         .getPersonalizeForm!
                                                            //         .screens![controller
                                                            //             .counter
                                                            //             .toInt()]
                                                            //         .questions![index]
                                                            //         .question!
                                                            //         .masterName
                                                            //         .toString();
                                                          }
                                                          variables.formIds = variables
                                                              .form
                                                              .getPersonalizeForm!
                                                              .screens![
                                                                  controller
                                                                      .counter
                                                                      .toInt()]
                                                              .questions![index]
                                                              .questionId
                                                              .toString();
                                                        });
                                                      },
                                                      items:
                                                          _buildItems2(index))),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    : variables
                                                .form
                                                .getPersonalizeForm!
                                                .screens![
                                                    controller.counter.toInt()]
                                                .questions![index]
                                                .question!
                                                .optionTypeId ==
                                            '608d388c2831161efcb9a6f5'
                                        ? buildPhotoUpload("Front")
                                        : variables
                                                    .form
                                                    .getPersonalizeForm!
                                                    .screens![controller.counter
                                                        .toInt()]
                                                    .questions![index]
                                                    .question!
                                                    .optionTypeId ==
                                                '60cd8b711ede7a3740f41780'
                                            ? controller.buildOption('social')
                                            : Column(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 20, right: 70),
                                                    child: SizedBox(
                                                      child: VxTextField(
                                                        onChanged: (value) {
                                                          print(value);
                                                          variables.formIds = variables
                                                              .form
                                                              .getPersonalizeForm!
                                                              .screens![
                                                                  controller
                                                                      .counter
                                                                      .toInt()]
                                                              .questions![index]
                                                              .questionId
                                                              .toString();
                                                          controller.socialbio
                                                              .value = value;

                                                          variables.formIds = variables
                                                              .form
                                                              .getPersonalizeForm!
                                                              .screens![
                                                                  controller
                                                                      .counter
                                                                      .toInt()]
                                                              .questions![index]
                                                              .questionId!;
                                                        },
                                                        hint:
                                                            'Please enter your reponse',
                                                        maxLine: 5,
                                                        controller:
                                                            textcontroller,
                                                        fillColor: Vx.white,
                                                        borderRadius: 10,
                                                        borderType:
                                                            VxTextFieldBorderType
                                                                .roundLine,
                                                        borderColor: Vx.white,
                                                      ),
                                                    ),
                                                  ),
                                                  5.heightBox,
                                                ],
                                              ),
                  ],
                ),
              );
            }),
      ),
    );
  }

  Widget buildOption1(String title) => title.text.white.bold.center
      .size(18)
      .fontFamily('ave_black')
      .fontWeight(FontWeight.w800)
      .make()
      .paddingAll(10)
      .box
      .rounded
      .hexColor("#273A4F")
      .make()
      .onTap(() {});

  Future<String?> _uploadback() async {
    String? result;

    if (result == null) {
      try {
        variables.formIds = variables.form.getPersonalizeForm!
            .screens![controller.counter.toInt()].questions![0].questionId
            .toString();
        result = image != null
            ? await _simpleS3.uploadFile(
                File(image!),
                Credentials.s3_bucketName,
                Credentials.s3_poolD,
                AWSRegions.apSouth1,
                debugLog: true,
                s3FolderPath: "test",
                accessControl: S3AccessControl.publicRead,
              )
            : null;
      } catch (e) {
        print(e);
      }
    }
    return result;
  }

  Widget buildPhotoUpload(String title) {
    if (variables.form.getPersonalizeForm!.screens![controller.counter.toInt()]
            .questions![0].question!.masterName ==
        "saveProfilePicture") {
      image = variables
                  .form
                  .getPersonalizeForm!
                  .screens![controller.counter.toInt()]
                  .questions![0]
                  .question!
                  .value!
                  .length ==
              0
          ? ""
          : variables
              .form
              .getPersonalizeForm!
              .screens![controller.counter.toInt()]
              .questions![0]
              .question!
              .value![0]
              .toString();
    }

    return Column(
      children: [
        InkWell(
            onTap: () async {
              setState(() async {
                final img =
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                image = img!.path;
                print(image);
              });
              final answer = await _uploadback();
              if (answer != null) {
                controller.answerCollection.value.add(SelectionModel(
                    mastername: "saveProfilePicture",
                    value: answer,
                    image: ""));
              }
            },
            child: image == null
                ? Image.network(
                    "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/upload.png",
                    width: 80,
                    height: 80,
                  )
                : variables
                            .form
                            .getPersonalizeForm!
                            .screens![controller.counter.toInt()]
                            .questions![0]
                            .question!
                            .value !=
                        null
                    ? Image.network(image!, width: 80, height: 80)
                    : Image.file(
                        File(image!),
                        width: 80,
                        height: 80,
                      )),
        10.heightBox,
        "Image".text.white.make().centered()
      ],
    );
  }

  showdialog(String info) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: Color.fromARGB(255, 117, 133, 150),
        title: Text('INFO',
            style: TextStyle(color: Colors.white, fontFamily: 'poppins')),
        content: Text(
          '$info',
          //'${variables.form.getPersonalizeForm!.screens![controller.counter.toInt()].questions![index].question!.infoHelpText!.toString()}',
          style: TextStyle(color: Colors.white, fontFamily: FontFamily.ave),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK',
                style: TextStyle(color: Colors.white, fontFamily: 'poppins')),
          ),
        ],
      ),
    );
  }

  showPickerNumber(BuildContext context) {
    return Picker(
            adapter: NumberPickerAdapter(data: [
              const NumberPickerColumn(
                  begin: 1,
                  end: 7,
                  postfix: Text("\$"),
                  suffix: Icon(Icons.insert_emoticon)),
              const NumberPickerColumn(begin: 1, end: 7, jump: -10),
            ]),
            delimiter: [
              PickerDelimiter(
                  child: Container(
                width: 30.0,
                alignment: Alignment.center,
                child: const Icon(Icons.more_vert),
              ))
            ],
            hideHeader: true,
            title: const Text("Select Choice"),
            selectedTextStyle: const TextStyle(color: Colors.blue),
            onConfirm: (Picker picker, List value) {})
        .showDialog(context);
  }
}

class MySelectionItem extends StatelessWidget {
  final String title;
  final bool isForList;

  const MySelectionItem({Key? key, required this.title, this.isForList = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.0,
      child: isForList
          ? Padding(
              child: _buildItem(context),
              padding: EdgeInsets.all(10.0),
            )
          : Card(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              child: Stack(
                children: <Widget>[
                  _buildItem(context),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.arrow_drop_down),
                  )
                ],
              ),
            ),
    );
  }

  _buildItem(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Text(
        title,
        selectionColor: Colors.white,
      ),
    );
  }
}
