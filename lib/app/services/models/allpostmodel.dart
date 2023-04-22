// To parse this JSON data, do
//
//     final allpostModel = allpostModelFromJson(jsonString);

import 'dart:convert';

AllpostModel allpostModelFromJson(String str) => AllpostModel.fromJson(json.decode(str));

String allpostModelToJson(AllpostModel data) => json.encode(data.toJson());

class AllpostModel {
    AllpostModel({
        required this.typename,
        required this.getPostsByFilter,
    });

    String typename;
    GetPostsByFilter getPostsByFilter;

    factory AllpostModel.fromJson(Map<String, dynamic> json) => AllpostModel(
        typename: json["__typename"],
        getPostsByFilter: GetPostsByFilter.fromJson(json["getPostsByFilter"]),
    );

    Map<String, dynamic> toJson() => {
        "__typename": typename,
        "getPostsByFilter": getPostsByFilter.toJson(),
    };
}

class GetPostsByFilter {
    GetPostsByFilter({
        required this.typename,
        required this.totalCount,
        required this.posts,
    });

    String typename;
    int totalCount;
    List<Post> posts;

    factory GetPostsByFilter.fromJson(Map<String, dynamic> json) => GetPostsByFilter(
        typename: json["__typename"],
        totalCount: json["totalCount"],
        posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "__typename": typename,
        "totalCount": totalCount,
        "posts": List<dynamic>.from(posts.map((x) => x.toJson())),
    };
}

class Post {
    Post({
        required this.typename,
        required this.id,
        required this.note,
        required this.heading,
        required this.imageOrVideo,
    });

    String typename;
    String id;
    String note;
    String heading;
    ImageOrVideo imageOrVideo;

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        typename: json["__typename"],
        id: json["_id"],
        note: json["note"],
        heading: json["heading"],
        imageOrVideo: ImageOrVideo.fromJson(json["imageOrVideo"]),
    );

    Map<String, dynamic> toJson() => {
        "__typename": typename,
        "_id": id,
        "note": note,
        "heading": heading,
        "imageOrVideo": imageOrVideo.toJson(),
    };
}

class ImageOrVideo {
    ImageOrVideo({
        required this.typename,
        required this.isVideo,
        required this.note,
        required this.url,
    });

    String typename;
    bool isVideo;
    String note;
    String url;

    factory ImageOrVideo.fromJson(Map<String, dynamic> json) => ImageOrVideo(
        typename: json["__typename"],
        isVideo: json["isVideo"],
        note: json["note"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "__typename": typename,
        "isVideo": isVideo,
        "note": note,
        "url": url,
    };
}
