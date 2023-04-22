// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    LoginModel({
        required this.typename,
        required this.id,
        required this.bio,
        required this.email,
        required this.isAvailable,
        required this.mpfUserId,
        required this.passCode,
        required this.organization,
        required this.profilePicture,
        required this.phone,
        required this.designation,
        this.registeredByStylistId,
        required this.socialMediaLinks,
        required this.firstName,
        required this.lastName,
        required this.companyBio,
        required this.connections,
    });

    String typename;
    String id;
    Bio bio;
    Bio email;
    bool isAvailable;
    String mpfUserId;
    String passCode;
    Bio organization;
    Bio profilePicture;
    Bio phone;
    Bio designation;
    dynamic registeredByStylistId;
    List<SocialMediaLink> socialMediaLinks;
    Bio firstName;
    Bio lastName;
    Bio companyBio;
    List<dynamic> connections;

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        typename: json["__typename"] == null ? "null" : json["__typename"],
        id: json["_id"],
        bio: Bio.fromJson(json["bio"]),
        email: Bio.fromJson(json["email"]),
        isAvailable: json["isAvailable"],
        mpfUserId: json["mpfUserId"],
        passCode: json["passCode"],
        organization: Bio.fromJson(json["organization"]),
        profilePicture: Bio.fromJson(json["profilePicture"]),
        phone: Bio.fromJson(json["phone"]),
        designation: Bio.fromJson(json["designation"]),
        registeredByStylistId: json["registeredByStylistId"],
        socialMediaLinks: List<SocialMediaLink>.from(json["socialMediaLinks"].map((x) => SocialMediaLink.fromJson(x))),
        firstName: Bio.fromJson(json["firstName"]),
        lastName: Bio.fromJson(json["lastName"]),
        companyBio: Bio.fromJson(json["companyBio"]),
        connections: List<dynamic>.from(json["connections"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "__typename": typename,
        "_id": id,
        "bio": bio.toJson(),
        "email": email.toJson(),
        "isAvailable": isAvailable,
        "mpfUserId": mpfUserId,
        "passCode": passCode,
        "organization": organization.toJson(),
        "profilePicture": profilePicture.toJson(),
        "phone": phone.toJson(),
        "designation": designation.toJson(),
        "registeredByStylistId": registeredByStylistId,
        "socialMediaLinks": List<dynamic>.from(socialMediaLinks.map((x) => x.toJson())),
        "firstName": firstName.toJson(),
        "lastName": lastName.toJson(),
        "companyBio": companyBio.toJson(),
        "connections": List<dynamic>.from(connections.map((x) => x)),
    };
}

class Bio {
    Bio({
        required this.typename,
        required this.value,
    });

    String typename;
    String value;

    factory Bio.fromJson(Map<String, dynamic> json) => Bio(
        typename: json["__typename"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "__typename": typename,
        "value": value,
    };
}

class SocialMediaLink {
    SocialMediaLink({
        required this.typename,
        required this.value,
        required this.socialAccount,
    });

    String typename;
    String value;
    String socialAccount;

    factory SocialMediaLink.fromJson(Map<String, dynamic> json) => SocialMediaLink(
        typename: json["__typename"],
        value: json["value"],
        socialAccount: json["socialAccount"],
    );

    Map<String, dynamic> toJson() => {
        "__typename": typename,
        "value": value,
        "socialAccount": socialAccount,
    };
}
