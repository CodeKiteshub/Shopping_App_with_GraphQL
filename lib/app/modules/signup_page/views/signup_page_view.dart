import 'package:flutter/material.dart';
import 'package:styleclub/app/core/resources/app_resources.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:get/get.dart';
import 'package:styleclub/app/core/widgets/app_widgets.dart';
import 'package:styleclub/app/routes/app_pages.dart';
import 'package:styleclub/app/services/variables.dart';
import 'package:styleclub/gen/assets.gen.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:styleclub/app/services/queryMutation.dart';
import '../../login_page/controllers/login_page_controller.dart';
import '../controllers/signup_page_controller.dart';
import 'package:country_list_pick/country_list_pick.dart';
//import 'package:country_picker/country_picker.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

ApiClients mutation = ApiClients();
TextEditingController firstnamecontroller = TextEditingController();
TextEditingController lastnamecontroller = TextEditingController();
TextEditingController phonecontroller = TextEditingController();
TextEditingController emailcontroller = TextEditingController();
TextEditingController passwordcontroller = TextEditingController();
TextEditingController stdcode = TextEditingController();

class SignupPageView extends GetView<SignupPageController> {
  SignupPageView({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  LoginPageController login_page_controller = Get.put(LoginPageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.network(
          "https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/cover.png",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SingleChildScrollView(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 150,
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Container(
                        decoration: new BoxDecoration(
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        child: SingleChildScrollView(
                          child: GlassmorphicContainer(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.75,
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
                              // stops: [
                              // 0.06,
                              // 0.95,
                              // 1]
                            ),
                            child: Form(
                              key: _formKey,
                              child: Padding(
                                padding: EdgeInsets.only(top: 8.0, left: 17),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    "Sign Up"
                                        .text
                                        .size(28)
                                        .fontFamily('ave_black')
                                        .fontWeight(FontWeight.w800)
                                        .white
                                        .bold
                                        .make(),
                                    10.heightBox,
                                    InkWell(
                                      onTap: () async {
                                        await controller
                                            .signinwithgoogle();
                                      },
                                      child: Image.network(
                                          'https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/Sign UP.png'),
                                    ),
                                    10.heightBox,
                                    "or"
                                        .text
                                        .white
                                        .bold
                                        .fontFamily('poppins')
                                        .size(12)
                                        .make()
                                        .centered()
                                        .marginOnly(left: 10, right: 10),
                                    Row(
                                      children: [
                                        buildTextField('First Name',
                                                firstnamecontroller)
                                            .expand(),
                                        10.widthBox,
                                        buildTextField(
                                                'Last Name', lastnamecontroller)
                                            .expand(),
                                      ],
                                    ),
                                    10.heightBox,
                                    IntlPhoneField(
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        hintText: 'Phone Number',
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                      ),
                                      initialCountryCode: 'IN',
                                      onChanged: (phone) {
                                        print(phone.number);
                                        phonecontroller.text = phone.number;
                                        print(phonecontroller.text);
                                        stdcode.text = phone.countryCode;
                                        print(phone.countryCode);
                                      },
                                    ),

                                    // SizedBox(
                                    //   child: ElevatedButton(
                                    //     onPressed: () {
                                    //       showCountryPicker(
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
                                    //       );
                                    //     },
                                    //     child: const Text('Select phone code'),
                                    //   ),
                                    // ),
                                    // buildTextField('Mobile Number', phonecontroller),
                                    // 10.heightBox,
                                    buildTextField('E-mail', emailcontroller),
                                    10.heightBox,
                                    buildTextPassField(
                                        'Password', passwordcontroller),

                                    20.heightBox,
                                    "OTP will be sent to your number for verification"
                                        .text
                                        .size(12)
                                        .white
                                        .make()
                                        .centered(),
                                    20.heightBox,
                                    Obx(() {
                                      return mutation.isLoadig.value == true
                                          ? Center(
                                              child:
                                                  CircularProgressIndicator())
                                          : ButtonPrimary(
                                              title: "Continue",
                                            ).onInkTap(() {
                                              variables.mobile =
                                                  phonecontroller.text;
                                              variables.verify = 'signup';
                                              mutation.Register(
                                                  emailcontroller.text,
                                                  passwordcontroller.text,
                                                  firstnamecontroller.text,
                                                  lastnamecontroller.text,
                                                  phonecontroller.text,
                                                  stdcode.text);
                                            });
                                    }),
                                    20.heightBox,
                                    "ALREADY REGISTERED,LOGIN?"
                                        .text
                                        .bold
                                        .size(13)
                                        .underline
                                        .color(goldenColorEnd)
                                        .make()
                                        .centered()
                                        .onTap(() {
                                      Get.toNamed(Routes.LOGIN_PAGE);
                                    }),
                                    20.heightBox
                                  ],
                                ).p(10).box.width(double.infinity).make(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
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
      validator: (val) {
        if (!val.isEmptyOrNull) return 'Enter valid values';
      },
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
