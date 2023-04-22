import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:styleclub/app/services/variables.dart';
import '../../services/graphqlConf.dart';
import 'package:get/get.dart';
import 'package:styleclub/app/routes/app_pages.dart';
import 'dart:convert';
import 'package:styleclub/app/services/models/personalize_form.dart';

class Grooming1 extends GetConnect {
  String branchpartners =
      '''query GetAllBrandPartnerBranches(\$filters: BrandPartnerBranchFilterInput, \$limit: Int!, \$page: Int!) {
  getAllBrandPartnerBranches(filters: \$filters, limit: \$limit, page: \$page) {
    brandPartnerBranches {
      _id
      address
      banner {
        url
        isVideo
      }
      brandPartnerBranchNo
      brandPartnerCategoryId
      brandPartnerId
      cityId
      countryCode
      emailId
      googlePageLink
      googleRating
      hoursOpen
      isAvailable
      name
      note
      personName
      phone
      phone2
      prefix
      serviceableCityIds
      sortOrder
      title
    }
    totalCount
  }
}''';
  String styles = '''

query GetUserGroomingRecommendedAttributes(\$filter: UserSelectionFilterInput) {
  getUserGroomingRecommendedAttributes(filter: \$filter) {
    _id
    masterData {
      _id
      catId
      image
      name
      note
      personalizeImage
      sortOrder
    }
  }
}
''';

  String trend = """ 
query GetCelebrities(\$limit: Int, \$page: Int, \$params: CelebrityFilters) {
  getCelebrities(limit: \$limit, page: \$page, params: \$params) {
    celebrities {
      images
      title
    }
    totalCount
  }
}
""";

  Future<List<dynamic>> grooming() async {
    try {
      ///initializing GraphQLConfig
      GraphQLConfig graphQLConfiguration = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result = await _client
          .query(QueryOptions(document: gql(branchpartners), variables: {
        "filters": {"brandPartnerCategoryIds": "63787b3bb9c9ff547e981302"},
        "limit": 0,
        "page": 0
      }));

      var data = jsonEncode(result.data);
   //   print(data);

      if (result.hasException) {
        print(result.exception?.graphqlErrors[0].message);
        return List.empty();
      } else if (result.data != null) {
        return result.data!["getAllBrandPartnerBranches"]
            ["brandPartnerBranches"];
      } else {
        return List.empty();
      }
    } catch (e) {
      Get.snackbar('Error', 'Something Wrong happened');

      print(e);

      return List.empty();
    }
  }

  Future<List<dynamic>> style() async {
    try {
      ///initializing GraphQLConfig
      GraphQLConfig graphQLConfiguration = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result =
          await _client.query(QueryOptions(document: gql(styles), variables: {
        "filter": {
          "userId": variables.userid,
          "master_name": "master_beardstyle"
        }
      }));

      var data = jsonEncode(result.data);
      print(data);

      if (result.hasException) {
        print(result.exception?.graphqlErrors[0].message);
      } else if (result.data != null) {}
      return result.data!["getUserGroomingRecommendedAttributes"];
      ;
    } catch (e) {
      Get.snackbar('Error', 'Something Wrong happened');
      return List.empty();
      print(e);
    }
  }

  Future<List<dynamic>> style2() async {
    try {
      ///initializing GraphQLConfig
      GraphQLConfig graphQLConfiguration = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result =
          await _client.query(QueryOptions(document: gql(styles), variables: {
        "filter": {
          "userId": variables.userid,
          "master_name": "master_hairstyle"
        }
      }));

      var data = jsonEncode(result.data);
      print(data);

      if (result.hasException) {
        print(result.exception?.graphqlErrors[0].message);
      } else if (result.data != null) {}
      return result.data!["getUserGroomingRecommendedAttributes"];
      ;
    } catch (e) {
      Get.snackbar('Error', 'Something Wrong happened');
      return List.empty();
      print(e);
    }
  }

  Future<List<dynamic>> trending() async {
    try {
      ///initializing GraphQLConfig
      GraphQLConfig graphQLConfiguration = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result =
          await _client.query(QueryOptions(document: gql(trend), variables: {
        "limit": null,
        "page": null,
        "params": {
          "beardStyleIds": null,
          "faceShapeId": null,
          "hairStyleIds": null
        }
      }));

      var data = jsonEncode(result.data);
      print(data);

      if (result.hasException) {
        print(result.exception?.graphqlErrors[0].message);
      } else if (result.data != null) {}
      return result.data!["getCelebrities"]["celebrities"];
      ;
    } catch (e) {
      Get.snackbar('Error', 'Something Wrong happened');
      print(e);
      return List.empty();
    }
  }
}
