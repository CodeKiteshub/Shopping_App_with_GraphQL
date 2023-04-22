import 'dart:convert';
import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../../services/graphqlConf.dart';
import '../../../services/models/lookconfigmodel.dart';
import '../../../services/models/looksfiltermodel.dart';
import 'styling_query.dart';

class StylingPageController extends GetxController
    with GetTickerProviderStateMixin {
  //TODO: Implement StylingPageController
  RxList partnerlist = [].obs;
  RxList allproducts = [].obs;
  Rx<LooksfilterModel> looksfilterdata =
      Rx<LooksfilterModel>(LooksfilterModel());
  RxList<Look> look = <Look>[].obs;
  RxInt looklength = 0.obs;
  LookconfigModel? lookconfigdata;
  final count = 0.obs;
  RxBool isLoading = false.obs;



  String lookconfig = """

query LooksTypeFilters {
  getLookConfig {
    topFilters {
      looksTypeFilters {
        _id
        catId
        image
        name
      }
    }
  }
}
""";

  String looksfilter = """ 
query LooksFilter(\$params: lookFilterInput!, \$limit: Int, \$page: Int) {
  looksFilter(params: \$params, limit: \$limit, page: \$page) {
    looks {
      _id
      description
      images
      isAvailable
      isVirtual
      items
      name
      products {
        _id
        brand {
          _id
          image
          name
        }
        brandId
        care
        catId
        category {
          _id
          image
          isEnabled
          isEnabledForPersonalize
          label
          name
          personalizeImage
          personalizeNote
        }
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
        pImgIndx
        pidSerial
        price
        primaryColorId
        qty
        size
        subTitle
        title
        warranty
        fabric {
          _id
          image
          name
          note
          personalizeImage
        }
        pId
      }
      subTitle
      title
      price
    }
    totalLooksCount
  }
}
""";

  late final TabController tabController =
      TabController(length: 5, vsync: this);
  @override
  void onInit() {
    Future(() => getlookconfig()).then((_) => getlooksfilter(null, 1));

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

  getlooksfilter(String? id, int page) async {
    try {
      isLoading(true);

      ///initializing GraphQLConfig
      GraphQLConfig graphQLConfiguration = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result = await _client
          .query(QueryOptions(document: gql(looksfilter), variables: {
        "params": {
          "filter": {"looksTypeIds": id}
        },
        "limit": 10,
        "page": page
      }));

      var data = jsonEncode(result.data);
      print(data);

      if (result.hasException) {
        print(result.exception?.graphqlErrors[0].message);
      } else if (result.data != null) {
        if (page > 1) {
          var jsonList = (result.data!["looksFilter"]["looks"] as List)
              .map((e) => Look.fromJson(e))
              .toList();

          looklength.value = looklength.value + jsonList.length;
          looksfilterdata.value.looksFilter!.looks.addAll(jsonList);
          update();
          notifyChildrens();
          isLoading(false);
        } else {
          looksfilterdata.value = looksfilterModelFromJson(data);
          looklength.value = looksfilterdata.value.looksFilter!.looks.length;
        }
      }
      isLoading(false);
    } catch (e) {
      isLoading(false);
      print(e);
    }
  }

  getlookconfig() async {
    try {
      ///initializing GraphQLConfig
      GraphQLConfig graphQLConfiguration = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result =
          await _client.query(QueryOptions(document: gql(lookconfig)));

      var data = jsonEncode(result.data);
      print(data);

      if (result.hasException) {
        print(result.exception?.graphqlErrors[0].message);
      } else if (result.data != null) {
        lookconfigdata = lookconfigModelFromJson(data);
      }
    } catch (e) {
      print(e);
    }
  }

  void increment() => count.value++;
}

class LooksProducts extends GetxController with StateMixin<List<dynamic>> {
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    refresh1();
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
  void refresh1() {
    StylingClients().blog().then((value) {
      change(value, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }
}

class StyleProducts extends GetxController with StateMixin<List<dynamic>> {
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    refresh1();
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
  void refresh1() {
    StylingClients().styles().then((value) {
      change(value, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }
}

class StylePratners extends GetxController with StateMixin<List<dynamic>> {
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    refresh1(1);
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
  refresh1(int page) {
    StylingClients().partner("63787bc2b9c9ff547e981304", page).then((value) {
      change(value, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }
}

class StylePratners2 extends GetxController with StateMixin<List<dynamic>> {
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    refresh1(1);
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
  refresh1(int page) {
    StylingClients().partner("6006f48dd47a4914dcd7ea79", page).then((value) {
      change(value, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }
}

class StyleOccassion extends GetxController with StateMixin<List<dynamic>> {
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    refresh1();
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
  void refresh1() {
    StylingClients().categories().then((value) {
      change(value, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }
}




class StyleAllproducts extends GetxController with StateMixin<List<dynamic>> {
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    refresh1();
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
  void refresh1() {
    StylingClients().getproducts(null, 1).then((value) {
      change(value, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }
}

