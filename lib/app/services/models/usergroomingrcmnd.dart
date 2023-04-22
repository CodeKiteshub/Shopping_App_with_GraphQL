// To parse this JSON data, do
//
//     final usergroomingrcmnd = usergroomingrcmndFromJson(jsondynamic);

import 'dart:convert';

Usergroomingrcmnd usergroomingrcmndFromJson(dynamic str) => Usergroomingrcmnd.fromJson(json.decode(str));

dynamic usergroomingrcmndToJson(Usergroomingrcmnd data) => json.encode(data.toJson());

class Usergroomingrcmnd {
    Usergroomingrcmnd({
        required this.typename,
        required this.getUserGroomingRecommendedAttributes,
    });

    dynamic typename;
    List<GetUserGroomingRecommendedAttribute> getUserGroomingRecommendedAttributes;

    factory Usergroomingrcmnd.fromJson(Map<dynamic, dynamic> json) => Usergroomingrcmnd(
        typename: json["__typename"],
        getUserGroomingRecommendedAttributes: List<GetUserGroomingRecommendedAttribute>.from(json["getUserGroomingRecommendedAttributes"].map((x) => GetUserGroomingRecommendedAttribute.fromJson(x))),
    );

    Map<dynamic, dynamic> toJson() => {
        "__typename": typename,
        "getUserGroomingRecommendedAttributes": List<dynamic>.from(getUserGroomingRecommendedAttributes.map((x) => x.toJson())),
    };
}

class GetUserGroomingRecommendedAttribute {
    GetUserGroomingRecommendedAttribute({
        required this.typename,
        required this.id,
        this.addedByStylist,
        this.deletedByStylist,
        required this.isAddedManually,
        this.isDeletedByStylist,
        required this.isForMaster,
        required this.masterData,
        required this.masterName,
        this.note,
        required this.palletData,
        required this.value,
    });

    GetUserGroomingRecommendedAttributeTypename typename;
    dynamic id;
    dynamic addedByStylist;
    dynamic deletedByStylist;
    bool isAddedManually;
    dynamic isDeletedByStylist;
    bool isForMaster;
    MasterData masterData;
    MasterName masterName;
    dynamic note;
    PalletData palletData;
    dynamic value;

    factory GetUserGroomingRecommendedAttribute.fromJson(Map<dynamic, dynamic> json) => GetUserGroomingRecommendedAttribute(
        typename: getUserGroomingRecommendedAttributeTypenameValues.map[json["__typename"]]!,
        id: json["_id"],
        addedByStylist: json["addedByStylist"],
        deletedByStylist: json["deletedByStylist"],
        isAddedManually: json["isAddedManually"],
        isDeletedByStylist: json["isDeletedByStylist"],
        isForMaster: json["isForMaster"],
        masterData: MasterData.fromJson(json["masterData"]),
        masterName: masterNameValues.map[json["master_name"]]!,
        note: json["note"],
        palletData: PalletData.fromJson(json["palletData"]),
        value: json["value"],
    );

    Map<dynamic, dynamic> toJson() => {
        "__typename": getUserGroomingRecommendedAttributeTypenameValues.reverse[typename],
        "_id": id,
        "addedByStylist": addedByStylist,
        "deletedByStylist": deletedByStylist,
        "isAddedManually": isAddedManually,
        "isDeletedByStylist": isDeletedByStylist,
        "isForMaster": isForMaster,
        "masterData": masterData.toJson(),
        "master_name": masterNameValues.reverse[masterName],
        "note": note,
        "palletData": palletData.toJson(),
        "value": value,
    };
}

class MasterData {
    MasterData({
        required this.typename,
        required this.id,
        this.catId,
        required this.image,
        required this.name,
        required this.note,
        required this.personalizeImage,
        this.sortOrder,
    });

    MasterDataTypename typename;
    dynamic id;
    dynamic catId;
    dynamic image;
    dynamic name;
    dynamic note;
    dynamic personalizeImage;
    dynamic sortOrder;

    factory MasterData.fromJson(Map<dynamic, dynamic> json) => MasterData(
        typename: masterDataTypenameValues.map[json["__typename"]]!,
        id: json["_id"],
        catId: json["catId"],
        image: json["image"],
        name: json["name"],
        note: json["note"],
        personalizeImage: json["personalizeImage"],
        sortOrder: json["sortOrder"],
    );

    Map<dynamic, dynamic> toJson() => {
        "__typename": masterDataTypenameValues.reverse[typename],
        "_id": id,
        "catId": catId,
        "image": image,
        "name": name,
        "note": note,
        "personalizeImage": personalizeImage,
        "sortOrder": sortOrder,
    };
}

enum MasterDataTypename { MASTER_PRODUCT_SINGLE_SELECT }

final masterDataTypenameValues = EnumValues({
    "MasterProductSingleSelect": MasterDataTypename.MASTER_PRODUCT_SINGLE_SELECT
});

enum MasterName { MASTER_HAIRSTYLE }

final masterNameValues = EnumValues({
    "master_hairstyle": MasterName.MASTER_HAIRSTYLE
});

class PalletData {
    PalletData({
        required this.typename,
        this.colors,
        required this.id,
        this.name,
    });

    PalletDataTypename typename;
    dynamic colors;
    dynamic id;
    dynamic name;

    factory PalletData.fromJson(Map<dynamic, dynamic> json) => PalletData(
        typename: palletDataTypenameValues.map[json["__typename"]]!,
        colors: json["colors"],
        id: json["_id"],
        name: json["name"],
    );

    Map<dynamic, dynamic> toJson() => {
        "__typename": palletDataTypenameValues.reverse[typename],
        "colors": colors,
        "_id": id,
        "name": name,
    };
}

enum PalletDataTypename { MASTER_PALLET }

final palletDataTypenameValues = EnumValues({
    "MasterPallet": PalletDataTypename.MASTER_PALLET
});

enum GetUserGroomingRecommendedAttributeTypename { PRODUCT_RECOMMENDATION_ATTRIBUTES }

final getUserGroomingRecommendedAttributeTypenameValues = EnumValues({
    "ProductRecommendationAttributes": GetUserGroomingRecommendedAttributeTypename.PRODUCT_RECOMMENDATION_ATTRIBUTES
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
