import 'dart:convert';

Deals dealsFromJson(String str) => Deals.fromJson(json.decode(str));

String dealsToJson(Deals data) => json.encode(data.toJson());
class Deals {
  String? sTypename;
  GetUserDealsAndVoucher? getUserDealsAndVoucher;

  Deals({this.sTypename, this.getUserDealsAndVoucher});

  Deals.fromJson(Map<String, dynamic> json) {
    sTypename = json['__typename'];
    getUserDealsAndVoucher = json['getUserDealsAndVoucher'] != null
        ? new GetUserDealsAndVoucher.fromJson(json['getUserDealsAndVoucher'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__typename'] = this.sTypename;
    if (this.getUserDealsAndVoucher != null) {
      data['getUserDealsAndVoucher'] = this.getUserDealsAndVoucher!.toJson();
    }
    return data;
  }
}

class GetUserDealsAndVoucher {
  String? sTypename;
  int? activeVoucherCount;
  double? totalMoneySaved;
  int? totalVoucherCount;
  List<Vouchers>? vouchers;

  GetUserDealsAndVoucher(
      {this.sTypename,
      this.activeVoucherCount,
      this.totalMoneySaved,
      this.totalVoucherCount,
      this.vouchers});

  GetUserDealsAndVoucher.fromJson(Map<String, dynamic> json) {
    sTypename = json['__typename'];
    activeVoucherCount = json['activeVoucherCount'];
    totalMoneySaved = json['totalMoneySaved'];
    totalVoucherCount = json['totalVoucherCount'];
    if (json['vouchers'] != null) {
      vouchers = <Vouchers>[];
      json['vouchers'].forEach((v) {
        vouchers!.add(new Vouchers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__typename'] = this.sTypename;
    data['activeVoucherCount'] = this.activeVoucherCount;
    data['totalMoneySaved'] = this.totalMoneySaved;
    data['totalVoucherCount'] = this.totalVoucherCount;
    if (this.vouchers != null) {
      data['vouchers'] = this.vouchers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Vouchers {
  String? sTypename;
  String? image;
  String? note;
  bool? isRedeemed;
  int? redeemedCount;
  String? title;

  Vouchers(
      {this.sTypename,
      this.image,
      this.note,
      this.isRedeemed,
      this.redeemedCount,
      this.title});

  Vouchers.fromJson(Map<String, dynamic> json) {
    sTypename = json['__typename'];
    image = json['image'];
    note = json['note'];
    isRedeemed = json['isRedeemed'];
    redeemedCount = json['redeemedCount'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__typename'] = this.sTypename;
    data['image'] = this.image;
    data['note'] = this.note;
    data['isRedeemed'] = this.isRedeemed;
    data['redeemedCount'] = this.redeemedCount;
    data['title'] = this.title;
    return data;
  }
}
