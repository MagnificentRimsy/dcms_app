class LocalGovernment {
  int? statusCode;
  int? count;
  String? message;
  List<LocalGovernmentValues>? localGovernmentValues;

  LocalGovernment({this.statusCode, this.count, this.message, this.localGovernmentValues});

  LocalGovernment.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    count = json['count'];
    message = json['message'];
    if (json['values'] != null) {
      localGovernmentValues = <LocalGovernmentValues>[];
      json['values'].forEach((v) {
        localGovernmentValues!.add(new LocalGovernmentValues.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['count'] = this.count;
    data['message'] = this.message;
    if (this.localGovernmentValues != null) {
      data['values'] = this.localGovernmentValues!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LocalGovernmentValues {
  int? oid;
  String? code;
  String? name;
  int? stateOid;
  String? createdBy;
  String? createdOn;
  String? modifiedBy;
  String? modifiedOn;
  Null? pcDomainName;
  Null? pcIpAddress;
  Null? pcName;
  Null? pcUserName;

  LocalGovernmentValues(
      {this.oid,
      this.code,
      this.name,
      this.stateOid,
      this.createdBy,
      this.createdOn,
      this.modifiedBy,
      this.modifiedOn,
      this.pcDomainName,
      this.pcIpAddress,
      this.pcName,
      this.pcUserName});

  LocalGovernmentValues.fromJson(Map<String, dynamic> json) {
    oid = json['oid'];
    code = json['code'];
    name = json['name'];
    stateOid = json['stateOid'];
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
    data['code'] = this.code;
    data['name'] = this.name;
    data['stateOid'] = this.stateOid;
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
