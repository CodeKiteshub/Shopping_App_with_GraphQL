import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:styleclub/app/core/resources/app_resources.dart';
import 'package:styleclub/app/core/widgets/app_widgets.dart';
import 'package:styleclub/app/modules/create_digital_identity/controllers/create_digital_identity_controller.dart';
import 'package:styleclub/app/modules/elevate_page/views/elevate_page_view.dart';
import 'package:styleclub/app/routes/app_pages.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/edit_profile_controller.dart';

class EditProfileView extends StatefulWidget {
  EditProfileView({Key? key}) : super(key: key);

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController firstname = TextEditingController();

  TextEditingController lastname = TextEditingController();

  TextEditingController designation = TextEditingController();

  TextEditingController organization = TextEditingController();

  TextEditingController bio = TextEditingController();

  TextEditingController companyBio = TextEditingController();

  CreateDigitalIdentityController createDigitalIdentityController =
      Get.put(CreateDigitalIdentityController());

  @override
  void initState() {
    // TODO: implement initState
    if (query.user!.user.digitalProfile != null) {
      firstname.text = query.user!.user.digitalProfile!.firstName.value;
      lastname.text = query.user!.user.digitalProfile!.lastName.value;
      designation.text = query.user!.user.digitalProfile!.designation.value;
      organization.text = query.user!.user.digitalProfile!.organization.value;
      bio.text = query.user!.user.digitalProfile!.bio.value;
      companyBio.text = query.user!.user.digitalProfile!.companyBio.value;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTitle("Tell us about yourself!"),
              20.heightBox,
              "This will be visible to any one whom you connect with using the card"
                  .text
                  .white
                  .size(18)
                  .make(),
              20.heightBox,
              buildSubTitle("First Name"),
              10.heightBox,
              buildTextField(firstname),
              20.heightBox,
              buildSubTitle("Last Name"),
              10.heightBox,
              buildTextField(lastname),
              20.heightBox,
              buildSubTitle("Bio"),
              10.heightBox,
              buildTextField(bio, length: 8),
              20.heightBox,
              buildSubTitle("Designation"),
              10.heightBox,
              buildTextField(designation),
              20.heightBox,
              buildSubTitle("Company or Organisation"),
              10.heightBox,
              buildTextField(organization),
              20.heightBox,
              buildSubTitle("Company Bio"),
              10.heightBox,
              buildTextField(companyBio, length: 8),
              40.heightBox,
              const ButtonPrimary(title: "Let's add more!").onInkTap(() {
                if (bio.text.length == 0 || companyBio.text.length == 0) {
                  Get.defaultDialog(
                      title: "Error", content: Text("Plese Fill all fields."));
                } else {
                  createDigitalIdentityController.bio.value = bio.text;
                  createDigitalIdentityController.designation.value =
                      designation.text;
                  createDigitalIdentityController.lastname.value =
                      lastname.text;
                  createDigitalIdentityController.companybio.value =
                      companyBio.text;
                  createDigitalIdentityController.firstname.value =
                      firstname.text;
                  createDigitalIdentityController.organization.value =
                      organization.text;
                  Get.toNamed(Routes.EDIT_SOCIAL_MEDIA);
                }
              }),
              10.heightBox,
              "Later, I want to Explore!"
                  .text
                  .bold
                  .size(18)
                  .underline
                  .color(goldenColorEnd)
                  .make()
                  .centered()
            ],
          ).marginAll(10),
        ),
      )
          .safeArea()
          .box
          .width(double.infinity)
          .height(double.infinity)
          .withDecoration(scaffoldGradient)
          .make(),
    );
  }

  VxTextField buildTextField(TextEditingController Tcontroller,
      {int length = 2}) {
    return VxTextField(
      borderType: VxTextFieldBorderType.roundLine,
      borderRadius: 10,
      maxLine: length,
      validator: (value) {
        if (value!.length < 3) {
          return "Please input original value";
        }
        ;
      },
      controller: Tcontroller,
      style: TextStyle(color: Vx.gray200),
      fillColor: themeGradientColorEnd,
    );
  }

  Widget buildSubTitle(String subtitle) =>
      subtitle.text.size(18).gray200.bold.make();
}
