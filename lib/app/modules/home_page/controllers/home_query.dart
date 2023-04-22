import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:styleclub/app/services/variables.dart';
import '../../../services/graphqlConf.dart';
import 'package:get/get.dart';
import 'package:styleclub/app/routes/app_pages.dart';
import 'dart:convert';
import 'package:styleclub/app/services/models/personalize_form.dart';

class HomeClients extends GetConnect {
  String blogs = '''
         query Blogs {
  getAllBlogs {
    blogs {
      _id
      name
      title
      note
      images
    }
  }
}
''';
String partners = '''
       query GetAllBrandPartners(\$filters: BrandPartnersFilterInput, \$limit: Int!, \$page: Int!) {
  getAllBrandPartners(filters: \$filters, limit: \$limit, page: \$page) {
    brandPartners {
      name
      imageAndVideos {
        url
        isVideo
        note
      }
      title
      note
      _id
      brandPartnerCategoryId
    }
  }
}
''';
String branches = '''
      query GetAllBrandPartnerBranches(\$filters: BrandPartnerBranchFilterInput, \$limit: Int!, \$page: Int!) {
  getAllBrandPartnerBranches(filters: \$filters, limit: \$limit, page: \$page) {
    brandPartnerBranches {
      city {
        isAvailable
      }
      name
      offers {
        code
        name
        note
        sortOrder
        title
      }
      banner {
        isVideo
        note
        sortOrder
        type
        url
      }
    }
  }
}
''';
  Future<List<dynamic>> blog() async {
    try {
      ///initializing GraphQLConfig
      GraphQLConfig graphQLConfiguration = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result = await _client.query(QueryOptions(
        document: gql(blogs),
      ));

      var data = jsonEncode(result.data);
      print(data);

      if (result.hasException) {
        print(result.exception?.graphqlErrors[0].message);
      } else if (result.data != null) {}
      return result.data!["getAllBlogs"]["blogs"];
    } catch (e) {
      Get.snackbar('Error', 'Something Wrong happened');
      return List.empty();
      print(e);
    }
  }
  Future<List<dynamic>> partner() async {
    try {
      ///initializing GraphQLConfig
      GraphQLConfig graphQLConfiguration = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result = await _client.query(QueryOptions(
        document: gql(partners),
         variables: {
  "filters": {
 
  },
  "limit": 0,
  "page": 0
}
      ));

      var data = jsonEncode(result.data);
      print(data);

      if (result.hasException) {
        print(result.exception?.graphqlErrors[0].message);
      } else if (result.data != null) {}
      return result.data!["getAllBrandPartners"]["brandPartners"];
    } catch (e) {
      Get.snackbar('Error', 'Something Wrong happened');
      return List.empty();
      print(e);
    }
  }
  Future<List<dynamic>> branch() async {
    try {
      ///initializing GraphQLConfig
      GraphQLConfig graphQLConfiguration = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result = await _client.query(QueryOptions(
        document: gql(branches),
         variables: {
  "filters": {
 
  },
  "limit": 0,
  "page": 0
}
      ));

      var data = jsonEncode(result.data);
      print(data);

      if (result.hasException) {
        print(result.exception?.graphqlErrors[0].message);
      } else if (result.data != null) {}
      return result.data!["getAllBrandPartnerBranches"]["brandPartnerBranches"];
    } catch (e) {
      Get.snackbar('Error', 'Something Wrong happened');
      return List.empty();
      print(e);
    }
  }

}
