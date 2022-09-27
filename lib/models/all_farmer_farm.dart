class FarmData {
  int? statusCode;
  int? count;
  String? message;
  List<Values>? values;
  FarmData({this.statusCode, this.count, this.message, this.values});

  FarmData.fromJson(Map<String, dynamic> json) {
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
  int? aggregationMasterOid;
  double? averageProduction;
  int? distanceToTheMill;
  int? farmerOid;
  Location? location;
  int? noOfCyclesCompleted;
  int? size;
  String? title;
  String? createdBy;
  String? createdOn;
  String? modifiedBy;
  String? modifiedOn;
  Null? pcDomainName;
  Null? pcIpAddress;
  Null? pcName;
  Null? pcUserName;

  Values(
      {this.oid,
      this.aggregationMasterOid,
      this.averageProduction,
      this.distanceToTheMill,
      this.farmerOid,
      this.location,
      this.noOfCyclesCompleted,
      this.size,
      this.title,
      this.createdBy,
      this.createdOn,
      this.modifiedBy,
      this.modifiedOn,
      this.pcDomainName,
      this.pcIpAddress,
      this.pcName,
      this.pcUserName});

  Values.fromJson(Map<String, dynamic> json) {
    oid = json['oid'];
    aggregationMasterOid = json['aggregationMasterOid'];
    averageProduction = json['averageProduction'];
    distanceToTheMill = json['distanceToTheMill'];
    farmerOid = json['farmerOid'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    noOfCyclesCompleted = json['noOfCyclesCompleted'];
    size = json['size'];
    title = json['title'];
    createdBy = json['createdBy'];
    createdOn = json['createdOn'];
    modifiedBy = json['modifiedBy'];
    modifiedOn = json['modifiedOn'];
    pcDomainName = json['pcDomainName'];
    pcIpAddress = json['pcIpAddress'];
    pcName = json['pcName'];
    pcUserName = json['pcUserName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['oid'] = this.oid;
    data['aggregationMasterOid'] = this.aggregationMasterOid;
    data['averageProduction'] = this.averageProduction;
    data['distanceToTheMill'] = this.distanceToTheMill;
    data['farmerOid'] = this.farmerOid;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['noOfCyclesCompleted'] = this.noOfCyclesCompleted;
    data['size'] = this.size;
    data['title'] = this.title;
    data['createdBy'] = this.createdBy;
    data['createdOn'] = this.createdOn;
    data['modifiedBy'] = this.modifiedBy;
    data['modifiedOn'] = this.modifiedOn;
    data['pcDomainName'] = this.pcDomainName;
    data['pcIpAddress'] = this.pcIpAddress;
    data['pcName'] = this.pcName;
    data['pcUserName'] = this.pcUserName;
    return data;
  }
}

class Location {
  int? oid;
  Null? description;
  int? countryOid;
  int? stateOid;
  int? localGovernmentOid;
  Null? districtOid;
  Null? wardOid;
  Null? createdBy;
  String? createdOn;
  String? modifiedBy;
  String? modifiedOn;
  Null? pcDomainName;
  Null? pcIpAddress;
  Null? pcName;
  Null? pcUserName;

  Location(
      {this.oid,
      this.description,
      this.countryOid,
      this.stateOid,
      this.localGovernmentOid,
      this.districtOid,
      this.wardOid,
      this.createdBy,
      this.createdOn,
      this.modifiedBy,
      this.modifiedOn,
      this.pcDomainName,
      this.pcIpAddress,
      this.pcName,
      this.pcUserName});

  Location.fromJson(Map<String, dynamic> json) {
    oid = json['oid'];
    description = json['description'];
    countryOid = json['countryOid'];
    stateOid = json['stateOid'];
    localGovernmentOid = json['localGovernmentOid'];
    districtOid = json['districtOid'];
    wardOid = json['wardOid'];
    createdBy = json['createdBy'];
    createdOn = json['createdOn'];
    modifiedBy = json['modifiedBy'];
    modifiedOn = json['modifiedOn'];
    pcDomainName = json['pcDomainName'];
    pcIpAddress = json['pcIpAddress'];
    pcName = json['pcName'];
    pcUserName = json['pcUserName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['oid'] = this.oid;
    data['description'] = this.description;
    data['countryOid'] = this.countryOid;
    data['stateOid'] = this.stateOid;
    data['localGovernmentOid'] = this.localGovernmentOid;
    data['districtOid'] = this.districtOid;
    data['wardOid'] = this.wardOid;
    data['createdBy'] = this.createdBy;
    data['createdOn'] = this.createdOn;
    data['modifiedBy'] = this.modifiedBy;
    data['modifiedOn'] = this.modifiedOn;
    data['pcDomainName'] = this.pcDomainName;
    data['pcIpAddress'] = this.pcIpAddress;
    data['pcName'] = this.pcName;
    data['pcUserName'] = this.pcUserName;
    return data;
  }
}
