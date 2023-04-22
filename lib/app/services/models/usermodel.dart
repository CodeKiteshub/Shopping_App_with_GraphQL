// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsondynamic);

import 'dart:convert';

UserModel userModelFromJson(dynamic str) => UserModel.fromJson(json.decode(str));

dynamic userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    UserModel({
        required this.typename,
        required this.user,
    });

    dynamic typename;
    User user;

    factory UserModel.fromJson(Map<dynamic, dynamic> json) => UserModel(
        typename: json["__typename"],
        user: User.fromJson(json["user"]),
    );

    Map<dynamic, dynamic> toJson() => {
        "__typename": typename,
        // "user": user.toJson(),
    };
}

class User {
    User({
        required this.typename,
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.role,
        required this.phone,
        this.aboutMe,
        required this.email,
        required this.images,
        this.personalizedFormPercentFilled,
        required this.countryCode,
        required this.sso,
        this.stylist,
        this.digitalProfile,
        this.stylistId,
    });

    dynamic typename;
    dynamic id;
    dynamic firstName;
    dynamic lastName;
    List<dynamic> role;
    dynamic phone;
    dynamic aboutMe;
    dynamic email;
    Images images;
    List<dynamic>? personalizedFormPercentFilled;
    dynamic countryCode;
    Sso sso;
    Stylist? stylist;
    DigitalProfile? digitalProfile;
    dynamic stylistId;

    factory User.fromJson(Map<dynamic, dynamic> json) => User(
        typename: json["__typename"],
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        role: List<dynamic>.from(json["role"].map((x) => x)),
        phone: json["phone"],
        aboutMe: json["aboutMe"] ?? "null",
        email: json["email"],
        images: Images.fromJson(json["images"]),
        personalizedFormPercentFilled: List<dynamic>.from(json["personalizedFormPercentFilled"].map((x) => x)),
        countryCode: json["countryCode"],
        sso: Sso.fromJson(json["sso"]),
        stylist: json["stylist"] == null ? null :  Stylist.fromJson(json["stylist"]),
        digitalProfile: json["digitalProfile"]==null ? null : DigitalProfile.fromJson(json["digitalProfile"]),
        stylistId: json["stylistId"] == null ? "null" : json["stylistId"],
    );

    // Map<dynamic, dynamic> toJson() => {
    //     "__typename": typename,
    //     "_id": id,
    //     "firstName": firstName,
    //     "lastName": lastName,
    //     "role": List<dynamic>.from(role.map((x) => x)),
    //     "phone": phone,
    //     "aboutMe": aboutMe,
    //     "email": email,
    //     "images": images.toJson(),
    //     "personalizedFormPercentFilled": List<dynamic>.from(personalizedFormPercentFilled!.map((x) => x)),
    //     "countryCode": countryCode,
    //     "sso": sso.toJson(),
    //     "stylist": stylist.toJson(),
    //     "digitalProfile": digitalProfile!.toJson(),
    //     "stylistId": stylistId,
    // };
}

class DigitalProfile {
    DigitalProfile({
        required this.typename,
        required this.id,
        required this.bio,
        required this.companyBio,
        required this.connections,
        required this.designation,
        required this.email,
        required this.firstName,
        required this.lastName,
        required this.mpfUserId,
        required this.organization,
        required this.passCode,
        required this.phone,
        required this.profilePicture,
        required this.socialMediaLinks,
        required this.scans,
        this.registeredByStylistId,
        required this.profileUrl,
    });

    dynamic typename;
    dynamic id;
    Bio bio;
    Bio companyBio;
    List<dynamic> connections;
    Bio designation;
    Bio email;
    Bio firstName;
    Bio lastName;
    dynamic mpfUserId;
    Bio organization;
    dynamic passCode;
    Bio phone;
    Bio profilePicture;
    List<Bio> socialMediaLinks;
    List<dynamic> scans;
    dynamic registeredByStylistId;
    dynamic profileUrl;

    factory DigitalProfile.fromJson(Map<dynamic, dynamic> json) => DigitalProfile(
        typename: json["__typename"],
        id: json["_id"],
        bio: Bio.fromJson(json["bio"]),
        companyBio: Bio.fromJson(json["companyBio"]),
        connections: List<dynamic>.from(json["connections"].map((x) => x)),
        designation: Bio.fromJson(json["designation"]),
        email: Bio.fromJson(json["email"]),
        firstName: Bio.fromJson(json["firstName"]),
        lastName: Bio.fromJson(json["lastName"]),
        mpfUserId: json["mpfUserId"],
        organization: Bio.fromJson(json["organization"]),
        passCode: json["passCode"],
        phone: Bio.fromJson(json["phone"]),
        profilePicture: Bio.fromJson(json["profilePicture"]),
        socialMediaLinks: List<Bio>.from(json["socialMediaLinks"].map((x) => Bio.fromJson(x))),
        scans: List<dynamic>.from(json["scans"].map((x) => x)),
        registeredByStylistId: json["registeredByStylistId"],
        profileUrl: json["profileUrl"],
    );

    Map<dynamic, dynamic> toJson() => {
        "__typename": typename,
        "_id": id,
        "bio": bio.toJson(),
        "companyBio": companyBio.toJson(),
        "connections": List<dynamic>.from(connections.map((x) => x)),
        "designation": designation.toJson(),
        "email": email.toJson(),
        "firstName": firstName.toJson(),
        "lastName": lastName.toJson(),
        "mpfUserId": mpfUserId,
        "organization": organization.toJson(),
        "passCode": passCode,
        "phone": phone.toJson(),
        "profilePicture": profilePicture.toJson(),
        "socialMediaLinks": List<dynamic>.from(socialMediaLinks.map((x) => x.toJson())),
        "scans": List<dynamic>.from(scans.map((x) => x)),
        "registeredByStylistId": registeredByStylistId,
        "profileUrl": profileUrl,
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
    dynamic value;
    dynamic? socialAccount;

    factory Bio.fromJson(Map<dynamic, dynamic> json) => Bio(
        typename: typenameValues.map[json["__typename"]]!,
        isVisible: json["isVisible"],
        value: json["value"],
        socialAccount: json["socialAccount"],
    );

    Map<dynamic, dynamic> toJson() => {
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

class Images {
    Images({
        required this.typename,
        required this.profile,
    });

    dynamic typename;
    dynamic profile;

    factory Images.fromJson(Map<dynamic, dynamic> json) => Images(
        typename: json["__typename"],
        profile: json["profile"] ?? "null",
    );

    Map<dynamic, dynamic> toJson() => {
        "__typename": typename,
        "profile": profile,
    };
}

class Sso {
    Sso({
        required this.typename,
        required this.google,
    });

    dynamic typename;
    Google google;

    factory Sso.fromJson(Map<dynamic, dynamic> json) => Sso(
        typename: json["__typename"],
        google: Google.fromJson(json["google"]),
    );

    Map<dynamic, dynamic> toJson() => {
        "__typename": typename,
        "google": google.toJson(),
    };
}

class Google {
    Google({
        required this.typename,
        this.image,
    });

    dynamic typename;
    dynamic image;

    factory Google.fromJson(Map<dynamic, dynamic> json) => Google(
        typename: json["__typename"],
        image: json["image"],
    );

    Map<dynamic, dynamic> toJson() => {
        "__typename": typename,
        "image": image,
    };
}

class Stylist {
    Stylist({
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
        required this.userId,
    });

    dynamic typename;
    dynamic id;
    dynamic email;
    dynamic image;
    bool isEnabled;
    dynamic name;
    dynamic note;
    dynamic phone;
    dynamic roleIdentifier;
    int sortOrder;
    dynamic userId;

    factory Stylist.fromJson(Map<dynamic, dynamic> json) => Stylist(
        typename: json["__typename"],
        id: json["_id"],
        email: json["email"],
        image: json["image"],
        isEnabled: json["isEnabled"],
        name: json["name"],
        note: json["note"],
        phone: json["phone"],
        roleIdentifier: json["roleIdentifier"],
        sortOrder: json["sortOrder"],
        userId: json["userId"],
    );

    Map<dynamic, dynamic> toJson() => {
        "__typename": typename,
        "_id": id,
        "email": email,
        "image": image,
        "isEnabled": isEnabled,
        "name": name,
        "note": note,
        "phone": phone,
        "roleIdentifier": roleIdentifier,
        "sortOrder": sortOrder,
        "userId": userId,
    };
}

class EnumValues<T> {
    Map<dynamic, T> map;
    late Map<T, dynamic> reverseMap;

    EnumValues(this.map);

    Map<T, dynamic> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
