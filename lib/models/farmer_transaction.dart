// class FarmerTransaction {
//   int? statusCode;
//   int? count;
//   String? message;
//   List<Values>? values;

//   FarmerTransaction({this.statusCode, this.count, this.message, this.values});

//   FarmerTransaction.fromJson(Map<String, dynamic> json) {
//     statusCode = json['statusCode'];
//     count = json['count'];
//     message = json['message'];
//     if (json['values'] != null) {
//       values = <Values>[];
//       json['values'].forEach((v) {
//         values!.add(new Values.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['statusCode'] = this.statusCode;
//     data['count'] = this.count;
//     data['message'] = this.message;
//     if (this.values != null) {
//       data['values'] = this.values!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Values {
//   int? oid;
//   int? titleOid;
//   String? firstName;
//   Null? middleName;
//   String? lastName;
//   int? gender;
//   Null? email;
//   String? dateOfBirth;
//   String? applicantId;
//   String? bvn;
//   Null? primaryPhone;
//   Null? secondaryPhone;
//   int? seasonOid;
//   int? assignedAgentOid;
//   int? clusterOid;
//   int? cooperativeOid;
//   Null? contactAddress;
//   Null? photo;
//   int? cooperativeMembershipStatus;
//   int? maritalStatus;
//   int? onBoardingType;
//   AccountDetails? accountDetails;
//   Location? location;
//   MeansOfIdentification? meansOfIdentification;
//   Nationality? nationality;
//   NextOfKin? nextOfKin;
//   Spouse? spouse;
//   String? createdBy;
//   String? createdOn;
//   String? modifiedBy;
//   String? modifiedOn;
//   String? pcDomainName;
//   String? pcIpAddress;
//   String? pcName;
//   String? pcUserName;
//   List<Null>? wallets;
//   List<Farms>? farms;
//   List<Null>? freshFruitBunches;
//   String? userId;
//   String? name;

//   Values(
//       {this.oid,
//       this.titleOid,
//       this.firstName,
//       this.middleName,
//       this.lastName,
//       this.gender,
//       this.email,
//       this.dateOfBirth,
//       this.applicantId,
//       this.bvn,
//       this.primaryPhone,
//       this.secondaryPhone,
//       this.seasonOid,
//       this.assignedAgentOid,
//       this.clusterOid,
//       this.cooperativeOid,
//       this.contactAddress,
//       this.photo,
//       this.cooperativeMembershipStatus,
//       this.maritalStatus,
//       this.onBoardingType,
//       this.accountDetails,
//       this.location,
//       this.meansOfIdentification,
//       this.nationality,
//       this.nextOfKin,
//       this.spouse,
//       this.createdBy,
//       this.createdOn,
//       this.modifiedBy,
//       this.modifiedOn,
//       this.pcDomainName,
//       this.pcIpAddress,
//       this.pcName,
//       this.pcUserName,
//       this.wallets,
//       this.farms,
//       this.freshFruitBunches,
//       this.userId,
//       this.name});

//   Values.fromJson(Map<String, dynamic> json) {
//     oid = json['oid'];
//     titleOid = json['titleOid'];
//     firstName = json['firstName'];
//     middleName = json['middleName'];
//     lastName = json['lastName'];
//     gender = json['gender'];
//     email = json['email'];
//     dateOfBirth = json['dateOfBirth'];
//     applicantId = json['applicantId'];
//     bvn = json['bvn'];
//     primaryPhone = json['primaryPhone'];
//     secondaryPhone = json['secondaryPhone'];
//     seasonOid = json['seasonOid'];
//     assignedAgentOid = json['assignedAgentOid'];
//     clusterOid = json['clusterOid'];
//     cooperativeOid = json['cooperativeOid'];
//     contactAddress = json['contactAddress'];
//     photo = json['photo'];
//     cooperativeMembershipStatus = json['cooperativeMembershipStatus'];
//     maritalStatus = json['maritalStatus'];
//     onBoardingType = json['onBoardingType'];
//     accountDetails = json['accountDetails'] != null
//         ? new AccountDetails.fromJson(json['accountDetails'])
//         : null;
//     location = json['location'] != null
//         ? new Location.fromJson(json['location'])
//         : null;
//     meansOfIdentification = json['meansOfIdentification'] != null
//         ? new MeansOfIdentification.fromJson(json['meansOfIdentification'])
//         : null;
//     nationality = json['nationality'] != null
//         ? new Nationality.fromJson(json['nationality'])
//         : null;
//     nextOfKin = json['nextOfKin'] != null
//         ? new NextOfKin.fromJson(json['nextOfKin'])
//         : null;
//     spouse =
//         json['spouse'] != null ? new Spouse.fromJson(json['spouse']) : null;
//     createdBy = json['createdBy'];
//     createdOn = json['createdOn'];
//     modifiedBy = json['modifiedBy'];
//     modifiedOn = json['modifiedOn'];
//     pcDomainName = json['pcDomainName'];
//     pcIpAddress = json['pcIpAddress'];
//     pcName = json['pcName'];
//     pcUserName = json['pcUserName'];
//     if (json['wallets'] != null) {
//       wallets = <Null>[];
//       json['wallets'].forEach((v) {
//         wallets!.add(new Null.fromJson(v));
//       });
//     }
//     if (json['farms'] != null) {
//       farms = <Farms>[];
//       json['farms'].forEach((v) {
//         farms!.add(new Farms.fromJson(v));
//       });
//     }
//     if (json['freshFruitBunches'] != null) {
//       freshFruitBunches = <Null>[];
//       json['freshFruitBunches'].forEach((v) {
//         freshFruitBunches!.add(new Null.fromJson(v));
//       });
//     }
//     userId = json['userId'];
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['oid'] = this.oid;
//     data['titleOid'] = this.titleOid;
//     data['firstName'] = this.firstName;
//     data['middleName'] = this.middleName;
//     data['lastName'] = this.lastName;
//     data['gender'] = this.gender;
//     data['email'] = this.email;
//     data['dateOfBirth'] = this.dateOfBirth;
//     data['applicantId'] = this.applicantId;
//     data['bvn'] = this.bvn;
//     data['primaryPhone'] = this.primaryPhone;
//     data['secondaryPhone'] = this.secondaryPhone;
//     data['seasonOid'] = this.seasonOid;
//     data['assignedAgentOid'] = this.assignedAgentOid;
//     data['clusterOid'] = this.clusterOid;
//     data['cooperativeOid'] = this.cooperativeOid;
//     data['contactAddress'] = this.contactAddress;
//     data['photo'] = this.photo;
//     data['cooperativeMembershipStatus'] = this.cooperativeMembershipStatus;
//     data['maritalStatus'] = this.maritalStatus;
//     data['onBoardingType'] = this.onBoardingType;
//     if (this.accountDetails != null) {
//       data['accountDetails'] = this.accountDetails!.toJson();
//     }
//     if (this.location != null) {
//       data['location'] = this.location!.toJson();
//     }
//     if (this.meansOfIdentification != null) {
//       data['meansOfIdentification'] = this.meansOfIdentification!.toJson();
//     }
//     if (this.nationality != null) {
//       data['nationality'] = this.nationality!.toJson();
//     }
//     if (this.nextOfKin != null) {
//       data['nextOfKin'] = this.nextOfKin!.toJson();
//     }
//     if (this.spouse != null) {
//       data['spouse'] = this.spouse!.toJson();
//     }
//     data['createdBy'] = this.createdBy;
//     data['createdOn'] = this.createdOn;
//     data['modifiedBy'] = this.modifiedBy;
//     data['modifiedOn'] = this.modifiedOn;
//     data['pcDomainName'] = this.pcDomainName;
//     data['pcIpAddress'] = this.pcIpAddress;
//     data['pcName'] = this.pcName;
//     data['pcUserName'] = this.pcUserName;
//     if (this.wallets != null) {
//       data['wallets'] = this.wallets!.map((v) => v.toJson()).toList();
//     }
//     if (this.farms != null) {
//       data['farms'] = this.farms!.map((v) => v.toJson()).toList();
//     }
//     if (this.freshFruitBunches != null) {
//       data['freshFruitBunches'] =
//           this.freshFruitBunches!.map((v) => v.toJson()).toList();
//     }
//     data['userId'] = this.userId;
//     data['name'] = this.name;
//     return data;
//   }
// }

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

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['oid'] = this.oid;
//     data['accountName'] = this.accountName;
//     data['accountNo'] = this.accountNo;
//     data['bvn'] = this.bvn;
//     data['email'] = this.email;
//     data['accountTypeOid'] = this.accountTypeOid;
//     data['bankOid'] = this.bankOid;
//     data['description'] = this.description;
//     data['createdBy'] = this.createdBy;
//     data['createdOn'] = this.createdOn;
//     data['modifiedBy'] = this.modifiedBy;
//     data['modifiedOn'] = this.modifiedOn;
//     data['pcDomainName'] = this.pcDomainName;
//     data['pcIpAddress'] = this.pcIpAddress;
//     data['pcName'] = this.pcName;
//     data['pcUserName'] = this.pcUserName;
//     return data;
//   }
// }

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

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['oid'] = this.oid;
//     data['countryOid'] = this.countryOid;
//     data['description'] = this.description;
//     data['stateOid'] = this.stateOid;
//     data['localGovernmentOid'] = this.localGovernmentOid;
//     data['wardOid'] = this.wardOid;
//     data['others'] = this.others;
//     data['createdBy'] = this.createdBy;
//     data['createdOn'] = this.createdOn;
//     data['modifiedBy'] = this.modifiedBy;
//     data['modifiedOn'] = this.modifiedOn;
//     data['pcDomainName'] = this.pcDomainName;
//     data['pcIpAddress'] = this.pcIpAddress;
//     data['pcName'] = this.pcName;
//     data['pcUserName'] = this.pcUserName;
//     return data;
//   }
// }

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

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['oid'] = this.oid;
//     data['expiryDate'] = this.expiryDate;
//     data['identityTypeOid'] = this.identityTypeOid;
//     data['idNo'] = this.idNo;
//     data['issuingBody'] = this.issuingBody;
//     data['issuingDate'] = this.issuingDate;
//     data['placeOfIssue'] = this.placeOfIssue;
//     data['createdBy'] = this.createdBy;
//     data['createdOn'] = this.createdOn;
//     data['modifiedBy'] = this.modifiedBy;
//     data['modifiedOn'] = this.modifiedOn;
//     data['pcDomainName'] = this.pcDomainName;
//     data['pcIpAddress'] = this.pcIpAddress;
//     data['pcName'] = this.pcName;
//     data['pcUserName'] = this.pcUserName;
//     return data;
//   }
// }

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

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['oid'] = this.oid;
//     data['description'] = this.description;
//     data['countryOid'] = this.countryOid;
//     data['stateOid'] = this.stateOid;
//     data['localGovernmentOid'] = this.localGovernmentOid;
//     data['districtOid'] = this.districtOid;
//     data['wardOid'] = this.wardOid;
//     data['createdBy'] = this.createdBy;
//     data['createdOn'] = this.createdOn;
//     data['modifiedBy'] = this.modifiedBy;
//     data['modifiedOn'] = this.modifiedOn;
//     data['pcDomainName'] = this.pcDomainName;
//     data['pcIpAddress'] = this.pcIpAddress;
//     data['pcName'] = this.pcName;
//     data['pcUserName'] = this.pcUserName;
//     return data;
//   }
// }

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

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['oid'] = this.oid;
//     data['bvn'] = this.bvn;
//     data['contactAddress'] = this.contactAddress;
//     data['email'] = this.email;
//     data['firstName'] = this.firstName;
//     data['gender'] = this.gender;
//     data['lastName'] = this.lastName;
//     data['middleName'] = this.middleName;
//     data['name'] = this.name;
//     data['primaryPhone'] = this.primaryPhone;
//     data['relationshipTypeOid'] = this.relationshipTypeOid;
//     data['secondaryPhone'] = this.secondaryPhone;
//     data['stateOid'] = this.stateOid;
//     data['createdBy'] = this.createdBy;
//     data['createdOn'] = this.createdOn;
//     data['modifiedBy'] = this.modifiedBy;
//     data['modifiedOn'] = this.modifiedOn;
//     data['pcDomainName'] = this.pcDomainName;
//     data['pcIpAddress'] = this.pcIpAddress;
//     data['pcName'] = this.pcName;
//     data['pcUserName'] = this.pcUserName;
//     return data;
//   }
// }

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

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['oid'] = this.oid;
//     data['bvn'] = this.bvn;
//     data['email'] = this.email;
//     data['firstName'] = this.firstName;
//     data['gender'] = this.gender;
//     data['lastName'] = this.lastName;
//     data['middleName'] = this.middleName;
//     data['name'] = this.name;
//     data['primaryPhone'] = this.primaryPhone;
//     data['residentialAddress'] = this.residentialAddress;
//     data['secondaryPhone'] = this.secondaryPhone;
//     data['stateOid'] = this.stateOid;
//     data['createdBy'] = this.createdBy;
//     data['createdOn'] = this.createdOn;
//     data['modifiedBy'] = this.modifiedBy;
//     data['modifiedOn'] = this.modifiedOn;
//     data['pcDomainName'] = this.pcDomainName;
//     data['pcIpAddress'] = this.pcIpAddress;
//     data['pcName'] = this.pcName;
//     data['pcUserName'] = this.pcUserName;
//     return data;
//   }
// }

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

//   Farms.fromJson(Map<String, dynamic> json) {
//     oid = json['oid'];
//     aggregationMasterOid = json['aggregationMasterOid'];
//     averageProduction = json['averageProduction'];
//     distanceToTheMill = json['distanceToTheMill'];
//     farmerOid = json['farmerOid'];
//     location = json['location'] != null
//         ? new Location.fromJson(json['location'])
//         : null;
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

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['oid'] = this.oid;
//     data['aggregationMasterOid'] = this.aggregationMasterOid;
//     data['averageProduction'] = this.averageProduction;
//     data['distanceToTheMill'] = this.distanceToTheMill;
//     data['farmerOid'] = this.farmerOid;
//     if (this.location != null) {
//       data['location'] = this.location!.toJson();
//     }
//     data['noOfCyclesCompleted'] = this.noOfCyclesCompleted;
//     data['size'] = this.size;
//     data['title'] = this.title;
//     data['createdBy'] = this.createdBy;
//     data['createdOn'] = this.createdOn;
//     data['modifiedBy'] = this.modifiedBy;
//     data['modifiedOn'] = this.modifiedOn;
//     data['pcDomainName'] = this.pcDomainName;
//     data['pcIpAddress'] = this.pcIpAddress;
//     data['pcName'] = this.pcName;
//     data['pcUserName'] = this.pcUserName;
//     return data;
//   }
// }
