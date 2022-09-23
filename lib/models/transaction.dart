class Transaction {
  String? createdBy;
  String? createdOn;
  String? pcDomainName;
  String? pcIpAddress;
  String? pcName;
  String? pcUserName;
  int? oid;
  int? amountDue;
  int? batchOid;
  int? farmerOid;
  int? farmOid;
  String? purchaseDate;
  int? tonnage;

  Transaction(
      {this.createdBy,
      this.createdOn,
      this.pcDomainName,
      this.pcIpAddress,
      this.pcName,
      this.pcUserName,
      this.oid,
      this.amountDue,
      this.batchOid,
      this.farmerOid,
      this.farmOid,
      this.purchaseDate,
      this.tonnage});

  Transaction.fromJson(Map<String, dynamic> json) {
    createdBy = json['createdBy'];
    createdOn = json['createdOn'];
    pcDomainName = json['pcDomainName'];
    pcIpAddress = json['pcIpAddress'];
    pcName = json['pcName'];
    pcUserName = json['pcUserName'];
    oid = json['oid'];
    amountDue = json['amountDue'];
    batchOid = json['batchOid'];
    farmerOid = json['farmerOid'];
    farmOid = json['farmOid'];
    purchaseDate = json['purchaseDate'];
    tonnage = json['tonnage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdBy'] = this.createdBy;
    data['createdOn'] = this.createdOn;
    data['pcDomainName'] = this.pcDomainName;
    data['pcIpAddress'] = this.pcIpAddress;
    data['pcName'] = this.pcName;
    data['pcUserName'] = this.pcUserName;
    data['oid'] = this.oid;
    data['amountDue'] = this.amountDue;
    data['batchOid'] = this.batchOid;
    data['farmerOid'] = this.farmerOid;
    data['farmOid'] = this.farmOid;
    data['purchaseDate'] = this.purchaseDate;
    data['tonnage'] = this.tonnage;
    return data;
  }
}
