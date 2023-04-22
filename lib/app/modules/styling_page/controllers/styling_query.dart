import 'dart:math';
import 'dart:developer' as dev;
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:styleclub/app/modules/styling_page/controllers/category.dart';
import 'package:styleclub/app/services/variables.dart';
import '../../../services/graphqlConf.dart';
import 'package:get/get.dart';
import 'package:styleclub/app/routes/app_pages.dart';
import 'dart:convert';
import 'package:styleclub/app/services/models/personalize_form.dart';

import 'styling_page_controller.dart';

class StylingClients extends GetConnect {
  StylingPageController stylingPageController =
      Get.put(StylingPageController());
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
  String shirt = '''
query Category(\$catId: String!) {
  getCategoryConfig(catId: \$catId) {
    category {
      seo {
        content_description
        meta_description
        title
      }
      image
      name
      personalizeNote
      personalizeImage
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

  String productfilter = """

query ProductsFilter(\$params: ProductFilter!, \$limit: Int, \$page: Int) {
  productsFilter(params: \$params, limit: \$limit, page: \$page) {
    products {
      _id
      category {
        personalizeNote
        personalizeImage
        name
        label
        isEnabledForPersonalize
        isEnabled
        image
        _id
      }
      cost
      delivery
      deliveryDays
      discPrice
      discount
      description
      images
      isAccessory
      name
      price
      primaryColorId
      qty
      title
    }
  }
}

""";

  String categories1 = '''
     query GetAllOccasions {
  getAllOccasions {
    categories {
      _id
      image
      isEnabled
      isEnabledForPersonalize
      label
      name
      personalizeImage
      personalizeNote
    }
    _id
    name
    label
    occasionType
    faqs {
      answer
      question
    }
  }
}
''';

  Future<List<dynamic>> categories() async {
    try {
      ///initializing GraphQLConfig
      GraphQLConfig graphQLConfiguration = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result =
          await _client.query(QueryOptions(document: gql(categories1)));

      var data = jsonEncode(result.data);
      print(data);

      if (result.hasException) {
        print(result.exception?.graphqlErrors[0].message);
      } else if (result.data != null) {}

      return result.data!["getAllOccasions"];
    } catch (e) {
      print(e);

      Get.snackbar('Error', 'Something Wrong happened');
      return List.empty();
    }
  }

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

  Future<Personalize> shirts() async {
    try {
      ///initializing GraphQLConfig
      GraphQLConfig graphQLConfiguration = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result = await _client.query(QueryOptions(
          document: gql(shirt),
          variables: {"catId": "5da7220571762c2a58b27a65"}));

      var data = jsonEncode(result.data);
      print(data);

      if (result.hasException) {
        print(result.exception?.graphqlErrors[0].message);
      } else if (result.data != null) {}
      return dealsFromJson(jsonEncode(result.data));
    } catch (e) {
      Get.snackbar('Error', 'Something Wrong happened');
      return Future.error(Exception("error occured"));
    }
  }

  Future<Personalize> trousers() async {
    try {
      ///initializing GraphQLConfig
      GraphQLConfig graphQLConfiguration = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result = await _client.query(QueryOptions(
          document: gql(shirt),
          variables: {"catId": "5da7220571762c2a58b27a67"}));

      var data = jsonEncode(result.data);
      print(data);

      if (result.hasException) {
        print(result.exception?.graphqlErrors[0].message);
      } else if (result.data != null) {}
      return dealsFromJson(jsonEncode(result.data));
    } catch (e) {
      Get.snackbar('Error', 'Something Wrong happened');
      return Future.error(Exception("error occured"));
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

  Future<List<dynamic>> partner(String brandid, int page) async {
    try {
      ///initializing GraphQLConfig
      GraphQLConfig graphQLConfiguration = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result =
          await _client.query(QueryOptions(document: gql(partners), variables: {
        "filters": {"brandPartnerCategoryIds": brandid},
        "limit": 4,
        "page": page
      }));

      var data = jsonEncode(result.data);
      print(data);
      if (result.hasException) {
        print(result.exception?.graphqlErrors[0].message);
        return List.empty();
      } else if (result.data != null) {
        if (page > 1) {
          dev.log(stylingPageController.partnerlist.value.length.toString());

          stylingPageController.partnerlist.value
              .addAll(result.data!["getAllBrandPartners"]["brandPartners"]);
          dev.log(stylingPageController.partnerlist.value.length.toString());

          return stylingPageController.partnerlist.value;
        } else {
          stylingPageController.partnerlist.value =
              result.data!["getAllBrandPartners"]["brandPartners"];
          return stylingPageController.partnerlist.value;
        }
      } else {
        return List.empty();
      }
    } catch (e) {
      Get.snackbar('Error', 'Something Wrong happened');
      print(e);
      return List.empty();
    }
  }

 Future<List<dynamic>> getproducts(String? id, int page) async {
    try {
      ///initializing GraphQLConfig
      GraphQLConfig graphQLConfiguration = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result = await _client
          .query(QueryOptions(document: gql(productfilter), variables: {
        "params": {
          "occasionId": "5fc2677bfa7ff20df01ab8ce",
          "catIds": "5da7220571762c2a58b27a65"
        },
        "limit": 10,
        "page": 1
      }));

      var data = jsonEncode(result.data);
      print(data);
      if (result.hasException) {
        print(result.exception?.graphqlErrors[0].message);
        return List.empty();
      } else if (result.data != null) {
        if (page > 1) {
          dev.log(stylingPageController.partnerlist.value.length.toString());

          stylingPageController.allproducts.value
              .addAll(result.data!["productsFilter"]["products"]);

          return stylingPageController.allproducts.value;
        } else {
          stylingPageController.allproducts.value =
              result.data!["productsFilter"]["products"];
          return stylingPageController.allproducts.value;
        }
      } else {
        return List.empty();
      }
    } catch (e) {
      print(e);
      return List.empty();
    }
  }
}
