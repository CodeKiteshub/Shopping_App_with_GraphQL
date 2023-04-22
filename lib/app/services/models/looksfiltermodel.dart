// To parse this JSON data, do
//
//     final looksfilterModel = looksfilterModelFromJson(jsondynamic);

import 'dart:convert';

LooksfilterModel looksfilterModelFromJson(dynamic str) => LooksfilterModel.fromJson(json.decode(str));

dynamic looksfilterModelToJson(LooksfilterModel data) => json.encode(data.toJson());

class LooksfilterModel {
    LooksfilterModel({
         this.typename,
         this.looksFilter,
    });

    dynamic typename;
    LooksFilter? looksFilter;

    factory LooksfilterModel.fromJson(Map<dynamic, dynamic> json) => LooksfilterModel(
        typename: json["__typename"],
        looksFilter: LooksFilter.fromJson(json["looksFilter"]),
    );

    Map<dynamic, dynamic> toJson() => {
        "__typename": typename,
        "looksFilter": looksFilter!.toJson(),
    };
}

class LooksFilter {
    LooksFilter({
        required this.typename,
        required this.looks,
        required this.totalLooksCount,
    });

    dynamic typename;
    List<Look> looks;
    dynamic totalLooksCount;

    factory LooksFilter.fromJson(Map<dynamic, dynamic> json) => LooksFilter(
        typename: json["__typename"],
        looks: List<Look>.from(json["looks"].map((x) => Look.fromJson(x))),
        totalLooksCount: json["totalLooksCount"],
    );

    Map<dynamic, dynamic> toJson() => {
        "__typename": typename,
        "looks": List<dynamic>.from(looks.map((x) => x.toJson())),
        "totalLooksCount": totalLooksCount,
    };
}

class Look {
    Look({
        required this.typename,
        required this.id,
        required this.description,
        required this.images,
        required this.isAvailable,
        required this.isVirtual,
        required this.items,
        required this.name,
        required this.products,
        this.subTitle,
        required this.title,
        required this.price,
    });

    dynamic typename;
    dynamic id;
    dynamic description;
    List<dynamic> images;
    bool isAvailable;
    bool isVirtual;
    List<dynamic> items;
    dynamic name;
    List<Product> products;
    dynamic subTitle;
    dynamic title;
    dynamic price;

    factory Look.fromJson(Map<dynamic, dynamic> json) => Look(
        typename: lookTypenameValues.map[json["__typename"]],
        id: json["_id"],
        description: json["description"],
        images: List<dynamic>.from(json["images"].map((x) => x)),
        isAvailable: json["isAvailable"],
        isVirtual: json["isVirtual"],
        items: List<dynamic>.from(json["items"].map((x) => x)),
        name: json["name"],
        products: List<Product>.from(json["products"].map((x) => x == null ? null : Product.fromJson(x))),
        subTitle: json["subTitle"],
        title: json["title"],
        price: json["price"],
    );

    Map<dynamic, dynamic> toJson() => {
        "__typename": lookTypenameValues.reverse[typename],
        "_id": id,
        "description": description,
        "images": List<dynamic>.from(images.map((x) => x)),
        "isAvailable": isAvailable,
        "isVirtual": isVirtual,
        "items": List<dynamic>.from(items.map((x) => x)),
        "name": name,
        "products": List<dynamic>.from(products.map((x) => x?.toJson())),
        "subTitle": subTitle,
        "title": title,
        "price": price,
    };
}

class Product {
    Product({
        required this.typename,
        required this.id,
        this.brand,
        this.brandId,
        this.care,
        required this.catId,
        required this.category,
        required this.code,
        required this.cost,
        this.delivery,
        required this.deliveryDays,
        required this.description,
        required this.discPrice,
        required this.discount,
        required this.fabricCode,
        this.fabricType,
        required this.images,
        this.isAccessory,
        required this.isAvailable,
        required this.isPer,
        this.isVirtual,
        required this.isWithPocket,
        required this.name,
        required this.occasionId,
        required this.occasionIds,
        required this.pImgIndx,
        required this.pidSerial,
        required this.price,
        required this.primaryColorId,
        required this.qty,
        required this.size,
        this.subTitle,
        required this.title,
        required this.warranty,
        this.fabric,
        required this.pId,
    });

    dynamic typename;
    dynamic id;
    dynamic brand;
    dynamic brandId;
    dynamic care;
    dynamic catId;
    dynamic category;
    dynamic code;
    dynamic cost;
    dynamic delivery;
    dynamic deliveryDays;
    dynamic description;
    dynamic discPrice;
    dynamic discount;
    dynamic fabricCode;
    dynamic fabricType;
    List<dynamic> images;
    dynamic isAccessory;
    bool isAvailable;
    bool isPer;
    dynamic isVirtual;
    bool isWithPocket;
    dynamic name;
    dynamic occasionId;
    List<dynamic> occasionIds;
    dynamic pImgIndx;
    dynamic pidSerial;
    dynamic price;
    dynamic primaryColorId;
    dynamic qty;
    dynamic size;
    dynamic subTitle;
    dynamic title;
    dynamic warranty;
    dynamic fabric;
    dynamic pId;

    factory Product.fromJson(Map<dynamic, dynamic> json) => Product(
        typename: productTypenameValues.map[json["__typename"]],
        id: json["_id"],
        brand: json["brand"],
        brandId: brandIdValues.map[json["brandId"]],
        care: json["care"],
        catId: catIdValues.map[json["catId"]],
        category: Category.fromJson(json["category"]),
        code: json["code"],
        cost: json["cost"]?.toDouble(),
        delivery: deliveryValues.map[json["delivery"]],
        deliveryDays: json["deliveryDays"],
        description: json["description"],
        discPrice: json["discPrice"],
        discount: json["discount"],
        fabricCode: json["fabricCode"],
        fabricType: fabricTypeValues.map[json["fabricType"]],
        images: List<dynamic>.from(json["images"].map((x) => x)),
        isAccessory: json["isAccessory"],
        isAvailable: json["isAvailable"],
        isPer: json["isPer"],
        isVirtual: json["isVirtual"],
        isWithPocket: json["isWithPocket"],
        name: json["name"],
        occasionId: occasionIdValues.map[json["occasionId"]],
        occasionIds: List<OccasionId>.from(json["occasionIds"].map((x) => occasionIdValues.map[x])),
        pImgIndx: json["pImgIndx"],
        pidSerial: json["pidSerial"],
        price: json["price"],
        primaryColorId: json["primaryColorId"],
        qty: json["qty"],
        size: json["size"],
        subTitle: json["subTitle"],
        title: json["title"],
        warranty: warrantyValues.map[json["warranty"]],
        fabric: json["fabric"],
        pId: json["pId"],
    );

    Map<dynamic, dynamic> toJson() => {
        "__typename": productTypenameValues.reverse[typename],
        "_id": id,
        "brand": brand,
        "brandId": brandIdValues.reverse[brandId],
        "care": care,
        "catId": catIdValues.reverse[catId],
        "category": category.toJson(),
        "code": code,
        "cost": cost,
        "delivery": deliveryValues.reverse[delivery],
        "deliveryDays": deliveryDays,
        "description": description,
        "discPrice": discPrice,
        "discount": discount,
        "fabricCode": fabricCode,
        "fabricType": fabricTypeValues.reverse[fabricType],
        "images": List<dynamic>.from(images.map((x) => x)),
        "isAccessory": isAccessory,
        "isAvailable": isAvailable,
        "isPer": isPer,
        "isVirtual": isVirtual,
        "isWithPocket": isWithPocket,
        "name": name,
        "occasionId": occasionIdValues.reverse[occasionId],
        "occasionIds": List<dynamic>.from(occasionIds.map((x) => occasionIdValues.reverse[x])),
        "pImgIndx": pImgIndx,
        "pidSerial": pidSerial,
        "price": price,
        "primaryColorId": primaryColorId,
        "qty": qty,
        "size": size,
        "subTitle": subTitle,
        "title": title,
        "warranty": warrantyValues.reverse[warranty],
        "fabric": fabric,
        "pId": pId,
    };
}

enum BrandId { THE_5_DAB627_C95_F1232_D4_CB34_BCC, THE_5_F1057_AE073_F54058_C3_A08_CD, THE_5_EE6_DB4_AC56879291_C68923_D }

final brandIdValues = EnumValues({
    "5dab627c95f1232d4cb34bcc": BrandId.THE_5_DAB627_C95_F1232_D4_CB34_BCC,
    "5ee6db4ac56879291c68923d": BrandId.THE_5_EE6_DB4_AC56879291_C68923_D,
    "5f1057ae073f54058c3a08cd": BrandId.THE_5_F1057_AE073_F54058_C3_A08_CD
});

enum CatId { THE_5_DA7220571762_C2_A58_B27_A66, THE_5_DA7220571762_C2_A58_B27_A65, THE_5_EBB993_ABCB3_D23714_B2_EBF4, THE_5_DA7220571762_C2_A58_B27_A76 }

final catIdValues = EnumValues({
    "5da7220571762c2a58b27a65": CatId.THE_5_DA7220571762_C2_A58_B27_A65,
    "5da7220571762c2a58b27a66": CatId.THE_5_DA7220571762_C2_A58_B27_A66,
    "5da7220571762c2a58b27a76": CatId.THE_5_DA7220571762_C2_A58_B27_A76,
    "5ebb993abcb3d23714b2ebf4": CatId.THE_5_EBB993_ABCB3_D23714_B2_EBF4
});

class Category {
    Category({
        required this.typename,
        required this.id,
        required this.image,
        required this.isEnabled,
        this.isEnabledForPersonalize,
        required this.label,
        required this.name,
        this.personalizeImage,
        this.personalizeNote,
    });

    dynamic typename;
    dynamic id;
    dynamic image;
    bool isEnabled;
    dynamic isEnabledForPersonalize;
    dynamic label;
    dynamic name;
    dynamic personalizeImage;
    dynamic personalizeNote;

    factory Category.fromJson(Map<dynamic, dynamic> json) => Category(
        typename: categoryTypenameValues.map[json["__typename"]],
        id: catIdValues.map[json["_id"]],
        image: json["image"],
        isEnabled: json["isEnabled"],
        isEnabledForPersonalize: json["isEnabledForPersonalize"],
        label: labelValues.map[json["label"]],
        name: nameValues.map[json["name"]],
        personalizeImage: json["personalizeImage"],
        personalizeNote: json["personalizeNote"],
    );

    Map<dynamic, dynamic> toJson() => {
        "__typename": categoryTypenameValues.reverse[typename],
        "_id": catIdValues.reverse[id],
        "image": image,
        "isEnabled": isEnabled,
        "isEnabledForPersonalize": isEnabledForPersonalize,
        "label": labelValues.reverse[label],
        "name": nameValues.reverse[name],
        "personalizeImage": personalizeImage,
        "personalizeNote": personalizeNote,
    };
}

enum Label { SUITS, SHIRTS, SHOES, TIE_BOWS }

final labelValues = EnumValues({
    "Shirts": Label.SHIRTS,
    "Shoes": Label.SHOES,
    "Suits": Label.SUITS,
    "Tie & Bows": Label.TIE_BOWS
});

enum Name { SUITS, SHIRTS, SHOES, TIE_AND_BOWS }

final nameValues = EnumValues({
    "shirts": Name.SHIRTS,
    "shoes": Name.SHOES,
    "suits": Name.SUITS,
    "tie-and-bows": Name.TIE_AND_BOWS
});

enum CategoryTypename { MASTER_CATEGORY }

final categoryTypenameValues = EnumValues({
    "MasterCategory": CategoryTypename.MASTER_CATEGORY
});

enum Delivery { THE_10_DAYS }

final deliveryValues = EnumValues({
    "10 Days": Delivery.THE_10_DAYS
});

enum FabricType { THE_5_FE1_CA97_B232_C28_E587681_B7, THE_5_FE1_CB28_B232_C28_E587681_BA, THE_5_FE1_CAC2_B232_C28_E587681_B8 }

final fabricTypeValues = EnumValues({
    "5fe1ca97b232c28e587681b7": FabricType.THE_5_FE1_CA97_B232_C28_E587681_B7,
    "5fe1cac2b232c28e587681b8": FabricType.THE_5_FE1_CAC2_B232_C28_E587681_B8,
    "5fe1cb28b232c28e587681ba": FabricType.THE_5_FE1_CB28_B232_C28_E587681_BA
});

enum OccasionId { THE_5_FC1_B4515_D81_DF3_FCC445_DFF, THE_5_FC1_B41_B5_D81_DF3_FCC445_DFE, THE_5_FF6_D4_AEE06_BEEC9_B987_B8_A2, THE_5_FC0_EF1_CDFC4643_FCCFB3_DD9, THE_5_FC1_B5975_D81_DF3_FCC445_E01, THE_5_FC1_B6495_D81_DF3_FCC445_E03 }

final occasionIdValues = EnumValues({
    "5fc0ef1cdfc4643fccfb3dd9": OccasionId.THE_5_FC0_EF1_CDFC4643_FCCFB3_DD9,
    "5fc1b41b5d81df3fcc445dfe": OccasionId.THE_5_FC1_B41_B5_D81_DF3_FCC445_DFE,
    "5fc1b4515d81df3fcc445dff": OccasionId.THE_5_FC1_B4515_D81_DF3_FCC445_DFF,
    "5fc1b5975d81df3fcc445e01": OccasionId.THE_5_FC1_B5975_D81_DF3_FCC445_E01,
    "5fc1b6495d81df3fcc445e03": OccasionId.THE_5_FC1_B6495_D81_DF3_FCC445_E03,
    "5ff6d4aee06beec9b987b8a2": OccasionId.THE_5_FF6_D4_AEE06_BEEC9_B987_B8_A2
});

enum ProductTypename { PRODUCT }

final productTypenameValues = EnumValues({
    "Product": ProductTypename.PRODUCT
});

enum Warranty { THE_30_DAYS, THE_5_YEARS }

final warrantyValues = EnumValues({
    "30 Days": Warranty.THE_30_DAYS,
    "5 years": Warranty.THE_5_YEARS
});

enum LookTypename { LOOK }

final lookTypenameValues = EnumValues({
    "Look": LookTypename.LOOK
});

class EnumValues<T> {
    Map<dynamic, T> map;
    late Map<T, dynamic> reverseMap;

    EnumValues(this.map);

    Map<T, dynamic> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
