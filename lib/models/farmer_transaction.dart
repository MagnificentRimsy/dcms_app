class FarmerTransaction {
  int? statusCode;
  int? count;
  String? message;
  List<Values>? values;

  FarmerTransaction({this.statusCode, this.count, this.message, this.values});

  FarmerTransaction.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    count = json['count'];
    message = json['message'];
    if (json['values'] != null) {
      values = <Values>[];
      json['values'].forEach((v) {
        values!.add(Values.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['count'] = count;
    data['message'] = message;
    if (values != null) {
      data['values'] = values!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Values {
  int? oid;
  int? titleOid;
  String? firstName;
  // Null? middleName;
  String? lastName;
  // int? gender;
  // Null? email;
  // String? dateOfBirth;
  // String? applicantId;
  // String? bvn;
  // Null? primaryPhone;
  // Null? secondaryPhone;
  // int? seasonOid;
  // int? assignedAgentOid;
  // int? clusterOid;
  // int? cooperativeOid;
  // Null? contactAddress;
  // Null? photo;
  // int? cooperativeMembershipStatus;
  // int? maritalStatus;
  // int? onBoardingType;
  // AccountDetails? accountDetails;
  // Location? location;
  // MeansOfIdentification? meansOfIdentification;
  // Nationality? nationality;
  // NextOfKin? nextOfKin;
  // Spouse? spouse;
  // String? createdBy;
  // String? createdOn;
  // String? modifiedBy;
  // String? modifiedOn;
  // String? pcDomainName;
  // String? pcIpAddress;
  // String? pcName;
  // String? pcUserName;
  // List<Null>? wallets;
  // List<Farms>? farms;
  // List<Null>? freshFruitBunches;
  String? userId;
  String? name;

  Values(
      {this.oid,
      this.titleOid,
      this.firstName,
      // this.middleName,
      this.lastName,
      // this.gender,
      // this.email,
      // this.dateOfBirth,
      // this.applicantId,
      // this.bvn,
      // / this.primaryPhone,
      //  this.secondaryPhone,
      //  this.seasonOid,
      //  this.assignedAgentOid,
      //  this.clusterOid,
      //  this.cooperativeOid,
      //  this.contactAddress,
      //  this.photo,
      //  this.cooperativeMembershipStatus,
      //  this.maritalStatus,
      //  this.onBoardingType,
      //  this.accountDetails,
      //  this.location,
      //  this.meansOfIdentification,
      //  this.nationality,
      //  this.nextOfKin,
      //  this.spouse,
      //  this.createdBy,
      //  this.createdOn,
      //  this.modifiedBy,
      //  this.modifiedOn,
      //  this.pcDomainName,
      //  this.pcIpAddress,
      //  this.pcName,
      //  this.pcUserName,
      //  this.wallets,
      //  this.farms,
      //  this.freshFruitBunches,
      this.userId,
      this.name});

  Values.fromJson(Map<String, dynamic> json) {
    oid = json['oid'];
    titleOid = json['titleOid'];
    firstName = json['firstName'];
    // middleName = json['middleName'];
    lastName = json['lastName'];
    // gender = json['gender'];
    // email = json['email'];
    // dateOfBirth = json['dateOfBirth'];
    // applicantId = json['applicantId'];
    // bvn = json['bvn'];
    // primaryPhone = json['primaryPhone'];
    // secondaryPhone = json['secondaryPhone'];
    // seasonOid = json['seasonOid'];
    // assignedAgentOid = json['assignedAgentOid'];
    // clusterOid = json['clusterOid'];
    // cooperativeOid = json['cooperativeOid'];
    // contactAddress = json['contactAddress'];
    // photo = json['photo'];
    // cooperativeMembershipStatus = json['cooperativeMembershipStatus'];
    // maritalStatus = json['maritalStatus'];
    // onBoardingType = json['onBoardingType'];
    // accountDetails = json['accountDetails'] != null
    //     ? AccountDetails.fromJson(json['accountDetails'])
    //     : null;
    // location =
    //     json['location'] != null ? Location.fromJson(json['location']) : null;
    // meansOfIdentification = json['meansOfIdentification'] != null
    //     ? MeansOfIdentification.fromJson(json['meansOfIdentification'])
    //     : null;
    // nationality = json['nationality'] != null
    //     ? Nationality.fromJson(json['nationality'])
    //     : null;
    // nextOfKin = json['nextOfKin'] != null
    //     ? NextOfKin.fromJson(json['nextOfKin'])
    //     : null;
    // spouse = json['spouse'] != null ? Spouse.fromJson(json['spouse']) : null;
    // createdBy = json['createdBy'];
    // createdOn = json['createdOn'];
    // modifiedBy = json['modifiedBy'];
    // modifiedOn = json['modifiedOn'];
    // pcDomainName = json['pcDomainName'];
    // pcIpAddress = json['pcIpAddress'];
    // pcName = json['pcName'];
    // pcUserName = json['pcUserName'];
    if (json['wallets'] != null) {
      //   wallets = <Null>[];
      //   json['wallets'].forEach((v) {
      //     wallets!.add(Null.fromJson(v));
      //   });
      // }
      // if (json['farms'] != null) {
      //   farms = <Farms>[];
      //   json['farms'].forEach((v) {
      //     farms!.add(Farms.fromJson(v));
      //   });
      // }
      // if (json['freshFruitBunches'] != null) {
      //   freshFruitBunches = <Null>[];
      //   json['freshFruitBunches'].forEach((v) {
      //     freshFruitBunches!.add(Null.fromJson(v));
      //   });
      // }
      userId = json['userId'];
      name = json['name'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['oid'] = oid;
    data['titleOid'] = titleOid;
    data['firstName'] = firstName;
    // data['middleName'] = middleName;
    data['lastName'] = lastName;
    // data['gender'] = gender;
    // data['email'] = email;
    // data['dateOfBirth'] = dateOfBirth;
    // data['applicantId'] = applicantId;
    // data['bvn'] = bvn;
    // data['primaryPhone'] = primaryPhone;
    // data['secondaryPhone'] = secondaryPhone;
    // data['seasonOid'] = seasonOid;
    // data['assignedAgentOid'] = assignedAgentOid;
    // data['clusterOid'] = clusterOid;
    // data['cooperativeOid'] = cooperativeOid;
    // data['contactAddress'] = contactAddress;
    // data['photo'] = photo;
    // data['cooperativeMembershipStatus'] = cooperativeMembershipStatus;
    // data['maritalStatus'] = maritalStatus;
    // data['onBoardingType'] = onBoardingType;
    // if (accountDetails != null) {
    //   data['accountDetails'] = accountDetails!.toJson();
    // }
    // if (location != null) {
    //   data['location'] = location!.toJson();
    // }
    // if (meansOfIdentification != null) {
    //   data['meansOfIdentification'] = meansOfIdentification!.toJson();
    // }
    // if (nationality != null) {
    //   data['nationality'] = nationality!.toJson();
    // }
    // if (nextOfKin != null) {
    //   data['nextOfKin'] = nextOfKin!.toJson();
    // }
    // if (spouse != null) {
    //   data['spouse'] = spouse!.toJson();
    // }
    // data['createdBy'] = createdBy;
    // data['createdOn'] = createdOn;
    // data['modifiedBy'] = modifiedBy;
    // data['modifiedOn'] = modifiedOn;
    // data['pcDomainName'] = pcDomainName;
    // data['pcIpAddress'] = pcIpAddress;
    // data['pcName'] = pcName;
    // data['pcUserName'] = pcUserName;
    // if (wallets != null) {
    //   data['wallets'] = wallets!.map((v) => v.toJson()).toList();
    // }
    // if (farms != null) {
    //   data['farms'] = farms!.map((v) => v.toJson()).toList();
    // }
    // if (freshFruitBunches != null) {
    //   data['freshFruitBunches'] =
    //       freshFruitBunches!.map((v) => v?.toJson()).toList();
    // }
    data['userId'] = userId;
    data['name'] = name;
    return data;
  }
}

// class AccountDetails {
//   int? oid;
//   String? accountName;
//   String? accountNo;
//   Null? bvn;
//   Null? email;
//   int? accountTypeOid;
//   int? bankOid;
//   String? description;
//   String? createdBy;
//   String? createdOn;
//   Null? modifiedBy;
//   String? modifiedOn;
//   String? pcDomainName;
//   String? pcIpAddress;
//   String? pcName;
//   String? pcUserName;
//
//   AccountDetails(
//       {this.oid,
//       this.accountName,
//       this.accountNo,
//       this.bvn,
//       this.email,
//       this.accountTypeOid,
//       this.bankOid,
//       this.description,
//       this.createdBy,
//       this.createdOn,
//       this.modifiedBy,
//       this.modifiedOn,
//       this.pcDomainName,
//       this.pcIpAddress,
//       this.pcName,
//       this.pcUserName});
//
//   AccountDetails.fromJson(Map<String, dynamic> json) {
//     oid = json['oid'];
//     accountName = json['accountName'];
//     accountNo = json['accountNo'];
//     bvn = json['bvn'];
//     email = json['email'];
//     accountTypeOid = json['accountTypeOid'];
//     bankOid = json['bankOid'];
//     description = json['description'];
//     createdBy = json['createdBy'];
//     createdOn = json['createdOn'];
//     modifiedBy = json['modifiedBy'];
//     modifiedOn = json['modifiedOn'];
//     pcDomainName = json['pcDomainName'];
//     pcIpAddress = json['pcIpAddress'];
//     pcName = json['pcName'];
//     pcUserName = json['pcUserName'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['oid'] = oid;
//     data['accountName'] = accountName;
//     data['accountNo'] = accountNo;
//     data['bvn'] = bvn;
//     data['email'] = email;
//     data['accountTypeOid'] = accountTypeOid;
//     data['bankOid'] = bankOid;
//     data['description'] = description;
//     data['createdBy'] = createdBy;
//     data['createdOn'] = createdOn;
//     data['modifiedBy'] = modifiedBy;
//     data['modifiedOn'] = modifiedOn;
//     data['pcDomainName'] = pcDomainName;
//     data['pcIpAddress'] = pcIpAddress;
//     data['pcName'] = pcName;
//     data['pcUserName'] = pcUserName;
//     return data;
//   }
// }
//
// class Location {
//   int? oid;
//   int? countryOid;
//   String? description;
//   int? stateOid;
//   int? localGovernmentOid;
//   Null? wardOid;
//   Null? others;
//   String? createdBy;
//   String? createdOn;
//   Null? modifiedBy;
//   String? modifiedOn;
//   String? pcDomainName;
//   String? pcIpAddress;
//   String? pcName;
//   String? pcUserName;
//
//   Location(
//       {this.oid,
//       this.countryOid,
//       this.description,
//       this.stateOid,
//       this.localGovernmentOid,
//       this.wardOid,
//       this.others,
//       this.createdBy,
//       this.createdOn,
//       this.modifiedBy,
//       this.modifiedOn,
//       this.pcDomainName,
//       this.pcIpAddress,
//       this.pcName,
//       this.pcUserName});
//
//   Location.fromJson(Map<String, dynamic> json) {
//     oid = json['oid'];
//     countryOid = json['countryOid'];
//     description = json['description'];
//     stateOid = json['stateOid'];
//     localGovernmentOid = json['localGovernmentOid'];
//     wardOid = json['wardOid'];
//     others = json['others'];
//     createdBy = json['createdBy'];
//     createdOn = json['createdOn'];
//     modifiedBy = json['modifiedBy'];
//     modifiedOn = json['modifiedOn'];
//     pcDomainName = json['pcDomainName'];
//     pcIpAddress = json['pcIpAddress'];
//     pcName = json['pcName'];
//     pcUserName = json['pcUserName'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['oid'] = oid;
//     data['countryOid'] = countryOid;
//     data['description'] = description;
//     data['stateOid'] = stateOid;
//     data['localGovernmentOid'] = localGovernmentOid;
//     data['wardOid'] = wardOid;
//     data['others'] = others;
//     data['createdBy'] = createdBy;
//     data['createdOn'] = createdOn;
//     data['modifiedBy'] = modifiedBy;
//     data['modifiedOn'] = modifiedOn;
//     data['pcDomainName'] = pcDomainName;
//     data['pcIpAddress'] = pcIpAddress;
//     data['pcName'] = pcName;
//     data['pcUserName'] = pcUserName;
//     return data;
//   }
// }
//
// class MeansOfIdentification {
//   int? oid;
//   String? expiryDate;
//   int? identityTypeOid;
//   Null? idNo;
//   Null? issuingBody;
//   String? issuingDate;
//   Null? placeOfIssue;
//   String? createdBy;
//   String? createdOn;
//   Null? modifiedBy;
//   String? modifiedOn;
//   String? pcDomainName;
//   String? pcIpAddress;
//   String? pcName;
//   String? pcUserName;
//
//   MeansOfIdentification(
//       {this.oid,
//       this.expiryDate,
//       this.identityTypeOid,
//       this.idNo,
//       this.issuingBody,
//       this.issuingDate,
//       this.placeOfIssue,
//       this.createdBy,
//       this.createdOn,
//       this.modifiedBy,
//       this.modifiedOn,
//       this.pcDomainName,
//       this.pcIpAddress,
//       this.pcName,
//       this.pcUserName});
//
//   MeansOfIdentification.fromJson(Map<String, dynamic> json) {
//     oid = json['oid'];
//     expiryDate = json['expiryDate'];
//     identityTypeOid = json['identityTypeOid'];
//     idNo = json['idNo'];
//     issuingBody = json['issuingBody'];
//     issuingDate = json['issuingDate'];
//     placeOfIssue = json['placeOfIssue'];
//     createdBy = json['createdBy'];
//     createdOn = json['createdOn'];
//     modifiedBy = json['modifiedBy'];
//     modifiedOn = json['modifiedOn'];
//     pcDomainName = json['pcDomainName'];
//     pcIpAddress = json['pcIpAddress'];
//     pcName = json['pcName'];
//     pcUserName = json['pcUserName'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['oid'] = oid;
//     data['expiryDate'] = expiryDate;
//     data['identityTypeOid'] = identityTypeOid;
//     data['idNo'] = idNo;
//     data['issuingBody'] = issuingBody;
//     data['issuingDate'] = issuingDate;
//     data['placeOfIssue'] = placeOfIssue;
//     data['createdBy'] = createdBy;
//     data['createdOn'] = createdOn;
//     data['modifiedBy'] = modifiedBy;
//     data['modifiedOn'] = modifiedOn;
//     data['pcDomainName'] = pcDomainName;
//     data['pcIpAddress'] = pcIpAddress;
//     data['pcName'] = pcName;
//     data['pcUserName'] = pcUserName;
//     return data;
//   }
// }
//
// class Nationality {
//   int? oid;
//   String? description;
//   int? countryOid;
//   int? stateOid;
//   int? localGovernmentOid;
//   Null? districtOid;
//   Null? wardOid;
//   String? createdBy;
//   String? createdOn;
//   Null? modifiedBy;
//   String? modifiedOn;
//   String? pcDomainName;
//   String? pcIpAddress;
//   String? pcName;
//   String? pcUserName;
//
//   Nationality(
//       {this.oid,
//       this.description,
//       this.countryOid,
//       this.stateOid,
//       this.localGovernmentOid,
//       this.districtOid,
//       this.wardOid,
//       this.createdBy,
//       this.createdOn,
//       this.modifiedBy,
//       this.modifiedOn,
//       this.pcDomainName,
//       this.pcIpAddress,
//       this.pcName,
//       this.pcUserName});
//
//   Nationality.fromJson(Map<String, dynamic> json) {
//     oid = json['oid'];
//     description = json['description'];
//     countryOid = json['countryOid'];
//     stateOid = json['stateOid'];
//     localGovernmentOid = json['localGovernmentOid'];
//     districtOid = json['districtOid'];
//     wardOid = json['wardOid'];
//     createdBy = json['createdBy'];
//     createdOn = json['createdOn'];
//     modifiedBy = json['modifiedBy'];
//     modifiedOn = json['modifiedOn'];
//     pcDomainName = json['pcDomainName'];
//     pcIpAddress = json['pcIpAddress'];
//     pcName = json['pcName'];
//     pcUserName = json['pcUserName'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['oid'] = oid;
//     data['description'] = description;
//     data['countryOid'] = countryOid;
//     data['stateOid'] = stateOid;
//     data['localGovernmentOid'] = localGovernmentOid;
//     data['districtOid'] = districtOid;
//     data['wardOid'] = wardOid;
//     data['createdBy'] = createdBy;
//     data['createdOn'] = createdOn;
//     data['modifiedBy'] = modifiedBy;
//     data['modifiedOn'] = modifiedOn;
//     data['pcDomainName'] = pcDomainName;
//     data['pcIpAddress'] = pcIpAddress;
//     data['pcName'] = pcName;
//     data['pcUserName'] = pcUserName;
//     return data;
//   }
// }
//
// class NextOfKin {
//   int? oid;
//   Null? bvn;
//   Null? contactAddress;
//   Null? email;
//   Null? firstName;
//   int? gender;
//   Null? lastName;
//   Null? middleName;
//   Null? name;
//   Null? primaryPhone;
//   Null? relationshipTypeOid;
//   Null? secondaryPhone;
//   Null? stateOid;
//   String? createdBy;
//   String? createdOn;
//   Null? modifiedBy;
//   String? modifiedOn;
//   String? pcDomainName;
//   String? pcIpAddress;
//   String? pcName;
//   String? pcUserName;
//
//   NextOfKin(
//       {this.oid,
//       this.bvn,
//       this.contactAddress,
//       this.email,
//       this.firstName,
//       this.gender,
//       this.lastName,
//       this.middleName,
//       this.name,
//       this.primaryPhone,
//       this.relationshipTypeOid,
//       this.secondaryPhone,
//       this.stateOid,
//       this.createdBy,
//       this.createdOn,
//       this.modifiedBy,
//       this.modifiedOn,
//       this.pcDomainName,
//       this.pcIpAddress,
//       this.pcName,
//       this.pcUserName});
//
//   NextOfKin.fromJson(Map<String, dynamic> json) {
//     oid = json['oid'];
//     bvn = json['bvn'];
//     contactAddress = json['contactAddress'];
//     email = json['email'];
//     firstName = json['firstName'];
//     gender = json['gender'];
//     lastName = json['lastName'];
//     middleName = json['middleName'];
//     name = json['name'];
//     primaryPhone = json['primaryPhone'];
//     relationshipTypeOid = json['relationshipTypeOid'];
//     secondaryPhone = json['secondaryPhone'];
//     stateOid = json['stateOid'];
//     createdBy = json['createdBy'];
//     createdOn = json['createdOn'];
//     modifiedBy = json['modifiedBy'];
//     modifiedOn = json['modifiedOn'];
//     pcDomainName = json['pcDomainName'];
//     pcIpAddress = json['pcIpAddress'];
//     pcName = json['pcName'];
//     pcUserName = json['pcUserName'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['oid'] = oid;
//     data['bvn'] = bvn;
//     data['contactAddress'] = contactAddress;
//     data['email'] = email;
//     data['firstName'] = firstName;
//     data['gender'] = gender;
//     data['lastName'] = lastName;
//     data['middleName'] = middleName;
//     data['name'] = name;
//     data['primaryPhone'] = primaryPhone;
//     data['relationshipTypeOid'] = relationshipTypeOid;
//     data['secondaryPhone'] = secondaryPhone;
//     data['stateOid'] = stateOid;
//     data['createdBy'] = createdBy;
//     data['createdOn'] = createdOn;
//     data['modifiedBy'] = modifiedBy;
//     data['modifiedOn'] = modifiedOn;
//     data['pcDomainName'] = pcDomainName;
//     data['pcIpAddress'] = pcIpAddress;
//     data['pcName'] = pcName;
//     data['pcUserName'] = pcUserName;
//     return data;
//   }
// }
//
// class Spouse {
//   int? oid;
//   Null? bvn;
//   Null? email;
//   Null? firstName;
//   int? gender;
//   Null? lastName;
//   Null? middleName;
//   String? name;
//   Null? primaryPhone;
//   Null? residentialAddress;
//   Null? secondaryPhone;
//   Null? stateOid;
//   String? createdBy;
//   String? createdOn;
//   Null? modifiedBy;
//   String? modifiedOn;
//   String? pcDomainName;
//   String? pcIpAddress;
//   String? pcName;
//   String? pcUserName;
//
//   Spouse(
//       {this.oid,
//       this.bvn,
//       this.email,
//       this.firstName,
//       this.gender,
//       this.lastName,
//       this.middleName,
//       this.name,
//       this.primaryPhone,
//       this.residentialAddress,
//       this.secondaryPhone,
//       this.stateOid,
//       this.createdBy,
//       this.createdOn,
//       this.modifiedBy,
//       this.modifiedOn,
//       this.pcDomainName,
//       this.pcIpAddress,
//       this.pcName,
//       this.pcUserName});
//
//   Spouse.fromJson(Map<String, dynamic> json) {
//     oid = json['oid'];
//     bvn = json['bvn'];
//     email = json['email'];
//     firstName = json['firstName'];
//     gender = json['gender'];
//     lastName = json['lastName'];
//     middleName = json['middleName'];
//     name = json['name'];
//     primaryPhone = json['primaryPhone'];
//     residentialAddress = json['residentialAddress'];
//     secondaryPhone = json['secondaryPhone'];
//     stateOid = json['stateOid'];
//     createdBy = json['createdBy'];
//     createdOn = json['createdOn'];
//     modifiedBy = json['modifiedBy'];
//     modifiedOn = json['modifiedOn'];
//     pcDomainName = json['pcDomainName'];
//     pcIpAddress = json['pcIpAddress'];
//     pcName = json['pcName'];
//     pcUserName = json['pcUserName'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['oid'] = oid;
//     data['bvn'] = bvn;
//     data['email'] = email;
//     data['firstName'] = firstName;
//     data['gender'] = gender;
//     data['lastName'] = lastName;
//     data['middleName'] = middleName;
//     data['name'] = name;
//     data['primaryPhone'] = primaryPhone;
//     data['residentialAddress'] = residentialAddress;
//     data['secondaryPhone'] = secondaryPhone;
//     data['stateOid'] = stateOid;
//     data['createdBy'] = createdBy;
//     data['createdOn'] = createdOn;
//     data['modifiedBy'] = modifiedBy;
//     data['modifiedOn'] = modifiedOn;
//     data['pcDomainName'] = pcDomainName;
//     data['pcIpAddress'] = pcIpAddress;
//     data['pcName'] = pcName;
//     data['pcUserName'] = pcUserName;
//     return data;
//   }
// }
//
// class Farms {
//   int? oid;
//   int? aggregationMasterOid;
//   int? averageProduction;
//   int? distanceToTheMill;
//   int? farmerOid;
//   Location? location;
//   int? noOfCyclesCompleted;
//   int? size;
//   String? title;
//   String? createdBy;
//   String? createdOn;
//   String? modifiedBy;
//   String? modifiedOn;
//   String? pcDomainName;
//   String? pcIpAddress;
//   String? pcName;
//   String? pcUserName;
//
//   Farms(
//       {this.oid,
//       this.aggregationMasterOid,
//       this.averageProduction,
//       this.distanceToTheMill,
//       this.farmerOid,
//       this.location,
//       this.noOfCyclesCompleted,
//       this.size,
//       this.title,
//       this.createdBy,
//       this.createdOn,
//       this.modifiedBy,
//       this.modifiedOn,
//       this.pcDomainName,
//       this.pcIpAddress,
//       this.pcName,
//       this.pcUserName});
//
//   Farms.fromJson(Map<String, dynamic> json) {
//     oid = json['oid'];
//     aggregationMasterOid = json['aggregationMasterOid'];
//     averageProduction = json['averageProduction'];
//     distanceToTheMill = json['distanceToTheMill'];
//     farmerOid = json['farmerOid'];
//     location =
//         json['location'] != null ? Location.fromJson(json['location']) : null;
//     noOfCyclesCompleted = json['noOfCyclesCompleted'];
//     size = json['size'];
//     title = json['title'];
//     createdBy = json['createdBy'];
//     createdOn = json['createdOn'];
//     modifiedBy = json['modifiedBy'];
//     modifiedOn = json['modifiedOn'];
//     pcDomainName = json['pcDomainName'];
//     pcIpAddress = json['pcIpAddress'];
//     pcName = json['pcName'];
//     pcUserName = json['pcUserName'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['oid'] = oid;
//     data['aggregationMasterOid'] = aggregationMasterOid;
//     data['averageProduction'] = averageProduction;
//     data['distanceToTheMill'] = distanceToTheMill;
//     data['farmerOid'] = farmerOid;
//     if (location != null) {
//       data['location'] = location!.toJson();
//     }
//     data['noOfCyclesCompleted'] = noOfCyclesCompleted;
//     data['size'] = size;
//     data['title'] = title;
//     data['createdBy'] = createdBy;
//     data['createdOn'] = createdOn;
//     data['modifiedBy'] = modifiedBy;
//     data['modifiedOn'] = modifiedOn;
//     data['pcDomainName'] = pcDomainName;
//     data['pcIpAddress'] = pcIpAddress;
//     data['pcName'] = pcName;
//     data['pcUserName'] = pcUserName;
//     return data;
//   }
// }
