import 'dart:convert';

import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:styleclub/app/modules/cart_page/controllers/cart_query.dart';
import 'package:styleclub/app/services/graphqlConf.dart';
import 'package:styleclub/app/services/variables.dart';

import '../../../services/models/cartmodel.dart';

class CartPageController extends GetxController {
  //TODO: Implement CartPageController

  final count = 0.obs;
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

  void increment() => count.value++;

  RxBool isLoading = true.obs;
  CartModel? cartdata;
  String stylist = '''
query GetProductCartByUserId(\$userId: String!) {
  getProductCartByUserId(userId: \$userId) {
    items {
      amount
      images
      itemId
      name
      price
      qty
      producttypeId
      code
      size
      deliveryDays
      couponCode
      catId
    }
    totalPrice
    userId
    totalDiscountedPrice
    totalDiscount
    note
    _id
    couponCode
  }
}
''';

  String couponquery = """ 
query ValidateServiceCoupons(\$userId: String!, \$couponCode: String!) {
  validateCoupons(userId: \$userId, couponCode: \$couponCode) {
    items {
      amount
      itemId
      images
      price
      producttypeId
      qty
      name
      codea
      size
      deliveryDays
      couponCode
      catId
    }
    userId
    totalPrice
    totalDiscountedPrice
    totalDiscount
    note
    couponCode
    _id
  }
}
 """;
  cart() async {
    try {
      print(variables.userid);
      isLoading(true);

      ///initializing GraphQLConfig
      GraphQLConfig graphQLConfiguration = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result = await _client.query(QueryOptions(
          document: gql(stylist), variables: {"userId": variables.userid}));

      if (result.hasException) {
        print(result.exception?.graphqlErrors[0].message);
        isLoading(false);
      } else if (result.data != null) {
        var data = jsonEncode(result.data);
        print(data);

        cartdata = cartModelFromJson(data);
        print("cartid....${result.data!["getProductCartByUserId"]["_id"]}");
        isLoading(false);
      }
    } catch (e) {
      Get.snackbar('Error', 'Something Wrong happened');
      isLoading(false);
      print(e);
    }
  }

  cartupdate(String cartId, String itemid, int qty) async {
    try{

      isLoading(true);

    GraphQLConfig graphQLConfiguration = GraphQLConfig();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult result = await _client.mutate(
      MutationOptions(
        variables: {"cartId": cartId, "itemId": itemid, "quantity": qty},
        document: gql(r'''
   mutation UpdateItemQuantityInUserCart($cartId: String!, $itemId: String!, $quantity: Int!) {
  updateItemQuantityInUserCart(cartId: $cartId, itemId: $itemId, quantity: $quantity) {
    _id
    items {
      itemId
      name
      amount
      code
      images
      isPer
      price
      qty
    }
  }
}
        '''), // this
      ),
    );

    if (result.hasException) {
      print(result.exception?.graphqlErrors[0].message);
      isLoading(false);
    } else if (result.data != null) {
      var data = jsonEncode(result.data);
      print(data);

      isLoading(false);
    }
    }

     catch (e) {
      Get.snackbar('Error', 'Something Wrong happened');
      isLoading(false);
      print(e);
    }
  }

  validatecoupon(String coupon) async {
try{

      isLoading(true);

      ///initializing GraphQLConfig
      GraphQLConfig graphQLConfiguration = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result = await _client.query(QueryOptions(
          document: gql(couponquery), variables: {
  "userId": variables.userid,
  "couponCode": coupon
}));


      if (result.hasException) {
        print(result.exception?.graphqlErrors[0].message);
        isLoading(false);
      } else if (result.data != null) {
        var data = jsonEncode(result.data);
        print(data);

        cartdata = cartModelFromJson(data);
      
        isLoading(false);
      }

}
 catch (e) {
      Get.snackbar('Error', 'Something Wrong happened');
      isLoading(false);
      print(e);
    }
  }
}
