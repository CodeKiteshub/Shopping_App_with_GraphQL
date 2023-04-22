import 'dart:convert';

Personalize dealsFromJson(String str) => Personalize.fromJson(json.decode(str));

String dealsToJson(Personalize data) => json.encode(data.toJson());
class Personalize {
  Data? data;

  Personalize({this.data});

  Personalize.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  GetCategoryConfig? getCategoryConfig;

  Data({this.getCategoryConfig});

  Data.fromJson(Map<String, dynamic> json) {
    getCategoryConfig = json['getCategoryConfig'] != null
        ? new GetCategoryConfig.fromJson(json['getCategoryConfig'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.getCategoryConfig != null) {
      data['getCategoryConfig'] = this.getCategoryConfig!.toJson();
    }
    return data;
  }
}

class GetCategoryConfig {
  Category? category;

  GetCategoryConfig({this.category});

  GetCategoryConfig.fromJson(Map<String, dynamic> json) {
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    return data;
  }
}

class Category {
  Seo? seo;
  String? image;
  String? name;
  String? personalizeNote;
  String? personalizeImage;

  Category(
      {this.seo,
      this.image,
      this.name,
      this.personalizeNote,
      this.personalizeImage});

  Category.fromJson(Map<String, dynamic> json) {
    seo = json['seo'] != null ? new Seo.fromJson(json['seo']) : null;
    image = json['image'];
    name = json['name'];
    personalizeNote = json['personalizeNote'];
    personalizeImage = json['personalizeImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.seo != null) {
      data['seo'] = this.seo!.toJson();
    }
    data['image'] = this.image;
    data['name'] = this.name;
    data['personalizeNote'] = this.personalizeNote;
    data['personalizeImage'] = this.personalizeImage;
    return data;
  }
}

class Seo {
  String? contentDescription;
  String? metaDescription;
  String? title;

  Seo({this.contentDescription, this.metaDescription, this.title});

  Seo.fromJson(Map<String, dynamic> json) {
    contentDescription = json['content_description'];
    metaDescription = json['meta_description'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content_description'] = this.contentDescription;
    data['meta_description'] = this.metaDescription;
    data['title'] = this.title;
    return data;
  }
}
