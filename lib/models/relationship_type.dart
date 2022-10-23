class RelationshipType {
  int? statusCode;
  int? count;
  String? message;
  List<RelationshipTypeValues>? relationshipTypeValues;

  RelationshipType({this.statusCode, this.count, this.message, this.relationshipTypeValues});

  RelationshipType.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    count = json['count'];
    message = json['message'];
    if (json['values'] != null) {
      relationshipTypeValues = <RelationshipTypeValues>[];
      json['values'].forEach((v) {
        relationshipTypeValues!.add(new RelationshipTypeValues.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['count'] = this.count;
    data['message'] = this.message;
    if (this.relationshipTypeValues != null) {
      data['values'] = this.relationshipTypeValues!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RelationshipTypeValues {
  int? oid;
  String? name;
  String? createdBy;
  String? createdOn;
  String? modifiedBy;
  String? modifiedOn;
  String? pcDomainName;
  String? pcIpAddress;
  String? pcName;
  String? pcUserName;

  RelationshipTypeValues(
      {this.oid,
      this.name,
      this.createdBy,
      this.createdOn,
      this.modifiedBy,
      this.modifiedOn,
      this.pcDomainName,
      this.pcIpAddress,
      this.pcName,
      this.pcUserName});

  RelationshipTypeValues.fromJson(Map<String, dynamic> json) {
    oid = json['oid'];
    name = json['name'];
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
    data['name'] = this.name;
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
