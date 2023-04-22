import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:styleclub/app/modules/elevate_page/views/elevate_page_view.dart';
import 'package:styleclub/app/services/graphqlConf.dart';
import 'package:styleclub/app/services/models/digitalidentitymodel.dart';
import 'package:styleclub/app/services/variables.dart';

import '../../../routes/app_pages.dart';

class CreateDigitalIdentityController extends GetxController {
  //TODO: Implement CreateDigitalIdentityController
  RxString bio = "".obs;
  RxString designation = "".obs;
  RxString email = "".obs;
  RxString firstname = "".obs;
  RxString lastname = "".obs;
  RxString companybio = "".obs;
  RxString organization = "".obs;
  RxString dropdownValue = 'Whatsapp'.obs;
  RxBool isTapped = false.obs;
  RxString linkedinprofile = "".obs;
  RxString twitterprofile = "".obs;
  RxString instagram = "".obs;
  RxString otherprofile = "".obs;
  RxString profilepic = "".obs;
  RxBool isLoading = false.obs;
  RxString passcode = "".obs;

  final count = 0.obs;
  @override
  void onInit() {
    query.getuser();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  savedigitalidentity({String id = ""}) async {
    print(id);
    try {
      isLoading(true);
      GraphQLConfig graphQLConfiguration = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result = await _client.mutate(
        MutationOptions(
          variables: {
            "body": {
              "bio": {"isVisible": true, "value": bio.value},
              "designation": {"isVisible": true, "value": designation.value},
              "email": {"isVisible": true, "value": variables.email},
              "isAvailable": true,
              "organization": {"isVisible": true, "value": organization.value},
              "phone": {"isVisible": true, "value": variables.phone},
              "socialMediaLinks": [
                {
                  "isVisible": true,
                  "socialAccount": "Instagram",
                  "value": instagram.value
                },
                {
                  "isVisible": true,
                  "socialAccount": "Twitter",
                  "value": twitterprofile.value
                },
                {
                  "isVisible": true,
                  "socialAccount": "Linkedin",
                  "value": linkedinprofile.value
                },
              {
                  "isVisible": true,
                  "socialAccount": dropdownValue.value,
                  "value": otherprofile.value
                }
              ],
              "profilePicture": {"isVisible": true, "value": profilepic.value},
              "mpfUserId": variables.userid,
              "passCode": passcode.value,
              "companyBio": {"value": companybio.value, "isVisible": true},
              "lastName": {"value": lastname.value, "isVisible": true},
              "firstName": {"value": firstname.value, "isVisible": true},
              "registeredByStylistId": null
            },
            "digitalProfileUserId": id
          },
          document: gql(
              r'''mutation SaveDigitalProfile($body: DigitalProfileInput!, $digitalProfileUserId: String) {
  saveDigitalProfile(body: $body, digitalProfileUserId: $digitalProfileUserId) {
    _id
  }
}
        '''), // this
        ),
      );

      if (result.hasException) {
        print(result.exception?.graphqlErrors[0].message);
        isLoading(false);
        Get.defaultDialog(
          title: "Error",
          content: Text(result.exception!.graphqlErrors[0].message),
          onConfirm: () {
            Get.back();
          },
        );
        // print(result.data);
      } else if (result.data != null) {
        print(result.data);
        isLoading(false);
        Get.snackbar('Sucess', 'Your Digital Profile Created');
        Get.toNamed(Routes.SETTINGS);
        //  parse your response here and return
        // var data = User.fromJson(result.data["register"]);
      }
      // print("+++++++" + result.exception.toString());
      print(result.context.entry<HttpLinkResponseContext>()!.statusCode);
    } catch (e) {
      print(e);
    }
  }

  void increment() => count.value++;
}
