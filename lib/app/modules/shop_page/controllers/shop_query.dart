import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:styleclub/app/services/variables.dart';
import '../../../services/graphqlConf.dart';
import 'package:get/get.dart';
import 'package:styleclub/app/routes/app_pages.dart';
import 'dart:convert';
import 'package:styleclub/app/services/models/personalize_form.dart';

class StylingClients extends GetConnect {
  String styles1 = '''
query GetUserProductRecommendedAttributes(\$filter: UserSelectionFilterInput) {
  getUserProductRecommendedAttributes(filter: \$filter) {
    _id
    addedByStylist
    deletedByStylist
    isAddedManually
    isDeletedByStylist
    isForMaster
    masterData {
      catId
      image
      name
      note
      personalizeImage
      _id
    }
      palletData {
        colors {
          hashCode
          name
          primaryColorId
          secondaryColorId
          _id
        }
        name
        _id
      }
    master_name
    note
    value
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

  String occasion = """ 

query GetOccasionConfig(\$occasionId: String!) {
  getOccasionConfig(occasionId: \$occasionId) {
    _id
    catIds
    categories {
      _id
      image
      isEnabled
      isEnabledForPersonalize
      label
      name
      personalizeImage
      personalizeNote
      seo {
        altText
        content_description
        h1_tag
        h2_tag
        meta_description
        title
      }
    }
    faqs {
      answer
      question
    }
    label
    name
    occasionType
    seo {
      content_description
      h1_tag
      h2_tag
      meta_description
      title
    }
  }
}
""";

  String looks = '''
        query Looks(\$params: lookFilterInput!, \$page: Int, \$limit: Int) {
  looksFilter(params: \$params, page: \$page, limit: \$limit) {
    looks {
      _id
      description
      images
      isAvailable
      isVirtual
      items
      lId
      name
      openTags
      prefix
      price
      products {
        _id
        altText
        brandId
        care
        catId
        code
        cost
        delivery
        deliveryDays
        description
        discPrice
        discount
        fabricCode
        fabricType
        images
        isAccessory
        isAvailable
        isPer
        isVirtual
        isWithPocket
        name
        occasionId
        occasionIds
        openTags
        pId
        pImgIndx
        pidSerial
        price
        primaryColorId
        producttypeId
        qty
        secondaryColorId
        size
        sortOrder
        subTitle
        title
        virtualURL
        warranty
      }
      sortOrder
      subTitle
      tags {
        catTag
        image
        isModifiable
        isVisible
        label
        name
        value
      }
      title
    }
  }
}
''';
  Future<List<dynamic>> blog() async {
    try {
      ///initializing GraphQLConfig
      GraphQLConfig graphQLConfiguration = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result =
          await _client.query(QueryOptions(document: gql(looks), variables: {
        "page": null,
        "limit": null,
        "params": {
          "filter": {
            "colorIds": null,
            "endPrice": null,
            "looksTypeIds": null,
            "startPrice": null
          }
        }
      }));

      var data = jsonEncode(result.data);
      print(data);

      if (result.hasException) {
        print(result.exception?.graphqlErrors[0].message);
      } else if (result.data != null) {}
      return result.data!["looksFilter"]["looks"];
    } catch (e) {
      Get.snackbar('Error', 'Something Wrong happened');
      return List.empty();
      print(e);
    }
  }

  Future<List<dynamic>> styles() async {
    try {
      ///initializing GraphQLConfig
      GraphQLConfig graphQLConfiguration = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result =
          await _client.query(QueryOptions(document: gql(styles1), variables: {
        "filter": {
          "catId": null,
          "master_name": null,
          "userId": variables.userid
        }
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

  Future<List<dynamic>> ocassion() async {
    try {
      ///initializing GraphQLConfig
      GraphQLConfig graphQLConfiguration = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result = await _client.query(QueryOptions(
          document: gql(occasion),
          variables: {"occasionId": "5fc2677bfa7ff20df01ab8ce"}));

      var data = jsonEncode(result.data);
      print(data);

      if (result.hasException) {
        print(result.exception?.graphqlErrors[0].message);
      } else if (result.data != null) {}
      return result.data!["getOccasionConfig"]["categories"];
    } catch (e) {
      Get.snackbar('Error', 'Something Wrong happened');
      print(e);

      return List.empty();
    }
  }

 

  Future<List<dynamic>> partner() async {
    try {
      ///initializing GraphQLConfig
      GraphQLConfig graphQLConfiguration = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result = await _client.query(QueryOptions(
          document: gql(partners),
          variables: {"filters": {}, "limit": 0, "page": 0}));

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
}
