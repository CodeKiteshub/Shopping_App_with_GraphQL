class SelectionModel {
  String mastername;
  String? catId;
  String value;
  String image;

  SelectionModel({
    required this.mastername,
    this.catId,
    required this.value,
    required this.image,
  });

  Map toJson() {
    return {
      "master_name": mastername,
      "value": value,
      "image": image,
      "catId": catId
    };
  }
}
