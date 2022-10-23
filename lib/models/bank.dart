class Bank {
  int? statusCode;
  int? count;
  String? message;
  List<BankValues>? bankValues;

  Bank({this.statusCode, this.count, this.message, this.bankValues});

  Bank.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    count = json['count'];
    message = json['message'];
    if (json['values'] != null) {
      bankValues = <BankValues>[];
      json['values'].forEach((v) {
        bankValues!.add(new BankValues.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['count'] = this.count;
    data['message'] = this.message;
    if (this.bankValues != null) {
      data['values'] = this.bankValues!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BankValues {
  int? oid;
  Null? logo;
  String? name;
  Null? createdBy;
  String? createdOn;
  Null? modifiedBy;
  String? modifiedOn;
  Null? pcDomainName;
  Null? pcIpAddress;
  Null? pcName;
  Null? pcUserName;

  BankValues(
      {this.oid,
      this.logo,
      this.name,
      this.createdBy,
      this.createdOn,
      this.modifiedBy,
      this.modifiedOn,
      this.pcDomainName,
      this.pcIpAddress,
      this.pcName,
      this.pcUserName});

  BankValues.fromJson(Map<String, dynamic> json) {
    oid = json['oid'];
    logo = json['logo'];
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
    data['logo'] = this.logo;
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