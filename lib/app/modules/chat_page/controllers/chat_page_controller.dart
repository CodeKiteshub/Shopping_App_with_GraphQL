import 'dart:convert';

import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../../services/graphqlConf.dart';
import '../../../services/models/stylishModel.dart';
import 'chat_query.dart';

class ChatPageController extends GetxController {
  //TODO: Implement ChatPageController
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    style();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
  StylistModel? stylistData;
  String stylist = '''
query GetAllStylists {
  getAllStylists {
    _id
    email
    image
    isEnabled
    name
    note
    phone
    roleIdentifier
    sortOrder
    userId
  }
}
''';
  Future<List<dynamic>> style() async {
    try {
      ///initializing GraphQLConfig
      GraphQLConfig graphQLConfiguration = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result = await _client.query(QueryOptions(
        document: gql(stylist),
      ));

      var data = jsonEncode(result.data);
      print(data);

      if (result.hasException) {
        print(result.exception?.graphqlErrors[0].message);
      } else if (result.data != null) {
        stylistData = stylistModelFromJson(data);
      }
      return result.data!["getAllStylists"];
    } catch (e) {
      Get.snackbar('Error', 'Something Wrong happened');
      return List.empty();
      print(e);
    }
  }
}
