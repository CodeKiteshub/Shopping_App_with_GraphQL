import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:styleclub/app/modules/login_page/controllers/login_page_controller.dart';
import 'package:styleclub/app/services/queryQuery.dart';

import '../../../routes/app_pages.dart';
import '../../../services/graphqlConf.dart';

class SignupPageController extends GetxController {
  ApiClients query = Get.put(ApiClients());
  //TODO: Implement SignupPageController

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

  signinwithgoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = auth.GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    //  await FirebaseAuth.instance.signInWithCredential(credential);
    final auth.UserCredential authResult =
        await FirebaseAuth.instance.signInWithCredential(credential);
    final auth.User? user = authResult.user;
    if (user != null) {
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final auth.User currentUser = FirebaseAuth.instance.currentUser!;
      assert(user.uid == currentUser.uid);

      print('signInWithGoogle succeeded: $user');
      var email = user.email;
      print(email);

      var id = user.uid;
      var name = user.displayName;
      var image = user.photoURL;
      var firstname = user.displayName!.split(" ").first;
      var lastname = user.displayName!.split(" ").last;
      var token = authResult.credential!.accessToken;
      print(token);
      try {
        await signupwithsocial(email!, name!, firstname, lastname, image!, id,
            name, image, token!);
      } catch (e) {
        print(e);
      } finally {
        await query.signinwithsocial(id);
      }
      print(name);

      return true;
    } else {
      return false;
    }
  }

  signupwithsocial(
      String email,
      String fullname,
      String firstname,
      String lastname,
      String image,
      String id,
      String name,
      String profile,
      String token) async {
    try {
      //   isLoading(true);
      GraphQLConfig graphQLConfiguration = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result = await _client.mutate(
        MutationOptions(
          variables: {
            "body": {
              "email": email,
              "fullName": fullname,
              "firstName": firstname,
              "image": image,
              "id": id,
              "lastName": lastname,
              "name": name,
              "profile": profile,
              "token": token
            }
          },
          document: gql(
              r'''
mutation GoogleSignup($body: GoogleSignupInput!) {
  googleSignup(body: $body) {
    _id
  }
}
        '''), // this
        ),
      );

      if (result.hasException) {
        print(result.exception?.graphqlErrors[0].message);
        //   isLoading(false);
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
        //  isLoading(false);
        Get.snackbar('Sucess', 'You are Successfully registered.');
        Get.toNamed(Routes.LOGIN_PAGE);
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
