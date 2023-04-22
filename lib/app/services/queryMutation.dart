import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:styleclub/app/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:styleclub/app/modules/signup_page/views/signup_page_view.dart';
import 'package:styleclub/app/services/variables.dart';
import 'graphqlConf.dart';
import 'package:get/get.dart';
import '../routes/app_pages.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:convert';
import 'models/register.dart';
import 'dart:async';
import "dart:developer";

class ApiClients {
  RxBool isLoadig = false.obs;
  OnboardingController controller = Get.put(OnboardingController());

  ///Example on how to implement mutation
  Future<String> Register(
      String email, password, firstname, lastname, phone, std) async {
    try {
      isLoadig(true);

      ///initializing GraphQLConfig
      GraphQLConfig graphQLConfiguration = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result = await _client.mutate(
        MutationOptions(
          variables: {
            "user": {
              "email": email,
              "countryCode": std,
              "firstName": firstname,
              "fullName": "${firstname} ${lastname}",
              "lastName": lastname,
              "password": password,
              "phone": phone
            }
          },
          document: gql(r'''
            mutation RegisterUser($user: AppRegisterUserInput!) {
  initiateUserRegistration__app(user: $user) {
    temporaryUserId
  }
}
        '''), // this
        ),
      );
      print(email);
      print(phone);
      print(std);
      print(result.data);
      if (result.data == null) {
        Get.snackbar('Error', result.exception!.graphqlErrors[0].message,
            colorText: Colors.white);
        isLoadig(false);
      }
      // print(result.exception!.graphqlErrors[0].message);
      initiateUserRegistration__app data = initiateUserRegistration__app
          .fromJson(result.data!["initiateUserRegistration__app"]);
      variables.temp = data.temporaryUserId.toString();
      print(variables.temp);
      variables.otptype = '2';
      isLoadig(false);
      Get.toNamed(Routes.OTPVERIFY);
      if (result.hasException) {
        // print(result.exception?.graphqlErrors[0].message);
        // print(result.data);
      } else if (result.data != null) {
        print(result.data);
        //  parse your response here and return
        // var data = User.fromJson(result.data["register"]);
      }

      return "";
    } catch (e) {
      isLoadig(false);
      print(e);
      return "";
    }
  }

  Future<String> add_item_cart(String id, String catid, int delivery,
      String name, int price, String producttypeid, String image) async {
    try {
      ///initializing GraphQLConfig
      GraphQLConfig graphQLConfiguration = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result = await _client.mutate(
        MutationOptions(
          variables: {
            "cart": {
              "userId": variables.userid,
              "items": [
                {
                  "itemId": id,
                  "catId": catid,
                  "deliveryDays": delivery,
                  "isPer": true,
                  "name": name,
                  "price": price,
                  "producttypeId": producttypeid,
                  "qty": 1,
                  "size": "XL",
                  "images": image
                }
              ]
            }
          },
          document: gql(r'''
      mutation AddItemsToUserCart($cart: AddItemsToCartInput!) {
  addItemsToUserCart(cart: $cart) {
    _id
    couponCode
  }
}
        '''), // this
        ),
      );
      //  Get.toNamed(Routes.WELCOME);
      if (result.hasException) {
        print("erroroccured");
        print(result.exception?.graphqlErrors[0].message);
      } else if (result.data != null) {
        //  parse your response here and return
        // var data = User.fromJson(result.data["register"]);

        print("Booking Done");
        Get.snackbar('Sucess', 'Booking Done');
      } else {
        Get.toNamed(Routes.TANDC);
      }

      return "";
    } catch (e) {
      print(e);
      return "";
    }
  }

  Future<String> book_appointment(
      String id,
      String type,
      String city,
      String phone,
      String email,
      String first,
      String last,
      String purpose,
      String day,
      String hour,
      String min,
      String month,
      String year) async {
    try {
      ///initializing GraphQLConfig
      GraphQLConfig graphQLConfiguration = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result = await _client.mutate(
        MutationOptions(
          variables: {
            "body": {
              "_id": id,
              "appointmentType": type,
              "cityName": city,
              "countryCode": "+91",
              "email": email,
              "firstName": first,
              "lastName": last,
              "lookingFor": purpose,
              "phone": phone,
              "userId": variables.userid,
              "appointmentDate": {
                "day": int.parse(day),
                "hour": int.parse(hour),
                "minute": int.parse(min),
                "month": int.parse(month),
                "year": int.parse(year),
                "datestamp": "",
                "timestamp": ""
              }
            }
          },
          document: gql(r'''
          mutation SaveAppointment($body: AppointmentInput!) {
  saveAppointment(body: $body) {
    
  }
}
        '''), // this
        ),
      );
      print("Booking Done");
      Get.snackbar('Sucess', 'Booking Done');
      //  Get.toNamed(Routes.WELCOME);
      if (result.hasException) {
        print("erroroccured");
        print(result.exception?.graphqlErrors[0].message);
      } else if (result.data != null) {
        //  parse your response here and return
        // var data = User.fromJson(result.data["register"]);
      } else {
        Get.toNamed(Routes.TANDC);
      }

      return "";
    } catch (e) {
      print(e);
      return "";
    }
  }

  Future<String> save_option(String formID) async {
    try {
      log(formID);
      log(controller.answerCollection.length.toString());
      log(variables.userid);

      ///initializing GraphQLConfig
      controller.answerCollection
          .forEach((element) => log(element.toJson().toString()));
      GraphQLConfig graphQLConfiguration = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result = await _client.mutate(
        MutationOptions(
          variables: {
            "formData": {
              "formIds": "$formID",
              "selections": [
                ...controller.answerCollection
                    .map((element) => element.toJson())
              ],
              "userId": "${variables.userid}"
            }
          },
          document: gql(r'''
          mutation SavePersonalizeFormData($formData: PersonalizeFormDataInput) {
  savePersonalizeFormData(formData: $formData)
}
        '''), // this
        ),
      );

      //Get.snackbar('Sucess', 'Value sucessfully Saved');
      //  Get.toNamed(Routes.WELCOME);
      if (result.hasException) {
        print("erroroccured");
        print(result.exception?.graphqlErrors[0].message);
      } else if (result.data != null) {
        log(result.data.toString());
        print("values saved");
        //  parse your response here and return
        // var data = User.fromJson(result.data["register"]);
      } else {
        Get.toNamed(Routes.TANDC);
      }

      return "";
    } catch (e) {
      print(e);
      return "";
    }
  }

  Future<String> saveProfile(String imagepath) async {
    try {
      ///initializing GraphQLConfig
      GraphQLConfig graphQLConfiguration = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result = await _client.mutate(
        MutationOptions(
          variables: {"imagePath": imagepath, "userId": variables.userid},
          document: gql(r'''
            mutation SaveProfilePicture($imagePath: String!, $userId: String!) {
  saveProfilePicture(imagePath: $imagePath, userId: $userId)
}
        '''), // this
        ),
      );
      // Get.toNamed(Routes.TANDC);
      //  Get.toNamed(Routes.WELCOME);
      if (result.hasException) {
        log(result.exception!.graphqlErrors[0].message);
        Get.snackbar("Error", "${result.exception?.graphqlErrors[0].message}",
            colorText: Colors.white);
      } else if (result.data != null) {
        log("fsce");
        //  parse your response here and return
        // var data = User.fromJson(result.data["register"]);
      } else {
        // Get.toNamed(Routes.TANDC);
      }

      return "";
    } catch (e) {
      print(e);
      return "";
    }
  }

  Future<String> frontProfile(String imagepath) async {
    try {
      log(imagepath);
      log(variables.userid);

      ///initializing GraphQLConfig
      GraphQLConfig graphQLConfiguration = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result = await _client.mutate(
        MutationOptions(
          variables: {"imagePath": imagepath, "userId": variables.userid},
          document: gql(r'''
           mutation SaveBodyProfileFrontPicture($imagePath: String!, $userId: String!) {
  saveBodyProfileFrontPicture(imagePath: $imagePath, userId: $userId)
}
        '''), // this
        ),
      );
      //Get.toNamed(Routes.TANDC);
      //  Get.toNamed(Routes.WELCOME);
      if (result.hasException) {
        log(result.exception!.graphqlErrors[0].message);
        // Get.snackbar("Error", "Please Enter correct otp");
      } else if (result.data != null) {
        log("image saved");
        //  parse your response here and return
        // var data = User.fromJson(result.data["register"]);
      } else {
        // Get.toNamed(Routes.TANDC);
      }

      return "";
    } catch (e) {
      print(e);
      return "";
    }
  }

  Future<String> backProfile(String imagepath) async {
    try {
      ///initializing GraphQLConfig
      GraphQLConfig graphQLConfiguration = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result = await _client.mutate(
        MutationOptions(
          variables: {"imagePath": imagepath, "userId": variables.userid},
          document: gql(r'''
          mutation SaveBodyProfileBackPicture($imagePath: String!, $userId: String!) {
  saveBodyProfileBackPicture(imagePath: $imagePath, userId: $userId)
}
        '''), // this
        ),
      );
      // Get.toNamed(Routes.TANDC);
      //  Get.toNamed(Routes.WELCOME);
      if (result.hasException) {
        log("error");
        print(result.exception?.graphqlErrors[0].message);
        //  Get.snackbar("Error", "Please Enter correct otp");
      } else if (result.data != null) {
        log("back upload");
        //  parse your response here and return
        // var data = User.fromJson(result.data["register"]);
      } else {
        // Get.toNamed(Routes.TANDC);
      }

      return "";
    } catch (e) {
      print(e);
      return "";
    }
  }

  Future<String> sideProfile(String imagepath) async {
    try {
      ///initializing GraphQLConfig
      GraphQLConfig graphQLConfiguration = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result = await _client.mutate(
        MutationOptions(
          variables: {"imagePath": imagepath, "userId": variables.userid},
          document: gql(r'''
         mutation SaveBodyProfileSidePicture($imagePath: String!, $userId: String!) {
  saveBodyProfileSidePicture(imagePath: $imagePath, userId: $userId)
}
        '''), // this
        ),
      );
      //Get.toNamed(Routes.TANDC);
      //  Get.toNamed(Routes.WELCOME);
      if (result.hasException) {
        print(result.exception?.graphqlErrors[0].message);
        // Get.snackbar("Error", "Please Enter correct otp");
      } else if (result.data != null) {
        print("side");
        //  parse your response here and return
        // var data = User.fromJson(result.data["register"]);
      } else {
        // Get.toNamed(Routes.TANDC);
      }

      return "";
    } catch (e) {
      print(e);
      return "";
    }
  }

  Future<String> otp(String otp) async {
    try {
      ///initializing GraphQLConfig
      GraphQLConfig graphQLConfiguration = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result = await _client.mutate(
        MutationOptions(
          variables: {"otp": otp, "temporaryUserId": variables.temp},
          document: gql(r'''
            mutation ValidateOtpAndRegister__app($otp: String!, $temporaryUserId: String!) {
  validateOtpAndRegister__app(otp: $otp, temporaryUserId: $temporaryUserId) {
    expires
    token 
    user {
      
      _id
      fullName
    }
  }
}
        '''), // this
        ),
      );
      print(result.data);
      Get.toNamed(Routes.TANDC);
      variables.userid =
          result.data!["validateOtpAndRegister__app"]["user"]["_id"];

      //  Get.toNamed(Routes.WELCOME);
      if (result.hasException) {
        print(result.exception?.graphqlErrors[0].message);
        Get.snackbar("Error", "Please Enter correct otp",
            colorText: Colors.white);
      } else if (result.data != null) {
        //  parse your response here and return
        // var data = User.fromJson(result.data["register"]);
      } else {
        Get.toNamed(Routes.TANDC);
      }

      return "";
    } catch (e) {
      print(e);
      return "";
    }
  }
}
