import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:styleclub/app/routes/app_pages.dart';
import 'package:styleclub/app/services/queryQuery.dart';

import '../../../services/graphqlConf.dart';

class LoginPageController extends GetxController {

  //TODO: Implement LoginPageController
  String sociallogin = """
query GoogleLogin(\$googleId: String!) {
  googleLogin(googleId: \$googleId) {
    token
    expires
    user {
      _id
      digitalProfile {
        _id
        bio {
          value
          isVisible
        }
        companyBio {
          value
          isVisible
        }
        connections {
          digitalProfileUserId
        }
        designation {
          value
          isVisible
        }
        email {
          value
          isVisible
        }
        firstName {
          value
          isVisible
        }
        lastName {
          isVisible
          value
        }
        organization {
          isVisible
          value
        }
        passCode
        phone {
          isVisible
          value
        }
        profilePicture {
          isVisible
          value
        }
        socialMediaLinks {
          isVisible
          socialAccount
          value
        }
        registeredByStylistId
      }
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
  void onClose() {
    super.onClose();
  }


  void increment() => count.value++;
}
