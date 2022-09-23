class Batch {
  int? statusCode;
  int? count;
  String? message;
  List<Values>? values;

  Batch({this.statusCode, this.count, this.message, this.values});

  Batch.fromJson(Map<String, dynamic> json) {
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
  int? agentOid;
  String? batchDate;
  String? batchId;
  String? description;
  int? organizationOid;
  int? seasonOid;
  int? status;
  Summary? summary;
  WeighBridge? weighBridge;
  Financials? financials;
  List<Transactions>? transactions;
  String? createdBy;
  String? createdOn;
  String? modifiedBy;
  String? modifiedOn;
  String? pcDomainName;
  String? pcIpAddress;
  String? pcName;
  String? pcUserName;

  Values(
      {this.oid,
      this.agentOid,
      this.batchDate,
      this.batchId,
      this.description,
      this.organizationOid,
      this.seasonOid,
      this.status,
      this.summary,
      this.weighBridge,
      this.financials,
      this.transactions,
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
    agentOid = json['agentOid'];
    batchDate = json['batchDate'];
    batchId = json['batchId'];
    description = json['description'];
    organizationOid = json['organizationOid'];
    seasonOid = json['seasonOid'];
    status = json['status'];
    summary =
        json['summary'] != null ? new Summary.fromJson(json['summary']) : null;
    weighBridge = json['weighBridge'] != null
        ? new WeighBridge.fromJson(json['weighBridge'])
        : null;
    financials = json['financials'] != null
        ? new Financials.fromJson(json['financials'])
        : null;
    if (json['transactions'] != null) {
      transactions = <Transactions>[];
      json['transactions'].forEach((v) {
        transactions!.add(new Transactions.fromJson(v));
      });
    }
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
    data['agentOid'] = this.agentOid;
    data['batchDate'] = this.batchDate;
    data['batchId'] = this.batchId;
    data['description'] = this.description;
    data['organizationOid'] = this.organizationOid;
    data['seasonOid'] = this.seasonOid;
    data['status'] = this.status;
    if (this.summary != null) {
      data['summary'] = this.summary!.toJson();
    }
    if (this.weighBridge != null) {
      data['weighBridge'] = this.weighBridge!.toJson();
    }
    if (this.financials != null) {
      data['financials'] = this.financials!.toJson();
    }
    if (this.transactions != null) {
      data['transactions'] = this.transactions!.map((v) => v.toJson()).toList();
    }
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

class Summary {
  int? oid;
  int? totalAmount;
  int? totalFFBCollected;
  Null? createdBy;
  String? createdOn;
  Null? modifiedBy;
  String? modifiedOn;
  Null? pcDomainName;
  Null? pcIpAddress;
  Null? pcName;
  Null? pcUserName;

  Summary(
      {this.oid,
      this.totalAmount,
      this.totalFFBCollected,
      this.createdBy,
      this.createdOn,
      this.modifiedBy,
      this.modifiedOn,
      this.pcDomainName,
      this.pcIpAddress,
      this.pcName,
      this.pcUserName});

  Summary.fromJson(Map<String, dynamic> json) {
    oid = json['oid'];
    totalAmount = json['totalAmount'];
    totalFFBCollected = json['totalFFBCollected'];
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
    data['totalAmount'] = this.totalAmount;
    data['totalFFBCollected'] = this.totalFFBCollected;
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

class WeighBridge {
  int? oid;
  int? difference;
  int? netWeight;
  int? status;
  double? tonnagePercentage;
  int? totalWeightWithFFB;
  int? totalWeightWithoutFFB;
  Null? createdBy;
  String? createdOn;
  Null? modifiedBy;
  String? modifiedOn;
  Null? pcDomainName;
  Null? pcIpAddress;
  Null? pcName;
  Null? pcUserName;

  WeighBridge(
      {this.oid,
      this.difference,
      this.netWeight,
      this.status,
      this.tonnagePercentage,
      this.totalWeightWithFFB,
      this.totalWeightWithoutFFB,
      this.createdBy,
      this.createdOn,
      this.modifiedBy,
      this.modifiedOn,
      this.pcDomainName,
      this.pcIpAddress,
      this.pcName,
      this.pcUserName});

  WeighBridge.fromJson(Map<String, dynamic> json) {
    oid = json['oid'];
    difference = json['difference'];
    netWeight = json['netWeight'];
    status = json['status'];
    tonnagePercentage = json['tonnagePercentage'];
    totalWeightWithFFB = json['totalWeightWithFFB'];
    totalWeightWithoutFFB = json['totalWeightWithoutFFB'];
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
    data['difference'] = this.difference;
    data['netWeight'] = this.netWeight;
    data['status'] = this.status;
    data['tonnagePercentage'] = this.tonnagePercentage;
    data['totalWeightWithFFB'] = this.totalWeightWithFFB;
    data['totalWeightWithoutFFB'] = this.totalWeightWithoutFFB;
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

class Financials {
  int? oid;
  double? serviceCharge;
  int? serviceChargeOnTC;
  int? totalAmountDue;
  double? totalAmountDueToAgent;
  int? transportationCost;
  double? vat;
  int? vatOnTC;
  Null? createdBy;
  String? createdOn;
  Null? modifiedBy;
  String? modifiedOn;
  Null? pcDomainName;
  Null? pcIpAddress;
  Null? pcName;
  Null? pcUserName;

  Financials(
      {this.oid,
      this.serviceCharge,
      this.serviceChargeOnTC,
      this.totalAmountDue,
      this.totalAmountDueToAgent,
      this.transportationCost,
      this.vat,
      this.vatOnTC,
      this.createdBy,
      this.createdOn,
      this.modifiedBy,
      this.modifiedOn,
      this.pcDomainName,
      this.pcIpAddress,
      this.pcName,
      this.pcUserName});

  Financials.fromJson(Map<String, dynamic> json) {
    oid = json['oid'];
    serviceCharge = json['serviceCharge'];
    serviceChargeOnTC = json['serviceChargeOnTC'];
    totalAmountDue = json['totalAmountDue'];
    totalAmountDueToAgent = json['totalAmountDueToAgent'];
    transportationCost = json['transportationCost'];
    vat = json['vat'];
    vatOnTC = json['vatOnTC'];
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
    data['serviceCharge'] = this.serviceCharge;
    data['serviceChargeOnTC'] = this.serviceChargeOnTC;
    data['totalAmountDue'] = this.totalAmountDue;
    data['totalAmountDueToAgent'] = this.totalAmountDueToAgent;
    data['transportationCost'] = this.transportationCost;
    data['vat'] = this.vat;
    data['vatOnTC'] = this.vatOnTC;
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

class Transactions {
  int? oid;
  int? amountDue;
  int? batchOid;
  int? commissionPercentage;
  int? differentials;
  int? farmOid;
  int? farmerOid;
  int? fruitType;
  String? geoLocation;
  int? pricingPercentage;
  String? purchaseDate;
  int? tonnage;
  String? transId;
  int? unitPrice;
  Null? createdBy;
  String? createdOn;
  String? modifiedBy;
  String? modifiedOn;
  Null? pcDomainName;
  Null? pcIpAddress;
  Null? pcName;
  Null? pcUserName;

  Transactions(
      {this.oid,
      this.amountDue,
      this.batchOid,
      this.commissionPercentage,
      this.differentials,
      this.farmOid,
      this.farmerOid,
      this.fruitType,
      this.geoLocation,
      this.pricingPercentage,
      this.purchaseDate,
      this.tonnage,
      this.transId,
      this.unitPrice,
      this.createdBy,
      this.createdOn,
      this.modifiedBy,
      this.modifiedOn,
      this.pcDomainName,
      this.pcIpAddress,
      this.pcName,
      this.pcUserName});

  Transactions.fromJson(Map<String, dynamic> json) {
    oid = json['oid'];
    amountDue = json['amountDue'];
    batchOid = json['batchOid'];
    commissionPercentage = json['commissionPercentage'];
    differentials = json['differentials'];
    farmOid = json['farmOid'];
    farmerOid = json['farmerOid'];
    fruitType = json['fruitType'];
    geoLocation = json['geoLocation'];
    pricingPercentage = json['pricingPercentage'];
    purchaseDate = json['purchaseDate'];
    tonnage = json['tonnage'];
    transId = json['transId'];
    unitPrice = json['unitPrice'];
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
    data['amountDue'] = this.amountDue;
    data['batchOid'] = this.batchOid;
    data['commissionPercentage'] = this.commissionPercentage;
    data['differentials'] = this.differentials;
    data['farmOid'] = this.farmOid;
    data['farmerOid'] = this.farmerOid;
    data['fruitType'] = this.fruitType;
    data['geoLocation'] = this.geoLocation;
    data['pricingPercentage'] = this.pricingPercentage;
    data['purchaseDate'] = this.purchaseDate;
    data['tonnage'] = this.tonnage;
    data['transId'] = this.transId;
    data['unitPrice'] = this.unitPrice;
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
