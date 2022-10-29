class Organization {
  int? statusCode;
  int? count;
  String? message;
  List<OrganizationValues>? organizationValues;

  Organization({this.statusCode, this.count, this.message, this.organizationValues});

  Organization.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    count = json['count'];
    message = json['message'];
    if (json['values'] != null) {
      organizationValues = <OrganizationValues>[];
      json['values'].forEach((v) {
        organizationValues!.add(new OrganizationValues.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['count'] = this.count;
    data['message'] = this.message;
    if (this.organizationValues != null) {
      data['values'] = this.organizationValues!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrganizationValues {
  int? oid;
  String? address;
  String? email;
  Null? logo;
  String? name;
  String? primaryPhone;
  Null? secondaryPhone;
  String? website;
  String? createdBy;
  String? createdOn;
  String? modifiedBy;
  String? modifiedOn;
  String? pcDomainName;
  String? pcIpAddress;
  String? pcName;
  String? pcUserName;

  OrganizationValues(
      {this.oid,
      this.address,
      this.email,
      this.logo,
      this.name,
      this.primaryPhone,
      this.secondaryPhone,
      this.website,
      this.createdBy,
      this.createdOn,
      this.modifiedBy,
      this.modifiedOn,
      this.pcDomainName,
      this.pcIpAddress,
      this.pcName,
      this.pcUserName});

  OrganizationValues.fromJson(Map<String, dynamic> json) {
    oid = json['oid'];
    address = json['address'];
    email = json['email'];
    logo = json['logo'];
    name = json['name'];
    primaryPhone = json['primaryPhone'];
    secondaryPhone = json['secondaryPhone'];
    website = json['website'];
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
    data['address'] = this.address;
    data['email'] = this.email;
    data['logo'] = this.logo;
    data['name'] = this.name;
    data['primaryPhone'] = this.primaryPhone;
    data['secondaryPhone'] = this.secondaryPhone;
    data['website'] = this.website;
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
