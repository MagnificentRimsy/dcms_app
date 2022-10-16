class PricingItem {
  int? statusCode;
  int? count;
  String? message;
  List<Values>? values;

  PricingItem({this.statusCode, this.count, this.message, this.values});

  PricingItem.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    count = json['count'];
    message = json['message'];
    if (json['values'] != null) {
      values = <Values>[];
      json['values'].forEach((v) {
        values!.add(new Values.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['count'] = this.count;
    data['message'] = this.message;
    if (this.values != null) {
      data['values'] = this.values!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Values {
  int? oid;
  int? amount;
  String? endDate;
  bool? isDefault;
  int? seasonOid;
  String? startDate;
  String? title;
  String? createdBy;
  String? createdOn;
  String? modifiedBy;
  String? modifiedOn;
  String? pcDomainName;
  String? pcIpAddress;
  String? pcName;
  String? pcUserName;
  List<PricingItems>? pricingItems;

  Values(
      {this.oid,
      this.amount,
      this.endDate,
      this.isDefault,
      this.seasonOid,
      this.startDate,
      this.title,
      this.createdBy,
      this.createdOn,
      this.modifiedBy,
      this.modifiedOn,
      this.pcDomainName,
      this.pcIpAddress,
      this.pcName,
      this.pcUserName,
      this.pricingItems});

  Values.fromJson(Map<String, dynamic> json) {
    oid = json['oid'];
    amount = json['amount'];
    endDate = json['endDate'];
    isDefault = json['isDefault'];
    seasonOid = json['seasonOid'];
    startDate = json['startDate'];
    title = json['title'];
    createdBy = json['createdBy'];
    createdOn = json['createdOn'];
    modifiedBy = json['modifiedBy'];
    modifiedOn = json['modifiedOn'];
    pcDomainName = json['pcDomainName'];
    pcIpAddress = json['pcIpAddress'];
    pcName = json['pcName'];
    pcUserName = json['pcUserName'];
    if (json['pricingItems'] != null) {
      pricingItems = <PricingItems>[];
      json['pricingItems'].forEach((v) {
        pricingItems!.add(new PricingItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['oid'] = this.oid;
    data['amount'] = this.amount;
    data['endDate'] = this.endDate;
    data['isDefault'] = this.isDefault;
    data['seasonOid'] = this.seasonOid;
    data['startDate'] = this.startDate;
    data['title'] = this.title;
    data['createdBy'] = this.createdBy;
    data['createdOn'] = this.createdOn;
    data['modifiedBy'] = this.modifiedBy;
    data['modifiedOn'] = this.modifiedOn;
    data['pcDomainName'] = this.pcDomainName;
    data['pcIpAddress'] = this.pcIpAddress;
    data['pcName'] = this.pcName;
    data['pcUserName'] = this.pcUserName;
    if (this.pricingItems != null) {
      data['pricingItems'] = this.pricingItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PricingItems {
  int? oid;
  int? aggregatorCommission;
  int? amount;
  int? pricingOid;
  int? pricingPercentage;
  int? variety;
  String? createdBy;
  String? createdOn;
  String? modifiedBy;
  String? modifiedOn;
  String? pcDomainName;
  String? pcIpAddress;
  String? pcName;
  String? pcUserName;
  String? varietyDescription;

  PricingItems(
      {this.oid,
      this.aggregatorCommission,
      this.amount,
      this.pricingOid,
      this.pricingPercentage,
      this.variety,
      this.createdBy,
      this.createdOn,
      this.modifiedBy,
      this.modifiedOn,
      this.pcDomainName,
      this.pcIpAddress,
      this.pcName,
      this.pcUserName,
      this.varietyDescription});

  PricingItems.fromJson(Map<String, dynamic> json) {
    oid = json['oid'];
    aggregatorCommission = json['aggregatorCommission'];
    amount = json['amount'];
    pricingOid = json['pricingOid'];
    pricingPercentage = json['pricingPercentage'];
    variety = json['variety'];
    createdBy = json['createdBy'];
    createdOn = json['createdOn'];
    modifiedBy = json['modifiedBy'];
    modifiedOn = json['modifiedOn'];
    pcDomainName = json['pcDomainName'];
    pcIpAddress = json['pcIpAddress'];
    pcName = json['pcName'];
    pcUserName = json['pcUserName'];
    varietyDescription = json['varietyDescription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['oid'] = this.oid;
    data['aggregatorCommission'] = this.aggregatorCommission;
    data['amount'] = this.amount;
    data['pricingOid'] = this.pricingOid;
    data['pricingPercentage'] = this.pricingPercentage;
    data['variety'] = this.variety;
    data['createdBy'] = this.createdBy;
    data['createdOn'] = this.createdOn;
    data['modifiedBy'] = this.modifiedBy;
    data['modifiedOn'] = this.modifiedOn;
    data['pcDomainName'] = this.pcDomainName;
    data['pcIpAddress'] = this.pcIpAddress;
    data['pcName'] = this.pcName;
    data['pcUserName'] = this.pcUserName;
    data['varietyDescription'] = this.varietyDescription;
    return data;
  }
}
