// To parse this JSON data, do
//
//     final lookconfigModel = lookconfigModelFromJson(jsonString);

import 'dart:convert';

LookconfigModel lookconfigModelFromJson(String str) => LookconfigModel.fromJson(json.decode(str));

String lookconfigModelToJson(LookconfigModel data) => json.encode(data.toJson());

class LookconfigModel {
    LookconfigModel({
        required this.typename,
        required this.getLookConfig,
    });

    String typename;
    GetLookConfig getLookConfig;

    factory LookconfigModel.fromJson(Map<String, dynamic> json) => LookconfigModel(
        typename: json["__typename"],
        getLookConfig: GetLookConfig.fromJson(json["getLookConfig"]),
    );

    Map<String, dynamic> toJson() => {
        "__typename": typename,
        "getLookConfig": getLookConfig.toJson(),
    };
}

class GetLookConfig {
    GetLookConfig({
        required this.typename,
        required this.topFilters,
    });

    String typename;
    TopFilters topFilters;

    factory GetLookConfig.fromJson(Map<String, dynamic> json) => GetLookConfig(
        typename: json["__typename"],
        topFilters: TopFilters.fromJson(json["topFilters"]),
    );

    Map<String, dynamic> toJson() => {
        "__typename": typename,
        "topFilters": topFilters.toJson(),
    };
}

class TopFilters {
    TopFilters({
        required this.typename,
        required this.looksTypeFilters,
    });

    String typename;
    List<LooksTypeFilter> looksTypeFilters;

    factory TopFilters.fromJson(Map<String, dynamic> json) => TopFilters(
        typename: json["__typename"],
        looksTypeFilters: List<LooksTypeFilter>.from(json["looksTypeFilters"].map((x) => LooksTypeFilter.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "__typename": typename,
        "looksTypeFilters": List<dynamic>.from(looksTypeFilters.map((x) => x.toJson())),
    };
}

class LooksTypeFilter {
    LooksTypeFilter({
        required this.typename,
        required this.id,
        this.catId,
        required this.image,
        required this.name,
    });

    String typename;
    String id;
    dynamic catId;
    String image;
    String name;

    factory LooksTypeFilter.fromJson(Map<String, dynamic> json) => LooksTypeFilter(
        typename: json["__typename"],
        id: json["_id"],
        catId: json["catId"],
        image: json["image"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "__typename": typename,
        "_id": id,
        "catId": catId,
        "image": image,
        "name": name,
    };
}
