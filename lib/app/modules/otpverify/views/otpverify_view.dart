import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:styleclub/app/modules/otpverify/controllers/date_formatter.dart';
import 'package:styleclub/app/services/queryMutation.dart';
import 'package:get/get.dart';
import 'package:styleclub/app/services/variables.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:glassmorphism/glassmorphism.dart';
import '../../../../gen/assets.gen.dart';
import '../../../core/widgets/app_widgets.dart';
import '../../../routes/app_pages.dart';
import '../controllers/otpverify_controller.dart';
import 'dart:async';
import 'package:styleclub/app/services/queryQuery.dart' as q;
import 'package:styleclub/app/modules/elevate_page/views/elevate_page_view.dart';

q.ApiClients query = q.ApiClients();

ApiClients mutation = ApiClients();
TextEditingController digit1 = TextEditingController();
TextEditingController digit2 = TextEditingController();
TextEditingController digit3 = TextEditingController();
TextEditingController digit4 = TextEditingController();
TextEditingController digit5 = TextEditingController();
TextEditingController digit6 = TextEditingController();

class OtpverifyView extends GetView<OtpverifyController> {
  OtpverifyController otpverifyControl = Get.put(OtpverifyController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.network(
          "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/cover.png"
         ,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Center(
            child: GlassmorphicContainer(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.40,
          borderRadius: 20,
          blur: 7,
          alignment: Alignment.bottomCenter,
          border: 0,
          linearGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0x3effffff),
                Color(0xFFffffff).withAlpha(45),
              ],
              stops: [
                0.3,
                1,
              ]),
          borderGradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [
                Color(0xFF4579C5).withAlpha(100),
                Color(0xFFFFFFF).withAlpha(55),
                Color(0x6dffffff),
              ],
              stops: [
                0.06,
                0.95,
                1
              ]),
          child: Padding(
            padding: EdgeInsets.only(top: 14, left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(children: [
                  "Verification"
                      .text
                      .size(28)
                      .fontFamily('ave_black')
                      .fontWeight(FontWeight.w800)
                      .white
                      .bold
                      .make(),
                  Spacer(),
                  "clear input".text.yellow400.size(14).make().onTap(() {
                    digit1.clear();
                    digit2.clear();
                    digit3.clear();
                    digit4.clear();
                    digit5.clear();
                    digit6.clear();
                  }),
                  Spacer(),
                  "paste".text.yellow400.size(14).make().onTap(() async {
                    final clipboardData =
                        await Clipboard.getData(Clipboard.kTextPlain);
                    String? clipboardText = clipboardData?.text;

                    digit1.value = TextEditingController(
                            text: clipboardData?.text?.split('')[0].toString())
                        .value;
                    digit2.value = TextEditingController(
                            text: clipboardData?.text?.split('')[1].toString())
                        .value;
                    digit3.value = TextEditingController(
                            text: clipboardData?.text?.split('')[2].toString())
                        .value;
                    digit4.value = TextEditingController(
                            text: clipboardData?.text?.split('')[3].toString())
                        .value;
                    digit5.value = TextEditingController(
                            text: clipboardData?.text?.split('')[4].toString())
                        .value;
                    digit6.value = TextEditingController(
                            text: clipboardData?.text?.split('')[5].toString())
                        .value;
                    // digit1.value =TextEditingController(text: clipboardData?.text?.split('pattern')[0].toString()).value;
                    // digit1.text = clipboardData?.text?.split('pattern')[1].toString() ;
                    // digit2.value = clipboardData?.text?.split('pattern')[1]
                    //     as TextEditingValue;
                    // digit3.value = clipboardData?.text?.split('pattern')[2]
                    //     as TextEditingValue;
                    // digit4.value = clipboardData?.text?.split('pattern')[3]
                    //     as TextEditingValue;
                    // digit5.value = clipboardData?.text?.split('pattern')[4]
                    //     as TextEditingValue;
                    // digit6.value = clipboardData?.text?.split('pattern')[5]
                    //     as TextEditingValue;
                  }),
                ]),
                20.heightBox,
                Row(
                  children: [
                    OtpInput(digit1, true),
                    //2.widthBox, // auto focus
                    OtpInput(digit2, false),
                    // 2.widthBox,
                    OtpInput(digit3, false),
                    //  2.widthBox,
                    OtpInput(digit4, false),
                    // 2.widthBox,
                    OtpInput(digit5, false),
                    // 2.widthBox,
                    OtpInput(digit6, false),
                  ],
                ),
                10.heightBox,
                "OTP has been sent to your number for verification"
                    .text
                    .white
                    .size(14)
                    .make(),

                20.heightBox,
                Obx(
                  () {
                    return query.isLoading == true || mutation.isLoadig == true ? Center(child: CircularProgressIndicator()) : ButtonPrimary(title: "Continue").onInkTap(() {
                      if (variables.verify == 'login') {
                        query.signinotpval(
                            "${digit1.text}${digit2.text}${digit3.text}${digit4.text}${digit5.text}${digit6.text}");
                      } else if (variables.verify == 'reset') {
                        query.resetotp(
                            "${digit1.text}${digit2.text}${digit3.text}${digit4.text}${digit5.text}${digit6.text}");
                      } else if (variables.verify == 'signup') {
                        mutation.otp(
                            "${digit1.text}${digit2.text}${digit3.text}${digit4.text}${digit5.text}${digit6.text}");
                      }

                      variables.phonem == false;
                      print(
                          "${digit1.text}${digit2.text}${digit3.text}${digit4.text}${digit5.text}${digit6.text}");
                    });
                  }
                ),
                20.heightBox,
                Obx(
                  () => ' Resend in ${otpverifyControl.elapsedTime.value} secs'
                      .text
                      .yellow400
                      .make()
                      .centered()
                      .onTap(() {
                    if (otpverifyControl.elapsedTime.value == '00:00') {
                      query.signinotpinit(variables.mobilen);
                      otpverifyControl.elapsedTime.value = "01:00";
                      otpverifyControl.startTimer();
                      int _start = 60;
                      late Timer _timer;
                      _timer =
                          Timer.periodic(const Duration(seconds: 1), (timer) {
                        if (_start < 1) {
                          timer.cancel();
                          otpverifyControl.elapsedTime.value = '00:00';
                        } else {
                          _start = _start - 1;
                          otpverifyControl.elapsedTime.value =
                              DateFormatter.formatSecondsToString(_start);
                        }
                      });
                      // OtpverifyController otpverifyControl = Get.put(OtpverifyController());
                    } else {
                      Get.snackbar(
                          'Error', 'Please wait for timer to complete');
                    }
                  }),

                  // style: const TextStyle(color: Colors.grey),
                ),
                // "Resend in 1:00".text.yellow400.make().centered()
              ],
            ).p(20).box.roundedSM.width(double.infinity).make(),
          ),
        ))
      ]).w(double.infinity).h(double.infinity),
    );
  }

  VxTextField buildTextField(String hint, TextEditingController name) {
    return VxTextField(
      hint: hint,
      fillColor: Vx.white,
      borderRadius: 10,
      borderType: VxTextFieldBorderType.roundLine,
      borderColor: Vx.white,
      controller: name,
    );
  }
}

class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  const OtpInput(this.controller, this.autoFocus, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width * 0.12,
      child: TextField(
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        cursorColor: Theme.of(context).primaryColor,
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            filled: true,
            fillColor: Colors.white,
            focusColor: Colors.white,
            counterText: '',
            hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
          if (value.length == 0) {
            FocusScope.of(context).previousFocus();
          }
          // controller.text = value;
        },
      ),
    );
  }
}
