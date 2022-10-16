class Cooperative {
  int? statusCode;
  int? count;
  String? message;
  List<CooperativeValues>? cooperativeValues;

  Cooperative({this.statusCode, this.count, this.message, this.cooperativeValues});

  Cooperative.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    count = json['count'];
    message = json['message'];
    if (json['values'] != null) {
      cooperativeValues = <CooperativeValues>[];
      json['values'].forEach((v) {
        cooperativeValues!.add(new CooperativeValues.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['count'] = this.count;
    data['message'] = this.message;
    if (this.cooperativeValues != null) {
      data['values'] = this.cooperativeValues!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CooperativeValues {
  int? oid;
  int? clusterOid;
  String? contactPerson;
  String? email;
  String? name;
  Null? phoneNo;
  Null? cluster;
  String? createdBy;
  String? createdOn;
  String? modifiedBy;
  String? modifiedOn;
  Null? pcDomainName;
  Null? pcIpAddress;
  Null? pcName;
  Null? pcUserName;

  CooperativeValues(
      {this.oid,
      this.clusterOid,
      this.contactPerson,
      this.email,
      this.name,
      this.phoneNo,
      this.cluster,
      this.createdBy,
      this.createdOn,
      this.modifiedBy,
      this.modifiedOn,
      this.pcDomainName,
      this.pcIpAddress,
      this.pcName,
      this.pcUserName});

  CooperativeValues.fromJson(Map<String, dynamic> json) {
    oid = json['oid'];
    clusterOid = json['clusterOid'];
    contactPerson = json['contactPerson'];
    email = json['email'];
    name = json['name'];
    phoneNo = json['phoneNo'];
    cluster = json['cluster'];
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
    data['clusterOid'] = this.clusterOid;
    data['contactPerson'] = this.contactPerson;
    data['email'] = this.email;
    data['name'] = this.name;
    data['phoneNo'] = this.phoneNo;
    data['cluster'] = this.cluster;
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
