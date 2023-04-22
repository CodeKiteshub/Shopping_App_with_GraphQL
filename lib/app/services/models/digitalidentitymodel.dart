// To parse this JSON data, do
//
//     final digitalProfileModel = digitalProfileModelFromJson(jsonString);

import 'dart:convert';

DigitalProfileModel digitalProfileModelFromJson(String str) => DigitalProfileModel.fromJson(json.decode(str));

String digitalProfileModelToJson(DigitalProfileModel data) => json.encode(data.toJson());

class DigitalProfileModel {
    DigitalProfileModel({
        required this.typename,
        required this.getDigitalProfileById,
    });

    String typename;
    GetDigitalProfileById getDigitalProfileById;

    factory DigitalProfileModel.fromJson(Map<String, dynamic> json) => DigitalProfileModel(
        typename: json["__typename"],
        getDigitalProfileById: GetDigitalProfileById.fromJson(json["getDigitalProfileById"]),
    );

    Map<String, dynamic> toJson() => {
        "__typename": typename,
        "getDigitalProfileById": getDigitalProfileById.toJson(),
    };
}

class GetDigitalProfileById {
    GetDigitalProfileById({
        required this.typename,
        required this.id,
        required this.bio,
        required this.companyBio,
        required this.connections,
        required this.designation,
        required this.firstName,
        required this.email,
        required this.isAvailable,
        required this.lastName,
        this.mpfUserId,
        required this.organization,
        this.passCode,
        required this.phone,
        required this.profileUrl,
        required this.profilePicture,
        required this.profileId,
        this.registeredByStylistId,
        this.registeredDate,
        required this.scans,
        required this.socialMediaLinks,
    });

    String typename;
    String id;
    Bio bio;
    Bio companyBio;
    List<dynamic> connections;
    Bio designation;
    Bio firstName;
    Bio email;
    bool isAvailable;
    Bio lastName;
    dynamic mpfUserId;
    Bio organization;
    dynamic passCode;
    Bio phone;
    String profileUrl;
    Bio profilePicture;
    int profileId;
    dynamic registeredByStylistId;
    dynamic registeredDate;
    List<dynamic> scans;
    List<Bio> socialMediaLinks;

    factory GetDigitalProfileById.fromJson(Map<String, dynamic> json) => GetDigitalProfileById(
        typename: json["__typename"],
        id: json["_id"],
        bio: Bio.fromJson(json["bio"]),
        companyBio: Bio.fromJson(json["companyBio"]),
        connections: List<dynamic>.from(json["connections"].map((x) => x)),
        designation: Bio.fromJson(json["designation"]),
        firstName: Bio.fromJson(json["firstName"]),
        email: Bio.fromJson(json["email"]),
        isAvailable: json["isAvailable"],
        lastName: Bio.fromJson(json["lastName"]),
        mpfUserId: json["mpfUserId"],
        organization: Bio.fromJson(json["organization"]),
        passCode: json["passCode"],
        phone: Bio.fromJson(json["phone"]),
        profileUrl: json["profileUrl"],
        profilePicture: Bio.fromJson(json["profilePicture"]),
        profileId: json["profileId"],
        registeredByStylistId: json["registeredByStylistId"],
        registeredDate: json["registeredDate"],
        scans: List<dynamic>.from(json["scans"].map((x) => x)),
        socialMediaLinks: List<Bio>.from(json["socialMediaLinks"].map((x) => Bio.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "__typename": typename,
        "_id": id,
        "bio": bio.toJson(),
        "companyBio": companyBio.toJson(),
        "connections": List<dynamic>.from(connections.map((x) => x)),
        "designation": designation.toJson(),
        "firstName": firstName.toJson(),
        "email": email.toJson(),
        "isAvailable": isAvailable,
        "lastName": lastName.toJson(),
        "mpfUserId": mpfUserId,
        "organization": organization.toJson(),
        "passCode": passCode,
        "phone": phone.toJson(),
        "profileUrl": profileUrl,
        "profilePicture": profilePicture.toJson(),
        "profileId": profileId,
        "registeredByStylistId": registeredByStylistId,
        "registeredDate": registeredDate,
        "scans": List<dynamic>.from(scans.map((x) => x)),
        "socialMediaLinks": List<dynamic>.from(socialMediaLinks.map((x) => x.toJson())),
    };
}

class Bio {
    Bio({
        required this.typename,
        required this.isVisible,
        required this.value,
        this.socialAccount,
    });

    Typename typename;
    bool isVisible;
    String value;
    String? socialAccount;

    factory Bio.fromJson(Map<String, dynamic> json) => Bio(
        typename: typenameValues.map[json["__typename"]]!,
        isVisible: json["isVisible"],
        value: json["value"],
        socialAccount: json["socialAccount"],
    );

    Map<String, dynamic> toJson() => {
        "__typename": typenameValues.reverse[typename],
        "isVisible": isVisible,
        "value": value,
        "socialAccount": socialAccount,
    };
}

enum Typename { DIGITAL_PROFILE_FIELD_SCHEMA, DIGITAL_PROFILE_SOCIAL_FIELD_SCHEMA }

final typenameValues = EnumValues({
    "DigitalProfileFieldSchema": Typename.DIGITAL_PROFILE_FIELD_SCHEMA,
    "DigitalProfileSocialFieldSchema": Typename.DIGITAL_PROFILE_SOCIAL_FIELD_SCHEMA
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
