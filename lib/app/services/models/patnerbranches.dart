class GetAllPartnersBranches {
  Data? data;

  GetAllPartnersBranches({this.data});

  GetAllPartnersBranches.fromJson(Map<String, dynamic> json) {
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
  GetAllBrandPartnerBranches? getAllBrandPartnerBranches;

  Data({this.getAllBrandPartnerBranches});

  Data.fromJson(Map<String, dynamic> json) {
    getAllBrandPartnerBranches = json['getAllBrandPartnerBranches'] != null
        ? new GetAllBrandPartnerBranches.fromJson(
            json['getAllBrandPartnerBranches'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.getAllBrandPartnerBranches != null) {
      data['getAllBrandPartnerBranches'] =
          this.getAllBrandPartnerBranches!.toJson();
    }
    return data;
  }
}

class GetAllBrandPartnerBranches {
  List<BrandPartnerBranches>? brandPartnerBranches;
  int? totalCount;

  GetAllBrandPartnerBranches({this.brandPartnerBranches, this.totalCount});

  GetAllBrandPartnerBranches.fromJson(Map<String, dynamic> json) {
    if (json['brandPartnerBranches'] != null) {
      brandPartnerBranches = <BrandPartnerBranches>[];
      json['brandPartnerBranches'].forEach((v) {
        brandPartnerBranches!.add(new BrandPartnerBranches.fromJson(v));
      });
    }
    totalCount = json['totalCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.brandPartnerBranches != null) {
      data['brandPartnerBranches'] =
          this.brandPartnerBranches!.map((v) => v.toJson()).toList();
    }
    data['totalCount'] = this.totalCount;
    return data;
  }
}

class BrandPartnerBranches {
  String? sId;
  String? address;
  int? brandPartnerBranchNo;
  String? brandPartnerCategoryId;
  String? brandPartnerId;
  String? cityId;
  Null? countryCode;
  String? emailId;
  String? googlePageLink;
  int? googleRating;
  String? hoursOpen;
  bool? isAvailable;
  String? name;
  String? note;
  Null? personName;
  String? phone;
  String? phone2;
  Null? prefix;
  List<String>? serviceableCityIds;
  int? sortOrder;
  List<Null>? tags;
  String? title;

  BrandPartnerBranches(
      {this.sId,
      this.address,
      this.brandPartnerBranchNo,
      this.brandPartnerCategoryId,
      this.brandPartnerId,
      this.cityId,
      this.countryCode,
      this.emailId,
      this.googlePageLink,
      this.googleRating,
      this.hoursOpen,
      this.isAvailable,
      this.name,
      this.note,
      this.personName,
      this.phone,
      this.phone2,
      this.prefix,
      this.serviceableCityIds,
      this.sortOrder,
      // this.tags,
      this.title});

  BrandPartnerBranches.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    address = json['address'];
    brandPartnerBranchNo = json['brandPartnerBranchNo'];
    brandPartnerCategoryId = json['brandPartnerCategoryId'];
    brandPartnerId = json['brandPartnerId'];
    cityId = json['cityId'];
    countryCode = json['countryCode'];
    emailId = json['emailId'];
    googlePageLink = json['googlePageLink'];
    googleRating = json['googleRating'];
    hoursOpen = json['hoursOpen'];
    isAvailable = json['isAvailable'];
    name = json['name'];
    note = json['note'];
    personName = json['personName'];
    phone = json['phone'];
    phone2 = json['phone2'];
    prefix = json['prefix'];
    serviceableCityIds = json['serviceableCityIds'].cast<String>();
    sortOrder = json['sortOrder'];
    // if (json['tags'] != null) {
    //   tags = <Null>[];
    //   json['tags'].forEach((v) {
    //     tags!.add(new Null.fromJson(v));
    //   });
    // }
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['address'] = this.address;
    data['brandPartnerBranchNo'] = this.brandPartnerBranchNo;
    data['brandPartnerCategoryId'] = this.brandPartnerCategoryId;
    data['brandPartnerId'] = this.brandPartnerId;
    data['cityId'] = this.cityId;
    data['countryCode'] = this.countryCode;
    data['emailId'] = this.emailId;
    data['googlePageLink'] = this.googlePageLink;
    data['googleRating'] = this.googleRating;
    data['hoursOpen'] = this.hoursOpen;
    data['isAvailable'] = this.isAvailable;
    data['name'] = this.name;
    data['note'] = this.note;
    data['personName'] = this.personName;
    data['phone'] = this.phone;
    data['phone2'] = this.phone2;
    data['prefix'] = this.prefix;
    data['serviceableCityIds'] = this.serviceableCityIds;
    data['sortOrder'] = this.sortOrder;
    // if (this.tags != null) {
    //   data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    // }
    data['title'] = this.title;
    return data;
  }
}
