import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:styleclub/app/core/resources/app_resources.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:get/get.dart';
import 'package:styleclub/app/core/widgets/app_widgets.dart';
import 'package:styleclub/app/modules/elevate_page/views/elevate_page_view.dart';
import 'package:styleclub/app/routes/app_pages.dart';
import 'package:styleclub/app/services/variables.dart';
import 'package:styleclub/gen/assets.gen.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:styleclub/app/services/queryQuery.dart';
import '../controllers/reset_password_controller.dart';
import 'package:country_list_pick/country_list_pick.dart';
//import 'package:country_picker/country_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
// import 'package:glassmorphism/glassmorphism.dart';
// import 'package:styleclub/app/services/queryQuery.dart';
// import 'package:styleclub/app/modules/elevate_page/views/elevate_page_view.dart';

ApiClients mutation = ApiClients();
TextEditingController firstnamecontroller = TextEditingController();
TextEditingController lastnamecontroller = TextEditingController();
TextEditingController phonecontroller = TextEditingController();
TextEditingController emailcontroller = TextEditingController();
TextEditingController passwordcontroller = TextEditingController();

class ResetPagePassView extends GetView<ResetPageController> {
  const ResetPagePassView({Key? key}) : super(key: key);
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
            height: MediaQuery.of(context).size.height * 0.4174,
            borderRadius: 20,
            blur: 4,
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
                Color(0x4bffffff),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 16, left: 17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  "Reset Your Password"
                      .text
                      .size(28)
                      .fontFamily('ave_black')
                      .fontWeight(FontWeight.w800)
                      .white
                      .bold
                      .make(),
                  10.heightBox,

                  SizedBox(
                    height: 4,
                    width: 8,
                    child: CountryListPick(
                      initialSelection: '+91',
                      onChanged: (CountryCode? code) {
                        print(code!.name);
                        print(code.code);
                        print(code.dialCode);
                        print(code.flagUri);
                      },
                    ),
                  ),
                  IntlPhoneField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Phone Number',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    initialCountryCode: 'IN',
                    onChanged: (phone) {
                      print(phone.completeNumber);
                    },
                    controller: phonecontroller,
                  ),
                  //SizedBox(

                  //         child: ElevatedButton(
                  //   onPressed: () {
                  //     showCountryPicker(
                  //         context: context,
                  //         //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).

                  //         //Optional. Shows phone code before the country name.
                  //         showPhoneCode: true,
                  //         onSelect: (Country country) {
                  //           print('Select country: ${country.displayName}');
                  //         },
                  //         // Optional. Sets the theme for the country list picker.
                  //         countryListTheme: CountryListThemeData(
                  //           // Optional. Sets the border radius for the bottomsheet.
                  //           borderRadius: BorderRadius.only(
                  //             topLeft: Radius.circular(40.0),
                  //             topRight: Radius.circular(40.0),
                  //           ),
                  //           // Optional. Styles the search field.
                  //           inputDecoration: InputDecoration(
                  //             labelText: 'Search',
                  //             hintText: 'Start typing to search',
                  //             prefixIcon: const Icon(Icons.search),
                  //             border: OutlineInputBorder(
                  //               borderSide: BorderSide(
                  //                 color: const Color(0xFF8C98A8).withOpacity(0.2),
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //     );
                  //   },
                  //   child: const Text('Select phone code'),
                  // ),
                  //       ),buildTextField('Mobile Number', phonecontroller),
                  10.heightBox,
                  buildTextPassField('New Password', passwordcontroller),

                  20.heightBox,
                  const ButtonPrimary(title: "Continue").onInkTap(() {
                    variables.newpassword = passwordcontroller.text;
                    variables.verify = 'reset';
                    // variables.mobile = phonecontroller.text;
                    query.resetotpinit(phonecontroller.text);
                    // Get.toNamed(Routes.WELCOME);
                  }),
                  20.heightBox,
                  // "FORGOT PASSWORD"
                  //     .text
                  //     .bold
                  //     .size(13)
                  //     .underline
                  //     .color(goldenColorEnd)
                  //     .make()
                  //     .centered()
                  //     .onTap(() {
                  //   Get.toNamed(Routes.PHOTO_UPLOAD);
                  // }),
                  20.heightBox
                ],
              )
                  .p(10)
                  .box
                  .roundedSM
                  .width(double.infinity)
                  .margin(const EdgeInsets.only(left: 10, right: 10))
                  //.color(Vx.gray200.withOpacity(0.5))
                  .make(),
            ),
          ),
        )
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

  VxTextField buildTextPassField(String hint, TextEditingController name) {
    return VxTextField(
      obscureText: true,
      hint: hint,
      fillColor: Vx.white,
      borderRadius: 10,
      borderType: VxTextFieldBorderType.roundLine,
      borderColor: Vx.white,
      controller: name,
      validator: (val) {
        if (!val.isEmptyOrNull) return 'Enter valid values';
      },
    );
  }
}
