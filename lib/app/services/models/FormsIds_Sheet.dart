class FormIds_Sheet {
  FormData? formData;

  FormIds_Sheet({this.formData});

  FormIds_Sheet.fromJson(Map<String, dynamic> json) {
    formData = json['formData'] != null
        ? new FormData.fromJson(json['formData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.formData != null) {
      data['formData'] = this.formData!.toJson();
    }
    return data;
  }
}

class FormData {
  String? userId;
  List<String>? formIds;
  List<Selections>? selections;

  FormData({this.userId, this.formIds, this.selections});

  FormData.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    formIds = json['formIds'].cast<String>();
    if (json['selections'] != null) {
      selections = <Selections>[];
      json['selections'].forEach((v) {
        selections!.add(new Selections.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['formIds'] = this.formIds;
    if (this.selections != null) {
      data['selections'] = this.selections!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Selections {
  String? masterName;
  String? value;
  String? image;
  Null? catId;

  Selections({this.masterName, this.value, this.image, this.catId});

  Selections.fromJson(Map<String, dynamic> json) {
    masterName = json['master_name'];
    value = json['value'];
    image = json['image'];
    catId = json['catId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['master_name'] = this.masterName;
    data['value'] = this.value;
    data['image'] = this.image;
    data['catId'] = this.catId;
    return data;
  }
}
