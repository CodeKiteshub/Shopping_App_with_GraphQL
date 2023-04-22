import 'dart:math';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pusher_beams/pusher_beams.dart';
import 'package:styleclub/app/modules/onboarding/views/persona_page1.dart';
import 'package:styleclub/app/modules/welcome/views/welcome_view.dart';
import 'package:styleclub/app/services/variables.dart';

import 'graphqlConf.dart';
import 'package:get/get.dart';
import '../routes/app_pages.dart';
import 'dart:convert';
import 'package:styleclub/app/services/models/personalize_form.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import "dart:developer" as dev;
import 'models/loginmodel.dart';
import 'models/usermodel.dart';

String regphone = '';

class ApiClients extends GetxController {
  RxBool isLoading = false.obs;
  LoginModel? data;
  UserModel? user;
  String login = '''
query Login(\$password: String!, \$phone: String) {
  login(password: \$password, phone: \$phone) {
    user {
      digitalProfile {
        _id
        bio {
          value
        }
        email {
          value
        }
        isAvailable
        mpfUserId
        passCode
        organization {
          value
        }
        profilePicture {
          value
        }
        phone {
          value
        }
        designation {
          value
        }
        registeredByStylistId
        socialMediaLinks {
          value
          socialAccount
        }
        firstName {
          value
        }
        lastName {
          value
        }
        companyBio {
          value
        }
        connections {
          digitalProfileUserId
        }
      }
      aboutMe
      email
      firstName
      images {
        profile
      }
      stylist {
        userId
        image
      }
      stylistId
      lastName
      _id
    }
    token
  }
}

  
''';

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
        scans {
          digitalProfileUserId
        }
        isAvailable
        mpfUserId
      }
      aboutMe
      email
      firstName
      stylist {
        _id
        email
        image
        isEnabled
        name
        note
        phone
        roleIdentifier
        sortOrder
        userId
      }
      stylistId
      lastName
      images {
        cover
        other
        profile
      }
    }
  }
}
""";

  String otp = '''
        query Query(\$source: String!) {
  initiateOtpLogin(source: \$source)

}
''';

  String otpval = '''
query ValidateLoginOtp(\$otp: String!, \$source: String!) {
  validateLoginOtp(otp: \$otp, source: \$source) {
    token
    user {
      stylist {
        _id
        email
        image
        isEnabled
        name
        note
        phone
        roleIdentifier
        sortOrder
        userId
      }
      stylistId
      phone
      firstName
      lastName
      _id
      email
      digitalProfile {
        _id
        companyBio {
          value
        }
        bio {
          value
        }
        designation {
          value
        }
        email {
          value
        }
        firstName {
          value
        }
        lastName {
          value
        }
        organization {
          value
        }
        mpfUserId
        passCode
        phone {
          value
        }
        profilePicture {
          value
        }
        socialMediaLinks {
          socialAccount
          value
          isVisible
        }
      }
    }
  }
}
''';
  String countryQuery = '''
           query GetPersonalizeForm(\$filter: PersonalizeFormFilterInput) {
  getPersonalizeForm(filter: \$filter) {
    name
    screens {
      screenSortOrder
      questions {
        questionId
        question {
          _id
          catId
          categoryId
          description
          infoHelpText
          input
          isMandatory
          isMultipleChoice
          master_name
          optionTypeId
          options
          type
          value
          optionsData {
            _id
            image
            name
            sortOrder
          }
        }
      }
    }
  }
}
    ''';
  String userdata = '''
   
query User(\$userId: ID!) {
  user(id: \$userId) {
    _id
    firstName
    lastName
    role
    phone
    aboutMe
    email
    images {
      profile
    }
    personalizedFormPercentFilled {
      formId
      name
      percentFilled
      totalNoOfQuestion
    }
    countryCode
    sso {
      google {
        image
      }
    }
    stylist {
      _id
      email
      image
      isEnabled
      name
      note
      phone
      roleIdentifier
      sortOrder
      userId
    }
    digitalProfile {
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
      email {
        isVisible
        value
      }
      firstName {
        isVisible
        value
      }
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
      profilePicture {
        isVisible
        value
      }
      socialMediaLinks {
        isVisible
        socialAccount
        value
      }
      scans {
        digitalProfileUserId
      }
      registeredByStylistId
      profileUrl
    }
    stylistId
  }
}
    ''';
  String initresetQuery = '''
           query InitiatePasswordReset(\$source: String!) {
  initiatePasswordReset(source: \$source) {
    _id
  }
}
    ''';
  String resetQuery = '''
    query Query(\$newPassword: String!, \$otp: String!, \$source: String!) {
  saveNewPassword(newPassword: \$newPassword, otp: \$otp, source: \$source)
}
    ''';
  void getCountry2() async {
    try {
      ///initializing GraphQLConfig
      GraphQLConfig graphQLConfiguration = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result = await _client.query(
        QueryOptions(document: gql(countryQuery), variables: {
          "filter": {
            "Id": "60c2fa761ede7a3740f41775",
            "userId": variables.userid,
            "isEdit": true
          }
        }),
      );

      var data = jsonEncode(result.data!);
      variables.form = Personalize_form.fromJson(jsonDecode(data));

      variables.totalform = 0;

      // int screens = variables.form.getPersonalizeForm!.screens!.length;
      // print(screens);
      variables.screens = variables.form.getPersonalizeForm!.screens!.length;
      for (int i = 0; i < variables.screens; i++) {
        variables.totalform +=
            variables.form.getPersonalizeForm!.screens![i].questions!.length;
      }

      print(variables.totalform);
      // int k = 0;
      // for (int i = 0; i < screens; i++) {
      //   for (int j = 0;
      //       j <
      //           variables
      //               .form.getPersonalizeForm!.screens![i].questions!.length;
      //       j++) {
      //     variables.questions[k] =
      //         "${variables.form.getPersonalizeForm!.screens![i].questions![j].question!.infoHelpText.toString()}!${variables.form.getPersonalizeForm!.screens![i].questions![j].question!.input.toString()}";
      //     k++;
      //     print(j);
      //     print('i:${}');
      //   }
      // }
      // print(variables.questions);

      print(variables.form.getPersonalizeForm!.name.toString());
      print(variables.totalform);

      Get.toNamed(Routes.ONBOARDING);
      if (result.hasException) {
        print(result.exception?.graphqlErrors[0]?.message);
      } else if (result.data != null) {
        // Personalize responseModel =
        //     personalizeFromJson(jsonEncode(result.data!["getPersonalizeForm"]));
        // print(responseModel.data.getPersonalizeForm.name);
      }
    } catch (e) {
      print(e);
    }
  }
// void branchpartner() async{
//    try {
//       ///initializing GraphQLConfig
//       GraphQLConfig graphQLConfiguration = GraphQLConfig();
//       GraphQLClient _client = graphQLConfiguration.clientToQuery();
//       QueryResult result = await _client.query(
//         QueryOptions(document: gql(branchpartners), variables: {

//   "filters": {

//   },
//   "limit": 0,
//   "page": 0
// }
//         ),
//       );
//        if (result.hasException) {
//         print(result.exception?.graphqlErrors[0]?.message);
//       } else if (result.data != null) {
//         // Personalize responseModel =
//         //     personalizeFromJson(jsonEncode(result.data!["getPersonalizeForm"]));
//         // print(responseModel.data.getPersonalizeForm.name);
//       }
//     } catch (e) {
//       print(e);
//     }

//
  getCountry() async {
    try {
      isLoading(true);

      ///initializing GraphQLConfig
      GraphQLConfig graphQLConfiguration = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result = await _client.query(
        QueryOptions(document: gql(countryQuery), variables: {
          "filter": {
            "Id": "60c2fa761ede7a3740f41775",
            "userId": "${variables.userid}",
            "isEdit": true
          }
        }),
      );

      var data = jsonEncode(result.data!);
      variables.form = Personalize_form.fromJson(jsonDecode(data));

      variables.totalform = 0;
      // int screens = variables.form.getPersonalizeForm!.screens!.length;
      // print(screens);
      variables.screens = variables.form.getPersonalizeForm!.screens!.length;
      for (int i = 0; i < variables.screens; i++) {
        variables.totalform +=
            variables.form.getPersonalizeForm!.screens![i].questions!.length;
      }

      print(variables.totalform);
      // int k = 0;
      // for (int i = 0; i < screens; i++) {
      //   for (int j = 0;
      //       j <
      //           variables
      //               .form.getPersonalizeForm!.screens![i].questions!.length;
      //       j++) {
      //     variables.questions[k] =
      //         "${variables.form.getPersonalizeForm!.screens![i].questions![j].question!.infoHelpText.toString()}!${variables.form.getPersonalizeForm!.screens![i].questions![j].question!.input.toString()}";
      //     k++;
      //     print(j);
      //     print('i:${}');
      //   }
      // }
      // print(variables.questions);

      print(variables.form.getPersonalizeForm!.name.toString());
      print(variables.totalform);
      isLoading(false);

      Get.toNamed(Routes.ONBOARDING);
      // Get.to(() => NewOnboard());
      if (result.hasException) {
        print(result.exception?.graphqlErrors[0].message);
      } else if (result.data != null) {
        // Personalize responseModel =
        //     personalizeFromJson(jsonEncode(result.data!["getPersonalizeForm"]));
        // print(responseModel.data.getPersonalizeForm.name);
      }
    } catch (e) {
      print(e);
    }
  }

  void signinpass(String phone, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      isLoading(true);

      ///initializing GraphQLConfig
      GraphQLConfig graphQLConfiguration = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result = await _client.query(
        QueryOptions(
            document: gql(login),
            variables: {"phone": "$phone", "password": "$password"}),
      );

      if (result.hasException) {
        print(result.exception?.graphqlErrors[0]?.message);
      } else if (result.data != null) {}
      var body = jsonEncode((result.data)!["login"]["user"]["digitalProfile"]);
      print(body);
      // print('token is:-');
      // print(result.data!["login"]["token"]);
      variables.userid = "${result.data!["login"]["user"]["_id"]}";
      prefs.setString('userid', variables.userid);
      print("...." + variables.userid);
      getuser();
      variables.name =
          "${result.data!["login"]["user"]["firstName"]} ${result.data!["login"]["user"]["lastName"]}";
      variables.email = "${result.data!["login"]["user"]["email"]}";
      variables.phone = "${result.data!["login"]["user"]["phone"]}";
      prefs.setString('name', variables.name);
      prefs.setString('email', variables.email);
      prefs.setString('phone', variables.phone);
      print(variables.email);
      // if ((result.data)?["login"]["user"]["digitalProfile"] != null) {
      //     data = loginModelFromJson(body);
      // }
      // print(data!.firstName!.value);
      isLoading(false);
      Get.snackbar("Success", "successfully logged in",
          colorText: Colors.white);

      if (result.data!["login"]["token"] != null) {
        Get.to(() => WelcomeView());
      }
    } catch (e) {
      isLoading(false);
      Get.snackbar('Error', 'Invalid phone number or password',
          colorText: Colors.white);
      print(e);
    }
  }

  signinwithsocial(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    GraphQLConfig graphQLConfiguration = GraphQLConfig();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult result = await _client.query(
      QueryOptions(document: gql(sociallogin), variables: {"googleId": id}),
    );
    print(result.data);
    // var body =
    //     jsonEncode((result.data)!["googleLogin"]["user"]["digitalProfile"]);
    // print("body.... $body");
    // if ((result.data)!["googleLogin"]["user"]["digitalProfile"] != null) {
    //   data = loginModelFromJson(body);

    //   print(data!.firstName!.value);
    // } else {}
    // print('token is:-');
    // print(result.data!["login"]["token"]);
    variables.userid = "${result.data!["googleLogin"]["user"]["_id"]}";
    prefs.setString('userid', variables.userid);
    print("...." + variables.userid);
    getuser();
    variables.name =
        "${result.data!["googleLogin"]["user"]["firstName"]} ${result.data!["googleLogin"]["user"]["lastName"]}";
    variables.email = "${result.data!["googleLogin"]["user"]["email"]}";
    variables.phone = "${result.data!["googleLogin"]["user"]["phone"]}";
    prefs.setString('name', variables.name);
    prefs.setString('email', variables.email);
    prefs.setString('phone', variables.phone);
    print(variables.email);

    isLoading(false);
    Get.snackbar("Success", "successfully logged in", colorText: Colors.white);

    if (result.data!["googleLogin"]["token"] != null) {
      Get.to(() => WelcomeView());
    }

    if (result.hasException) {
      print(result.exception?.graphqlErrors[0]?.message);
    } else if (result.data != null) {}
  }

  void signinotpval(String otp) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      print(otp);
      print(regphone);
      isLoading(true);

      ///initializing GraphQLConfig
      print('going to login');
      GraphQLConfig graphQLConfiguration = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result = await _client.query(
        QueryOptions(
            document: gql(otpval),
            variables: {"otp": "$otp", "source": "$regphone"}),
      );

      if (result.hasException) {
        print(result.exception?.graphqlErrors[0]?.message);
      } else if (result.data != null) {}
      var body = jsonEncode(result.data);
      print(body);
      print('token is:-');
      // data = loginModelFromJson(body);
      variables.userid = result.data!["validateLoginOtp"]["user"]["_id"];
      prefs.setString('userid', variables.userid);
      JwtDecoder.decode(result.data!["validateLoginOtp"]["token"]);
      print(result.data!["validateLoginOtp"]["token"]);
      // print(
      //     JwtDecoder.decode(result.data!["validateLoginOtp"]["token"])["images"]
      //         ["profile"]);
      // variables.profilepic =
      //     JwtDecoder.decode(result.data!["validateLoginOtp"]["token"])["images"]
      //         ["profile"];

      variables.name =
          "${result.data!["validateLoginOtp"]["user"]["firstName"]} ${result.data!["validateLoginOtp"]["user"]["lastName"]}";
      variables.email = "${result.data!["validateLoginOtp"]["user"]["email"]}";
      variables.phone = "${result.data!["validateLoginOtp"]["user"]["phone"]}";
      // prefs.setString('profilepic', variables.profilepic);
      prefs.setString('name', variables.name);
      prefs.setString('email', variables.email);
      prefs.setString('phone', variables.phone);
      Get.snackbar("Success", "successfully logged in",
          colorText: Colors.white);

      if (result.data!["validateLoginOtp"]["token"] != null) {
        isLoading(false);
        Get.toNamed(Routes.WELCOME);
      }
    } catch (e) {
      isLoading(false);
      Get.snackbar('Error', 'Invalid otp', colorText: Colors.white);
      print(e);
    }
  }

  getuser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    ///initializing GraphQLConfig
    GraphQLConfig graphQLConfiguration = GraphQLConfig();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult result = await _client.query(
      QueryOptions(
          document: gql(userdata), variables: {"userId": variables.userid}),
    );

    if (result.hasException) {
      print(result.exception?.graphqlErrors[0].message);
    } else if (result.data != null) {
      await PusherBeams.instance
          .setDeviceInterests(['debug-new', variables.userid]);
      PusherBeams.instance.onMessageReceivedInTheForeground(
          (notification) => print(notification));
      var data = jsonEncode(result.data);
      dev.log(data);
      user = userModelFromJson(data);

      variables.name =
          "${result.data!["user"]["firstName"]} ${result.data!["user"]["lastName"]}";

      print("name..." + variables.name);
      print(user!.user.firstName);

      variables.profilepic = result.data!["user"]["images"]["profile"] ?? "";
      print(variables.profilepic);
      prefs.setString('profilepic', variables.profilepic);
      print("pic..." + variables.profilepic);
      
    }
  }

  void signinotpinit(String phone) async {
    try {
      isLoading(true);

      ///initializing GraphQLConfig
      GraphQLConfig graphQLConfiguration = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result = await _client.query(
        QueryOptions(document: gql(otp), variables: {"source": "$phone"}),
      );

      var data = jsonEncode(result.data);
      print(data);
      regphone = phone;
      variables.mobilen = phone;
      // print('token is:-');
      // print(result.data!["login"]["token"]);
      // variables.name =
      //     "${result.data!["login"]["user"]["firstName"]} ${result.data!["login"]["user"]["lastName"]}";
      // variables.email = "${result.data!["login"]["user"]["email"]}";
      // variables.phone = "${result.data!["login"]["user"]["phone"]}";
      Get.snackbar("Success", result.data!["initiateOtpLogin"],
          colorText: Colors.white);
      variables.phonem = true;
      // if (result.data!["login"]["token"] != null) {
      isLoading(false);
      Get.toNamed(Routes.OTPVERIFY);
      // }

      if (result.hasException) {
        print(result.exception?.graphqlErrors[0].message);
      } else if (result.data != null) {}
    } catch (e) {
      isLoading(false);
      Get.snackbar('Error', 'Phone number is not registered',
          colorText: Colors.white);
      print(e);
    }
  }

  void resetotpinit(String phone) async {
    try {
      ///initializing GraphQLConfig
      GraphQLConfig graphQLConfiguration = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result = await _client.query(
        QueryOptions(
            document: gql(initresetQuery), variables: {"source": "$phone"}),
      );

      var data = jsonEncode(result.data);
      print(data);
      regphone = phone;
      variables.mobilen = phone;
      // print('token is:-');
      // print(result.data!["login"]["token"]);
      // variables.name =
      //     "${result.data!["login"]["user"]["firstName"]} ${result.data!["login"]["user"]["lastName"]}";
      // variables.email = "${result.data!["login"]["user"]["email"]}";
      // variables.phone = "${result.data!["login"]["user"]["phone"]}";
      Get.snackbar("Success", "reset otp successfully sent",
          colorText: Colors.white);
      variables.otptype = '2';
      // if (result.data!["login"]["token"] != null) {
      Get.toNamed(Routes.OTPVERIFY);
      // }

      if (result.hasException) {
        print(result.exception?.graphqlErrors[0].message);
        Get.snackbar('Error', 'Phone number is not registered',
            colorText: Colors.white);
      } else if (result.data != null) {}
    } catch (e) {
      //
      // print(e);
    }
  }

  void resetotp(String otp) async {
    try {
      ///initializing GraphQLConfig
      GraphQLConfig graphQLConfiguration = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result = await _client.query(
        QueryOptions(document: gql(resetQuery), variables: {
          "newPassword": "${variables.newpassword}",
          "otp": "$otp",
          "source": "$regphone"
        }),
      );

      var data = jsonEncode(result.data);
      print(data);

      // print('token is:-');
      // print(result.data!["login"]["token"]);
      // variables.name =
      //     "${result.data!["login"]["user"]["firstName"]} ${result.data!["login"]["user"]["lastName"]}";
      // variables.email = "${result.data!["login"]["user"]["email"]}";
      // variables.phone = "${result.data!["login"]["user"]["phone"]}";
      Get.snackbar("Success", "${result.data!["saveNewPassword"]}",
          colorText: Colors.white);
      if (result.data!["saveNewPassword"] != null) {
        Get.toNamed(Routes.LOGIN_PAGE);
      }

      if (result.hasException) {
        print(result.exception?.graphqlErrors[0]?.message);
      } else if (result.data != null) {}
    } catch (e) {
      Get.snackbar(
          'Error', 'Phone number is not registered or otp is incorrect',
          colorText: Colors.white);
      // print(e);
    }
  }
}
