import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:styleclub/app/services/variables.dart';
import '../../../services/graphqlConf.dart';
import 'package:get/get.dart';
import 'package:styleclub/app/routes/app_pages.dart';
import 'dart:convert';
import 'package:styleclub/app/services/models/personalize_form.dart';

class InfluenceClients extends GetConnect {

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

  
}
