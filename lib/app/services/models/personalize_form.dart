import 'dart:convert';

Personalize_form dataModelFromJson(String str) =>
    Personalize_form.fromJson(json.decode(str));
String dataModelToJson( Personalize_form data) => json.encode(data.toJson());
class Personalize_form {
  String? sTypename;
  GetPersonalizeForm? getPersonalizeForm;

  Personalize_form({this.sTypename, this.getPersonalizeForm});

  Personalize_form.fromJson(Map<String, dynamic> json) {
    sTypename = json['__typename'];
    getPersonalizeForm = json['getPersonalizeForm'] != null
        ? new GetPersonalizeForm.fromJson(json['getPersonalizeForm'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__typename'] = this.sTypename;
    if (this.getPersonalizeForm != null) {
      data['getPersonalizeForm'] = this.getPersonalizeForm!.toJson();
    }
    return data;
  }
}

class GetPersonalizeForm {
  String? sTypename;
  String? name;
  List<Screens>? screens;

  GetPersonalizeForm({this.sTypename, this.name, this.screens});

  GetPersonalizeForm.fromJson(Map<String, dynamic> json) {
    sTypename = json['__typename'];
    name = json['name'];
    if (json['screens'] != null) {
      screens = <Screens>[];
      json['screens'].forEach((v) {
        screens!.add(new Screens.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__typename'] = this.sTypename;
    data['name'] = this.name;
    if (this.screens != null) {
      data['screens'] = this.screens!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Screens {
  String? sTypename;
  int? screenSortOrder;
  List<Questions>? questions;

  Screens({this.sTypename, this.screenSortOrder, this.questions});

  Screens.fromJson(Map<String, dynamic> json) {
    sTypename = json['__typename'];
    screenSortOrder = json['screenSortOrder'];
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(new Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__typename'] = this.sTypename;
    data['screenSortOrder'] = this.screenSortOrder;
    if (this.questions != null) {
      data['questions'] = this.questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  String? sTypename;
  String? questionId;
  Question? question;

  Questions({this.sTypename, this.questionId, this.question});

  Questions.fromJson(Map<String, dynamic> json) {
    sTypename = json['__typename'];
    questionId = json['questionId'];
    question = json['question'] != null
        ? new Question.fromJson(json['question'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__typename'] = this.sTypename;
    data['questionId'] = this.questionId;
    if (this.question != null) {
      data['question'] = this.question!.toJson();
    }
    return data;
  }
}

class Question {
  String? sTypename;
  String? sId;
  String? catId;
  String? categoryId;
  String? description;
  String? infoHelpText;
  String? input;
  bool? isMandatory;
  bool? isMultipleChoice;
  String? masterName;
  String? optionTypeId;
  List<String>? options;
  String? type;
  List<dynamic>? value;
  List<OptionsData>? optionsData;

  Question(
      {this.sTypename,
      this.sId,
      this.catId,
      this.categoryId,
      this.description,
      this.infoHelpText,
      this.input,
      this.isMandatory,
      this.isMultipleChoice,
      this.masterName,
      this.optionTypeId,
      this.options,
      this.type,
      this.value,
      this.optionsData});

  Question.fromJson(Map<String, dynamic> json) {
    sTypename = json['__typename'];
    sId = json['_id'];
    catId = json['catId'];
    categoryId = json['categoryId'];
    description = json['description'];
    infoHelpText = json['infoHelpText'];
    input = json['input'];
    isMandatory = json['isMandatory'];
    isMultipleChoice = json['isMultipleChoice'];
    masterName = json['master_name'];
    optionTypeId = json['optionTypeId'];
    options = json['options'].cast<String>();
    type = json['type'];
    value = json['value'];
    if (json['optionsData'] != null) {
      optionsData = <OptionsData>[];
      json['optionsData'].forEach((v) {
        optionsData!.add(new OptionsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__typename'] = this.sTypename;
    data['_id'] = this.sId;
    data['catId'] = this.catId;
    data['categoryId'] = this.categoryId;
    data['description'] = this.description;
    data['infoHelpText'] = this.infoHelpText;
    data['input'] = this.input;
    data['isMandatory'] = this.isMandatory;
    data['isMultipleChoice'] = this.isMultipleChoice;
    data['master_name'] = this.masterName;
    data['optionTypeId'] = this.optionTypeId;
    data['options'] = this.options;
    data['type'] = this.type;
    data['value'] = this.value;
    if (this.optionsData != null) {
      data['optionsData'] = this.optionsData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OptionsData {
  String? sTypename;
  String? sId;
  String? image;
  String? name;
  int? sortOrder;

  OptionsData(
      {this.sTypename, this.sId, this.image, this.name, this.sortOrder});

  OptionsData.fromJson(Map<String, dynamic> json) {
    sTypename = json['__typename'];
    sId = json['_id'];
    image = json['image'];
    name = json['name'];
    sortOrder = json['sortOrder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__typename'] = this.sTypename;
    data['_id'] = this.sId;
    data['image'] = this.image;
    data['name'] = this.name;
    data['sortOrder'] = this.sortOrder;
    return data;
  }
}
