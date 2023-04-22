// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
    CartModel({
        required this.typename,
        required this.getProductCartByUserId,
    });

    String typename;
    GetProductCartByUserId getProductCartByUserId;

    factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        typename: json["__typename"],
        getProductCartByUserId: GetProductCartByUserId.fromJson(json["getProductCartByUserId"]),
    );

    Map<String, dynamic> toJson() => {
        "__typename": typename,
        "getProductCartByUserId": getProductCartByUserId.toJson(),
    };
}

class GetProductCartByUserId {
    GetProductCartByUserId({
        required this.typename,
        required this.items,
        required this.totalPrice,
        required this.userId,
        required this.totalDiscountedPrice,
        required this.totalDiscount,
        this.note,
        required this.id,
        this.couponCode,
    });

    String typename;
    List<Item> items;
    int totalPrice;
    String userId;
    int totalDiscountedPrice;
    int totalDiscount;
    dynamic note;
    String id;
    dynamic couponCode;

    factory GetProductCartByUserId.fromJson(Map<String, dynamic> json) => GetProductCartByUserId(
        typename: json["__typename"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        totalPrice: json["totalPrice"],
        userId: json["userId"],
        totalDiscountedPrice: json["totalDiscountedPrice"],
        totalDiscount: json["totalDiscount"],
        note: json["note"],
        id: json["_id"],
        couponCode: json["couponCode"],
    );

    Map<String, dynamic> toJson() => {
        "__typename": typename,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "totalPrice": totalPrice,
        "userId": userId,
        "totalDiscountedPrice": totalDiscountedPrice,
        "totalDiscount": totalDiscount,
        "note": note,
        "_id": id,
        "couponCode": couponCode,
    };
}

class Item {
    Item({
        required this.typename,
        required this.amount,
        required this.images,
        required this.itemId,
        required this.name,
        required this.price,
        required this.qty,
        required this.producttypeId,
        this.code,
        required this.size,
        required this.deliveryDays,
        this.couponCode,
        required this.catId,
    });

    String typename;
    int amount;
    List<String> images;
    String itemId;
    String name;
    int price;
    int qty;
    String producttypeId;
    dynamic code;
    String size;
    int deliveryDays;
    dynamic couponCode;
    String catId;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        typename: json["__typename"],
        amount: json["amount"],
        images: List<String>.from(json["images"].map((x) => x)),
        itemId: json["itemId"],
        name: json["name"],
        price: json["price"],
        qty: json["qty"],
        producttypeId: json["producttypeId"],
        code: json["code"],
        size: json["size"],
        deliveryDays: json["deliveryDays"],
        couponCode: json["couponCode"],
        catId: json["catId"],
    );

    Map<String, dynamic> toJson() => {
        "__typename": typename,
        "amount": amount,
        "images": List<dynamic>.from(images.map((x) => x)),
        "itemId": itemId,
        "name": name,
        "price": price,
        "qty": qty,
        "producttypeId": producttypeId,
        "code": code,
        "size": size,
        "deliveryDays": deliveryDays,
        "couponCode": couponCode,
        "catId": catId,
    };
}
