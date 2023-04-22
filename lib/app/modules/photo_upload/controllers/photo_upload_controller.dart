import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:styleclub/app/services/models/bodymodel.dart';
import 'package:styleclub/app/services/queryQuery.dart';
import 'package:styleclub/app/services/variables.dart';

import '../../../services/graphqlConf.dart';

class PhotoUploadController extends GetxController {
  //TODO: Implement PhotoUploadController

  final count = 0.obs;
  Bodymodel? bodydata;
  ApiClients query = ApiClients();
  String bodyprofile = """ 
query GetBodyProfile(\$userId: String!) {
  getBodyProfile(userId: \$userId) {
    backPicture
    frontPicture
    sidePicture
  }
}


  """;
  @override
  void onInit() {
    getbodyimages();
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

  gengrooming() async {
    try {
      GraphQLConfig graphQLConfiguration = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result = await _client.mutate(
        MutationOptions(
          variables: {"userId": variables.userid},
          document: gql(r'''
     mutation GenerateGroomingRecommendedAttributes($userId: String!) {
  generateGroomingRecommendedAttributes(userId: $userId)
}
        '''), // this
        ),
      );
      if (result.hasException) {
        print("erroroccured");
        print(result.exception?.graphqlErrors[0].message);
      } else if (result.data != null) {
        log(result.data.toString());
        log("generated...1");
      } else {}
    } catch (e) {
      log(e.toString());
    }
  }

genproduct() async {
    try {
      GraphQLConfig graphQLConfiguration = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result = await _client.mutate(
        MutationOptions(
          variables: {"userId": variables.userid},
          document: gql(r'''
   mutation GenerateProductRecommendedAttributes($userId: String!) {
  generateProductRecommendedAttributes(userId: $userId)
}
        '''), // this
        ),
      );
      if (result.hasException) {
        print("erroroccured");
        print(result.exception?.graphqlErrors[0].message);
      } else if (result.data != null) {
        log(result.data.toString());
        log("generated...2");
      } else {}
    } catch (e) {
      log(e.toString());
    }
  }




  getbodyimages() async {
    GraphQLConfig graphQLConfiguration = GraphQLConfig();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult result = await _client.query(
      QueryOptions(
          document: gql(bodyprofile), variables: {"userId": variables.userid}),
    );
    print(result);

    if (result.hasException) {
      print(result.exception?.graphqlErrors[0]?.message);
    } else if (result.data != null) {
      var body = jsonEncode(result.data);
      print(body);

      bodydata = bodymodelFromJson(body);
    }
  }

  void increment() => count.value++;
}
