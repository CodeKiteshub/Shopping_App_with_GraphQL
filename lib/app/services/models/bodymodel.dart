// To parse this JSON data, do
//
//     final bodymodel = bodymodelFromJson(jsonString);

import 'dart:convert';

Bodymodel bodymodelFromJson(String str) => Bodymodel.fromJson(json.decode(str));

String bodymodelToJson(Bodymodel data) => json.encode(data.toJson());

class Bodymodel {
    Bodymodel({
        required this.typename,
        required this.getBodyProfile,
    });

    String typename;
    GetBodyProfile getBodyProfile;

    factory Bodymodel.fromJson(Map<String, dynamic> json) => Bodymodel(
        typename: json["__typename"],
        getBodyProfile: GetBodyProfile.fromJson(json["getBodyProfile"]),
    );

    Map<String, dynamic> toJson() => {
        "__typename": typename,
        "getBodyProfile": getBodyProfile.toJson(),
    };
}

class GetBodyProfile {
    GetBodyProfile({
        required this.typename,
        required this.backPicture,
        required this.frontPicture,
        required this.sidePicture,
    });

    String typename;
    String backPicture;
    String frontPicture;
    String sidePicture;

    factory GetBodyProfile.fromJson(Map<String, dynamic> json) => GetBodyProfile(
        typename: json["__typename"],
        backPicture: json["backPicture"],
        frontPicture: json["frontPicture"],
        sidePicture: json["sidePicture"],
    );

    Map<String, dynamic> toJson() => {
        "__typename": typename,
        "backPicture": backPicture,
        "frontPicture": frontPicture,
        "sidePicture": sidePicture,
    };
}
