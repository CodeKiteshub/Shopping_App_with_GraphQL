import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:styleclub/app/services/variables.dart';
import '../../services/graphqlConf.dart';
import 'package:get/get.dart';
import 'package:styleclub/app/routes/app_pages.dart';
import 'dart:convert';
import 'package:styleclub/app/services/models/personalize_form.dart';

class Hairstyle1 extends GetConnect {
  String branchpartners =
      '''query GetUserProductRecommendedAttributes(\$filter: UserSelectionFilterInput) {
  getUserProductRecommendedAttributes(filter: \$filter) {
    _id
    addedByStylist
    isForMaster
    masterData {
      image
      name
    }
    note
    value
    dateAdded {
      datestamp
      day
      minute
      hour
      month
      timestamp
    }
    master_name
  }
}''';
  String groomingpartners = '''
query GetAllGroomingPartners {
  getAllGroomingPartners {
    _id
    address
    bannerImage
    images
    isAvailable
    name
    note
    phone
    serialNo
    sortOrder
    title
    url
  }
}''';

  Future<List<dynamic>> grooming() async {
    try {
      ///initializing GraphQLConfig
      GraphQLConfig graphQLConfiguration = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result = await _client
          .query(QueryOptions(document: gql(branchpartners), variables: {
        "filter": {"userId": "${variables.userid}"}
      }));

      var data = jsonEncode(result.data);
      print(data);

      if (result.hasException) {
        print(result.exception?.graphqlErrors[0].message);
      } else if (result.data != null) {}
      return result.data!["getUserProductRecommendedAttributes"];
    } catch (e) {
      Get.snackbar('Error', 'Something Wrong happened');
      return List.empty();
      print(e);
    }
  }
  Future<List<dynamic>>groomingpartner() async{
     try {
      ///initializing GraphQLConfig
      GraphQLConfig graphQLConfiguration = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result = await _client
          .query(QueryOptions(document: gql(groomingpartners),));

      var data = jsonEncode(result.data);
      print(data);

      if (result.hasException) {
        print(result.exception?.graphqlErrors[0].message);
      } else if (result.data != null) {}
      return result.data!["getAllGroomingPartners"];
    } catch (e) {
      Get.snackbar('Error', 'Something Wrong happened');
      return List.empty();
      print(e);
    }
  }
}
