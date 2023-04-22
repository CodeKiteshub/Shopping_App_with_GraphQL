// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:styleclub/app/core/widgets/app_widgets.dart';
// import 'package:styleclub/gen/assets.gen.dart';
// import 'package:velocity_x/velocity_x.dart';
// import 'package:styleclub/app/services/variables.dart';
// import '../controllers/onboarding_controller.dart';

// class ListDataX extends GetxController {
  
  

//   final OnboardingController controller = Get.find();
  
//    counter() {
//     final value = variables.form.getPersonalizeForm!.screens![controller.counter.toInt().toInt()]
//         .questions!.length.obs;
 
//   }
// }

// class Form_onboard extends StatelessWidget {
//   Form_onboard({Key? key}) : super(key: key);

//   ListDataX dx = Get.put(ListDataX());

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: Column(
//         children: [
//           ListView.builder(
//               itemCount: counter(),
//               itemBuilder: (BuildContext context, int index) {
//                 return SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       buildOnboadingTitle(
//                           variables.form.getPersonalizeForm!.screens![controller.counter.toInt().toInt()].questions![index].question!.infoHelpText==null?"${variables.form.getPersonalizeForm!.screens![controller.counter.toInt()].questions![index].question!.infoHelpText.toString()}":
//                           "${variables.form.getPersonalizeForm!.screens![controller.counter.toInt()].questions![index].question!.type.toString()}"),
//                       15.heightBox,
//                       variables
//                                   .form
//                                   .getPersonalizeForm!
//                                   .screens![controller.counter.toInt()]
//                                   .questions![index]
//                                   .question!
//                                   .optionTypeId ==
//                               '60546863e0646e2994cfb7c1'
//                           ? buildTextfield()
//                           : variables
//                                       .form
//                                       .getPersonalizeForm!
//                                       .screens![controller.counter.toInt()]
//                                       .questions![index]
//                                       .question!
//                                       .optionTypeId ==
//                                   '60546863e0646e2994cfb7bf'
//                               ? ListView.builder(
//                                   itemCount: variables
//                                       .form
//                                       .getPersonalizeForm!
//                                       .screens![controller.counter.toInt()]
//                                       .questions![index]
//                                       .question!
//                                       .options!
//                                       .length,
//                                   itemBuilder:
//                                       (BuildContext context, int index1) {
//                                     return BuildImageGridOption(
//                                         title:
//                                             '${variables.form.getPersonalizeForm!.screens![controller.counter.toInt()].questions![index].question!.optionsData![index1].name}',
//                                         image:
//                                             'variables.form.getPersonalizeForm!.screens![controller.counter.toInt()].questions![index].question!.optionsData![index1].image');
//                                   },
//                                 )
//                               : variables
//                                       .form
//                                       .getPersonalizeForm!
//                                       .screens![controller.counter.toInt()]
//                                       .questions![index]
//                                       .question!
//                                       .optionTypeId ==
//                                   '60546863e0646e2994cfb7c0'?
//                                   ListView.builder(itemCount:  variables
//                                       .form
//                                       .getPersonalizeForm!
//                                       .screens![controller.counter.toInt()]
//                                       .questions![index]
//                                       .question!
//                                       .options!
//                                       .length,
//                                       itemBuilder:(BuildContext context, int index1) {
//                                         return controller.buildOption('${variables.form.getPersonalizeForm!.screens![controller.counter.toInt()].questions![index].question!.optionsData![index1].name}');
//                                       }):
//                                       variables
//                                       .form
//                                       .getPersonalizeForm!
//                                       .screens![controller.counter.toInt()]
//                                       .questions![index]
//                                       .question!
//                                       .optionTypeId ==
//                                   '60546863e0646e2994cfb7c2'?
//                                   ListView.builder(itemCount:  variables
//                                       .form
//                                       .getPersonalizeForm!
//                                       .screens![controller.counter.toInt()]
//                                       .questions![index]
//                                       .question!
//                                       .options!
//                                       .length,
//                                       itemBuilder:(BuildContext context, int index1) {
//                                         return controller.buildOption('${variables.form.getPersonalizeForm!.screens![controller.counter.toInt()].questions![index].question!.optionsData![index1].name}');
//                                       }):
//                                        variables
//                                       .form
//                                       .getPersonalizeForm!
//                                       .screens![controller.counter.toInt()]
//                                       .questions![index]
//                                       .question!
//                                       .optionTypeId ==
//                                   '608d388c2831161efcb9a6f5'?
//                                   controller.buildOption('input image'):
//                                   variables
//                                       .form
//                                       .getPersonalizeForm!
//                                       .screens![controller.counter.toInt()]
//                                       .questions![index]
//                                       .question!
//                                       .optionTypeId ==
//                                   '60cd8b711ede7a3740f41780'?
//                                   controller.buildOption('social')
//                                   :controller
//     .buildOption('range_tags')
    
                                  
    
//                     ],
//                   ),
//                 );
//               }),
         
//         ],
//       ),
//     );
//   }
// }
