import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:styleclub/app/modules/grooming_page/grooming_query.dart';
import 'package:styleclub/app/services/variables.dart';
import 'dart:developer';
import '../../../services/graphqlConf.dart';
import '../../../services/models/allpostmodel.dart';
import '../../../services/models/usergroomingrcmnd.dart';

class GroomingPageController extends GetxController
    with GetTickerProviderStateMixin {
  //TODO: Implement GroomingPageController

  final count = 0.obs;
  RxInt postpage = 1.obs;
  RxBool isLoading = false.obs;
  AllpostModel? allpostdata;
  late final TabController tabController =
      TabController(length: 4, vsync: this);
  Usergroomingrcmnd? tophaircutdata;
  String trendinghaircuts = """ 
query GetUserGroomingRecommendedAttributes(\$filter: UserSelectionFilterInput) {
  getUserGroomingRecommendedAttributes(filter: \$filter) {
    _id
    addedByStylist
    deletedByStylist
    isAddedManually
    isDeletedByStylist
    isForMaster
    masterData {
      _id
      catId
      image
      name
      note
      personalizeImage
      sortOrder
    }
    master_name
    note
    palletData {
      colors {
        _id
        hashCode
        name
        primaryColorId
        secondaryColorId
      }
      _id
      name
    }
    value
  }
}

      """;

  String allposts = """
query GetPostsByFilter(\$page: Int!, \$limit: Int!, \$filter: PostFilterInput) {
  getPostsByFilter(page: \$page, limit: \$limit, filter: \$filter) {
    totalCount
    posts {
      _id
      note
      heading
      imageOrVideo {
        isVideo
        note
        url
      }
    }
  }
}
""";
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

  getallpost(int pageno) async {
    try {
      isLoading(true);
      GraphQLConfig graphQLConfiguration = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result = await _client.query(QueryOptions(
          document: gql(allposts),
          variables: {"page": pageno, "limit": 10, "filter": {}}));

      var data = jsonEncode(result.data);
      print(data);

      if (result.hasException) {
        print(result.exception?.graphqlErrors[0].message);
        isLoading(true);
      } else if (result.data != null) {
        if (pageno > 1) {
          var jsonList = (result.data!["getPostsByFilter"]["posts"] as List)
              .map((e) => Post.fromJson(e))
              .toList();

          // var json = Post.fromJson(jsonList);
          print(jsonList);

          allpostdata!.getPostsByFilter.posts.addAll(jsonList);
          isLoading(true);
        } else {
          allpostdata = allpostModelFromJson(data);
          isLoading(true);
        }
      } else {}
    } catch (e) {
      print(e);
      isLoading(true);
    }
  }

  tophaircuts() async {
    try {
      isLoading(true);

      GraphQLConfig graphQLConfiguration = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result = await _client
          .query(QueryOptions(document: gql(trendinghaircuts), variables: {
        "filter": {
          "userId": variables.userid,
          "catId": "615477102dacb312bc63159a"
        }
      }));

      var data = jsonEncode(result.data);
      print(data);

      if (result.hasException) {
        print(result.exception?.graphqlErrors[0].message);
        isLoading(true);
      } else if (result.data != null) {
        tophaircutdata = usergroomingrcmndFromJson(data);
        isLoading(true);
      } else {}
    } catch (e) {
      print(e);
      isLoading(true);
    }
  }

  void increment() => count.value++;
}

class GroomingPartners extends GetxController with StateMixin<List<dynamic>> {
  @override
  void onInit() {
    super.onInit();
    Grooming1().grooming().then((value) {
      log("success");

      change(value, status: RxStatus.success());
    }, onError: (error) {

      log("error");

      change(error, status: RxStatus.error(error.toString()));
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

class GroomingStyles extends GetxController with StateMixin<List<dynamic>> {
  @override
  void onInit() {
    super.onInit();
    Grooming1().style().then((value) {
      change(value, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

class GroomingStyles2 extends GetxController with StateMixin<List<dynamic>> {
  @override
  void onInit() {
    super.onInit();
    Grooming1().style2().then((value) {
      change(value, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

class GroomingStyles3 extends GetxController with StateMixin<List<dynamic>> {
  @override
  void onInit() {
    super.onInit();
    Grooming1().trending().then((value) {
      change(value, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
