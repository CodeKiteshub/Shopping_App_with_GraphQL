import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:styleclub/app/modules/see_connect_profile/views/see_connect_profile_view.dart';
import 'package:styleclub/app/services/models/digitalidentitymodel.dart';
import 'package:styleclub/app/services/models/usermodel.dart';

import '../../../services/graphqlConf.dart';

class SeeProfileController extends GetxController {
  //TODO: Implement SeeProfileController
  RxBool isLoading = false.obs;
  DigitalProfileModel? digitalprofile;
  String getdigitalprofile = """ 
query GetDigitalProfileById(\$digitalProfileUserId: String!, \$passCode: String) {
  getDigitalProfileById(digitalProfileUserId: \$digitalProfileUserId, passCode: \$passCode) {
    _id
    bio {
      isVisible
      value
    }
    companyBio {
      isVisible
      value
    }
    connections {
      digitalProfileUserId
    }
    designation {
      isVisible
      value
    }
    firstName {
      isVisible
      value
    }
    email {
      isVisible
      value
    }
    isAvailable
    lastName {
      isVisible
      value
    }
    mpfUserId
    organization {
      isVisible
      value
    }
    passCode
    phone {
      isVisible
      value
    }
    profileUrl
    profilePicture {
      isVisible
      value
    }
    profileId
    registeredByStylistId
    registeredDate {
      datestamp
      day
      hour
      minute
      month
      timestamp
      year
    }
    scans {
      digitalProfileUserId
    }
    socialMediaLinks {
      isVisible
      socialAccount
      value
    }
  }
}
""";
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  getdigitalidentity(String id, String passcode) async {
    isLoading(true);
    GraphQLConfig graphQLConfiguration = GraphQLConfig();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult result = await _client.query(
      QueryOptions(
          document: gql(getdigitalprofile),
          variables: {"digitalProfileUserId": id, "passCode": passcode}),
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
      var body = jsonEncode((result.data));
      print(body);
      digitalprofile = digitalProfileModelFromJson(body);
      Get.to(() => SeeConnectProfileView());
      isLoading(false);
    }
  }

  void increment() => count.value++;
}
