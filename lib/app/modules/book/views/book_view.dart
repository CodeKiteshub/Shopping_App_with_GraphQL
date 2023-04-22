import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:styleclub/app/core/widgets/app_widgets.dart';
import 'package:styleclub/app/services/queryMutation.dart';
import 'package:styleclub/app/services/variables.dart';

import 'package:velocity_x/velocity_x.dart';

import '../../../core/resources/app_resources.dart';
import '../controllers/book_controller.dart';

TextEditingController firstnamecontroller = TextEditingController();
ApiClients mutation = ApiClients();
TextEditingController lastnamecontroller = TextEditingController();
TextEditingController date = TextEditingController();
TextEditingController city = TextEditingController();
TextEditingController purpose = TextEditingController();
TextEditingController time = TextEditingController();
TextEditingController phonecontroller = TextEditingController();
TextEditingController emailcontroller = TextEditingController();
TextEditingController passwordcontroller = TextEditingController();
TextEditingController stdcode = TextEditingController();

class BookView extends StatefulWidget {
  BookView({Key? key}) : super(key: key);

  @override
  State<BookView> createState() => _BookViewState();
}

class _BookViewState extends State<BookView> {
  String value = "video call";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
                child: Column(
      children: [
        buildTitle("Book an Appointment"),
        SizedBox(
          height: 30,
        ),
        Row(
          children: [
            Container(
              width: 180,
              height: 50,
              child: ListTile(
                title: Text(
                  "Video Call",
                  style: TextStyle(
                      fontFamily: 'dmsans',
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
                //  "Video Call".text
                //   .fontFamily('dmsans')
                //   .fontWeight(FontWeight.w400)
                //   .white
                //   .size(18)
                //   .make(),
                leading: Radio(
                  value: "video call",
                  groupValue: value,
                  onChanged: (String? value1) {
                    setState(() {
                      value = value1!;
                    });
                  },
                ),
              ),
            ),
            SizedBox(width: 10),
            Container(
              width: 180,
              height: 50,
              child: ListTile(
                title: Text(
                  "Studio Visit",
                  style: TextStyle(
                      fontFamily: 'dmsans',
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
                //  "Video Call".text
                //   .fontFamily('dmsans')
                //   .fontWeight(FontWeight.w400)
                //   .white
                //   .size(18)
                //   .make(),
                leading: Radio(
                  value: "studio visit",
                  groupValue: value,
                  onChanged: (String? value1) {
                    setState(() {
                      value = value1!;
                    });
                  },
                ),
              ),
            ),
            //     ListTile(
            //     title: "Studio Visit".text
            //       .fontFamily('dmsans')
            //       .fontWeight(FontWeight.w400)
            //       .white
            //       .size(18)
            //       .make(),
            //     leading: Radio(
            //       value: "studio visit",
            //       groupValue: value,
            //       onChanged: (String? value1) {
            //         setState(() {
            //           value = value1!;
            //         });
            //       },
            //     ),
            //   ),
          ],
        ),
        10.heightBox,
        Row(
          children: [
            buildTextField('First Name', firstnamecontroller).expand(),
            10.widthBox,
            buildTextField('Last Name', lastnamecontroller).expand(),
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
                borderRadius: BorderRadius.circular(15)),
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
        10.heightBox,
        buildTextField('E-mail', emailcontroller),
        10.heightBox,
        Row(
          children: [
            buildTextField('Date(DD/MM/YYYY)', date).expand(),
            10.widthBox,
            buildTextField('Time(HH:MM)', time).expand(),
          ],
        ),
        10.heightBox,
        buildTextField('City', city),
        10.heightBox,
        buildTextField2('Purpose', purpose),
        20.heightBox,
        Image.network('https://mpf-public-data.s3.ap-south-1.amazonaws.com/app-resources/images/bookstylist.png').w(250).onInkTap(() {
          mutation.book_appointment(
              variables.stylistid,
              value,
              city.text,
              phonecontroller.text,
              emailcontroller.text,
              firstnamecontroller.text,
              lastnamecontroller.text,
              purpose.text,
              date.text.split('/')[0],
              time.text.split(':')[0],
              time.text.split(':')[1],
              date.text.split('/')[1],
              date.text.split('/')[2]);
        }),
      ],
    ))
            .safeArea()
            .box
            .width(double.infinity)
            .height(double.infinity)
            .p12
            .withDecoration(scaffoldGradient)
            .make());
  }
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

VxTextField buildTextField2(String hint, TextEditingController name) {
  return VxTextField(
    hint: hint,
    fillColor: Vx.white,
    borderRadius: 10,
    borderType: VxTextFieldBorderType.roundLine,
    borderColor: Vx.white,
    maxLine: 8,
    controller: name,
    validator: (val) {
      if (!val.isEmptyOrNull) return 'Enter valid values';
    },
  );
}
