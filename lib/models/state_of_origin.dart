class StateOfOrigin {
  int? statusCode;
  int? count;
  String? message;
  List<StateOfOriginValues>? stateOfOriginValues;

  StateOfOrigin({this.statusCode, this.count, this.message, this.stateOfOriginValues});

  StateOfOrigin.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    count = json['count'];
    message = json['message'];
    if (json['values'] != null) {
      stateOfOriginValues = <StateOfOriginValues>[];
      json['values'].forEach((v) {
        stateOfOriginValues!.add(new StateOfOriginValues.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['count'] = this.count;
    data['message'] = this.message;
    if (this.stateOfOriginValues != null) {
      data['values'] = this.stateOfOriginValues!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StateOfOriginValues {
  int? oid;
  String? code;
  String? geoName;
  String? name;
  int? countryOid;
  String? createdBy;
  String? createdOn;
  String? modifiedBy;
  String? modifiedOn;
  Null? pcDomainName;
  Null? pcIpAddress;
  Null? pcName;
  Null? pcUserName;

  StateOfOriginValues(
      {this.oid,
      this.code,
      this.geoName,
      this.name,
      this.countryOid,
      this.createdBy,
      this.createdOn,
      this.modifiedBy,
      this.modifiedOn,
      this.pcDomainName,
      this.pcIpAddress,
      this.pcName,
      this.pcUserName,
      });

  StateOfOriginValues.fromJson(Map<String, dynamic> json) {
    oid = json['oid'];
    code = json['code'];
    geoName = json['geoName'];
    name = json['name'];
    countryOid = json['countryOid'];
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
    data['geoName'] = this.geoName;
    data['name'] = this.name;
    data['countryOid'] = this.countryOid;
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
