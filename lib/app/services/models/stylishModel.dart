// To parse this JSON data, do
//
//     final stylistModel = stylistModelFromJson(jsonString);

import 'dart:convert';

StylistModel stylistModelFromJson(String str) => StylistModel.fromJson(json.decode(str));

String stylistModelToJson(StylistModel data) => json.encode(data.toJson());

class StylistModel {
    StylistModel({
        required this.typename,
        required this.getAllStylists,
    });

    String typename;
    List<GetAllStylist> getAllStylists;

    factory StylistModel.fromJson(Map<String, dynamic> json) => StylistModel(
        typename: json["__typename"],
        getAllStylists: List<GetAllStylist>.from(json["getAllStylists"].map((x) => GetAllStylist.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "__typename": typename,
        "getAllStylists": List<dynamic>.from(getAllStylists.map((x) => x.toJson())),
    };
}

class GetAllStylist {
    GetAllStylist({
        required this.typename,
        required this.id,
        required this.email,
        required this.image,
        required this.isEnabled,
        required this.name,
        required this.note,
        required this.phone,
        required this.roleIdentifier,
        required this.sortOrder,
        this.userId,
    });

    Typename typename;
    String id;
    String email;
    String image;
    bool isEnabled;
    String name;
    String note;
    String phone;
    RoleIdentifier roleIdentifier;
    int sortOrder;
    String? userId;

    factory GetAllStylist.fromJson(Map<String, dynamic> json) => GetAllStylist(
        typename: typenameValues.map[json["__typename"]]!,
        id: json["_id"],
        email: json["email"],
        image: json["image"],
        isEnabled: json["isEnabled"],
        name: json["name"],
        note: json["note"],
        phone: json["phone"],
        roleIdentifier: roleIdentifierValues.map[json["roleIdentifier"]]!,
        sortOrder: json["sortOrder"],
        userId: json["userId"],
    );

    Map<String, dynamic> toJson() => {
        "__typename": typenameValues.reverse[typename],
        "_id": id,
        "email": email,
        "image": image,
        "isEnabled": isEnabled,
        "name": name,
        "note": note,
        "phone": phone,
        "roleIdentifier": roleIdentifierValues.reverse[roleIdentifier],
        "sortOrder": sortOrder,
        "userId": userId,
    };
}

enum RoleIdentifier { PERSONAL_STYLIST }

final roleIdentifierValues = EnumValues({
    "personal_stylist": RoleIdentifier.PERSONAL_STYLIST
});

enum Typename { TEAM_MASTER }

final typenameValues = EnumValues({
    "TeamMaster": Typename.TEAM_MASTER
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
