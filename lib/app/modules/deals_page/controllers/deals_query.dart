import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:styleclub/app/modules/deals_page/controllers/deals.dart';
import 'package:styleclub/app/services/variables.dart';
import '../../../services/graphqlConf.dart';
import 'package:get/get.dart';
import 'package:styleclub/app/routes/app_pages.dart';
import 'dart:convert';
import 'package:styleclub/app/services/models/personalize_form.dart';

class Deal extends GetConnect {
  String deals = '''
     query GetUserDealsAndVoucher(\$userId: ID) {
  getUserDealsAndVoucher(userId: \$userId) {
    activeVoucherCount
    totalMoneySaved
    totalVoucherCount
    vouchers {
      image
      note
      isRedeemed
      redeemedCount
      title 
    }
  }
}
''';
  Future<Deals> deal() async {
    try {
      ///initializing GraphQLConfig
      GraphQLConfig graphQLConfiguration = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result = await _client.query(QueryOptions(
          document: gql(deals), variables: {"userId": variables.userid}));

      var data = jsonEncode(result.data);
      print(data);

      if (result.hasException) {
        print(result.exception?.graphqlErrors[0].message);
      } else if (result.data != null) {}
      return dealsFromJson(jsonEncode(result.data));
    } catch (e) {
      Get.snackbar('Error', 'Something Wrong happened');
      return Future.error(Exception("error occured"));
      print(e);
    }
  }
}
