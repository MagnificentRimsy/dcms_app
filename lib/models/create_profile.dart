class CreateProfile {
  int? titleOid;
  String? firstName;
  String? middleName;
  String? lastName;
  int? gender;
  String? email;
  String? dateOfBirth;
  String? applicantId;
  String? bvn;
  String? primaryPhone;
  String? secondaryPhone;
  int? seasonOid;
  int? assignedAgentOid;
  int? clusterOid;
  int? cooperativeOid;
  String? contactAddress;
  String? photo;
  int? cooperativeMembershipStatus;
  int? maritalStatus;
  int? onBoardingType;
  AccountDetails? accountDetails;
  Location? location;
  MeansOfIdentification? meansOfIdentification;
  Nationality? nationality;
  NextOfKin? nextOfKin;
  Spouse? spouse;
  String? createdBy;
  String? createdOn;
  String? pcDomainName;
  String? pcIpAddress;
  String? pcName;
  String? pcUserName;
  String? userName;

  CreateProfile(
      {this.titleOid,
      this.firstName,
      this.middleName,
      this.lastName,
      this.gender,
      this.email,
      this.dateOfBirth,
      this.applicantId,
      this.bvn,
      this.primaryPhone,
      this.secondaryPhone,
      this.seasonOid,
      this.assignedAgentOid,
      this.clusterOid,
      this.cooperativeOid,
      this.contactAddress,
      this.photo,
      this.cooperativeMembershipStatus,
      this.maritalStatus,
      this.onBoardingType,
      this.accountDetails,
      this.location,
      this.meansOfIdentification,
      this.nationality,
      this.nextOfKin,
      this.spouse,
      this.createdBy,
      this.createdOn,
      this.pcDomainName,
      this.pcIpAddress,
      this.pcName,
      this.pcUserName,
      this.userName});

  CreateProfile.fromJson(Map<String, dynamic> json) {
    titleOid = json['titleOid'];
    firstName = json['firstName'];
    middleName = json['middleName'];
    lastName = json['lastName'];
    gender = json['gender'];
    email = json['email'];
    dateOfBirth = json['dateOfBirth'];
    applicantId = json['applicantId'];
    bvn = json['bvn'];
    primaryPhone = json['primaryPhone'];
    secondaryPhone = json['secondaryPhone'];
    seasonOid = json['seasonOid'];
    assignedAgentOid = json['assignedAgentOid'];
    clusterOid = json['clusterOid'];
    cooperativeOid = json['cooperativeOid'];
    contactAddress = json['contactAddress'];
    photo = json['photo'];
    cooperativeMembershipStatus = json['cooperativeMembershipStatus'];
    maritalStatus = json['maritalStatus'];
    onBoardingType = json['onBoardingType'];
    accountDetails = json['accountDetails'] != null
        ? new AccountDetails.fromJson(json['accountDetails'])
        : null;
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    meansOfIdentification = json['meansOfIdentification'] != null
        ? new MeansOfIdentification.fromJson(json['meansOfIdentification'])
        : null;
    nationality = json['nationality'] != null
        ? new Nationality.fromJson(json['nationality'])
        : null;
    nextOfKin = json['nextOfKin'] != null
        ? new NextOfKin.fromJson(json['nextOfKin'])
        : null;
    spouse =
        json['spouse'] != null ? new Spouse.fromJson(json['spouse']) : null;
    createdBy = json['createdBy'];
    createdOn = json['createdOn'];
    pcDomainName = json['pcDomainName'];
    pcIpAddress = json['pcIpAddress'];
    pcName = json['pcName'];
    pcUserName = json['pcUserName'];
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['titleOid'] = this.titleOid;
    data['firstName'] = this.firstName;
    data['middleName'] = this.middleName;
    data['lastName'] = this.lastName;
    data['gender'] = this.gender;
    data['email'] = this.email;
    data['dateOfBirth'] = this.dateOfBirth;
    data['applicantId'] = this.applicantId;
    data['bvn'] = this.bvn;
    data['primaryPhone'] = this.primaryPhone;
    data['secondaryPhone'] = this.secondaryPhone;
    data['seasonOid'] = this.seasonOid;
    data['assignedAgentOid'] = this.assignedAgentOid;
    data['clusterOid'] = this.clusterOid;
    data['cooperativeOid'] = this.cooperativeOid;
    data['contactAddress'] = this.contactAddress;
    data['photo'] = this.photo;
    data['cooperativeMembershipStatus'] = this.cooperativeMembershipStatus;
    data['maritalStatus'] = this.maritalStatus;
    data['onBoardingType'] = this.onBoardingType;
    if (this.accountDetails != null) {
      data['accountDetails'] = this.accountDetails!.toJson();
    }
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    if (this.meansOfIdentification != null) {
      data['meansOfIdentification'] = this.meansOfIdentification!.toJson();
    }
    if (this.nationality != null) {
      data['nationality'] = this.nationality!.toJson();
    }
    if (this.nextOfKin != null) {
      data['nextOfKin'] = this.nextOfKin!.toJson();
    }
    if (this.spouse != null) {
      data['spouse'] = this.spouse!.toJson();
    }
    data['createdBy'] = this.createdBy;
    data['createdOn'] = this.createdOn;
    data['pcDomainName'] = this.pcDomainName;
    data['pcIpAddress'] = this.pcIpAddress;
    data['pcName'] = this.pcName;
    data['pcUserName'] = this.pcUserName;
    data['userName'] = this.userName;
    return data;
  }
}

class AccountDetails {
  int? oid;
  String? accountName;
  String? accountNo;
  int? accountTypeOid;
  int? bankOid;
  String? bvn;
  String? createdBy;
  String? createdOn;
  String? pcDomainName;
  String? pcIpAddress;
  String? pcName;
  String? pcUserName;

  AccountDetails(
      {this.oid,
      this.accountName,
      this.accountNo,
      this.accountTypeOid,
      this.bankOid,
      this.bvn,
      this.createdBy,
      this.createdOn,
      this.pcDomainName,
      this.pcIpAddress,
      this.pcName,
      this.pcUserName});

  AccountDetails.fromJson(Map<String, dynamic> json) {
    oid = json['oid'];
    accountName = json['accountName'];
    accountNo = json['accountNo'];
    accountTypeOid = json['accountTypeOid'];
    bankOid = json['bankOid'];
    bvn = json['bvn'];
    createdBy = json['createdBy'];
    createdOn = json['createdOn'];
    pcDomainName = json['pcDomainName'];
    pcIpAddress = json['pcIpAddress'];
    pcName = json['pcName'];
    pcUserName = json['pcUserName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['oid'] = this.oid;
    data['accountName'] = this.accountName;
    data['accountNo'] = this.accountNo;
    data['accountTypeOid'] = this.accountTypeOid;
    data['bankOid'] = this.bankOid;
    data['bvn'] = this.bvn;
    data['createdBy'] = this.createdBy;
    data['createdOn'] = this.createdOn;
    data['pcDomainName'] = this.pcDomainName;
    data['pcIpAddress'] = this.pcIpAddress;
    data['pcName'] = this.pcName;
    data['pcUserName'] = this.pcUserName;
    return data;
  }
}

class Location {
  int? countryOid;
  int? stateOid;
  int? localGovernmentOid;
  String? others;
  String? createdBy;
  String? createdOn;
  String? pcDomainName;
  String? pcIpAddress;
  String? pcName;
  String? pcUserName;

  Location(
      {this.countryOid,
      this.stateOid,
      this.localGovernmentOid,
      this.others,
      this.createdBy,
      this.createdOn,
      this.pcDomainName,
      this.pcIpAddress,
      this.pcName,
      this.pcUserName});

  Location.fromJson(Map<String, dynamic> json) {
    countryOid = json['countryOid'];
    stateOid = json['stateOid'];
    localGovernmentOid = json['localGovernmentOid'];
    others = json['others'];
    createdBy = json['createdBy'];
    createdOn = json['createdOn'];
    pcDomainName = json['pcDomainName'];
    pcIpAddress = json['pcIpAddress'];
    pcName = json['pcName'];
    pcUserName = json['pcUserName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['countryOid'] = this.countryOid;
    data['stateOid'] = this.stateOid;
    data['localGovernmentOid'] = this.localGovernmentOid;
    data['others'] = this.others;
    data['createdBy'] = this.createdBy;
    data['createdOn'] = this.createdOn;
    data['pcDomainName'] = this.pcDomainName;
    data['pcIpAddress'] = this.pcIpAddress;
    data['pcName'] = this.pcName;
    data['pcUserName'] = this.pcUserName;
    return data;
  }
}

class MeansOfIdentification {
  String? expiryDate;
  int? identityTypeOid;
  String? idNo;
  String? issuingBody;
  String? issuingDate;
  String? placeOfIssue;
  String? createdBy;
  String? createdOn;
  String? pcDomainName;
  String? pcIpAddress;
  String? pcName;
  String? pcUserName;

  MeansOfIdentification(
      {this.expiryDate,
      this.identityTypeOid,
      this.idNo,
      this.issuingBody,
      this.issuingDate,
      this.placeOfIssue,
      this.createdBy,
      this.createdOn,
      this.pcDomainName,
      this.pcIpAddress,
      this.pcName,
      this.pcUserName});

  MeansOfIdentification.fromJson(Map<String, dynamic> json) {
    expiryDate = json['expiryDate'];
    identityTypeOid = json['identityTypeOid'];
    idNo = json['idNo'];
    issuingBody = json['issuingBody'];
    issuingDate = json['issuingDate'];
    placeOfIssue = json['placeOfIssue'];
    createdBy = json['createdBy'];
    createdOn = json['createdOn'];
    pcDomainName = json['pcDomainName'];
    pcIpAddress = json['pcIpAddress'];
    pcName = json['pcName'];
    pcUserName = json['pcUserName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['expiryDate'] = this.expiryDate;
    data['identityTypeOid'] = this.identityTypeOid;
    data['idNo'] = this.idNo;
    data['issuingBody'] = this.issuingBody;
    data['issuingDate'] = this.issuingDate;
    data['placeOfIssue'] = this.placeOfIssue;
    data['createdBy'] = this.createdBy;
    data['createdOn'] = this.createdOn;
    data['pcDomainName'] = this.pcDomainName;
    data['pcIpAddress'] = this.pcIpAddress;
    data['pcName'] = this.pcName;
    data['pcUserName'] = this.pcUserName;
    return data;
  }
}

class Nationality {
  int? countryOid;
  int? stateOid;
  int? localGovernmentOid;
  int? districtOid;
  int? wardOid;
  String? createdBy;
  String? createdOn;
  String? pcDomainName;
  String? pcIpAddress;
  String? pcName;
  String? pcUserName;

  Nationality(
      {this.countryOid,
      this.stateOid,
      this.localGovernmentOid,
      this.districtOid,
      this.wardOid,
      this.createdBy,
      this.createdOn,
      this.pcDomainName,
      this.pcIpAddress,
      this.pcName,
      this.pcUserName});

  Nationality.fromJson(Map<String, dynamic> json) {
    countryOid = json['countryOid'];
    stateOid = json['stateOid'];
    localGovernmentOid = json['localGovernmentOid'];
    districtOid = json['districtOid'];
    wardOid = json['wardOid'];
    createdBy = json['createdBy'];
    createdOn = json['createdOn'];
    pcDomainName = json['pcDomainName'];
    pcIpAddress = json['pcIpAddress'];
    pcName = json['pcName'];
    pcUserName = json['pcUserName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['countryOid'] = this.countryOid;
    data['stateOid'] = this.stateOid;
    data['localGovernmentOid'] = this.localGovernmentOid;
    data['districtOid'] = this.districtOid;
    data['wardOid'] = this.wardOid;
    data['createdBy'] = this.createdBy;
    data['createdOn'] = this.createdOn;
    data['pcDomainName'] = this.pcDomainName;
    data['pcIpAddress'] = this.pcIpAddress;
    data['pcName'] = this.pcName;
    data['pcUserName'] = this.pcUserName;
    return data;
  }
}

class NextOfKin {
  String? bvn;
  String? contactAddress;
  String? email;
  String? firstName;
  int? gender;
  String? lastName;
  String? middleName;
  String? name;
  String? primaryPhone;
  int? relationshipTypeOid;
  String? secondaryPhone;
  int? stateOid;
  String? createdBy;
  String? createdOn;
  String? pcDomainName;
  String? pcIpAddress;
  String? pcName;
  String? pcUserName;

  NextOfKin(
      {this.bvn,
      this.contactAddress,
      this.email,
      this.firstName,
      this.gender,
      this.lastName,
      this.middleName,
      this.name,
      this.primaryPhone,
      this.relationshipTypeOid,
      this.secondaryPhone,
      this.stateOid,
      this.createdBy,
      this.createdOn,
      this.pcDomainName,
      this.pcIpAddress,
      this.pcName,
      this.pcUserName});

  NextOfKin.fromJson(Map<String, dynamic> json) {
    bvn = json['bvn'];
    contactAddress = json['contactAddress'];
    email = json['email'];
    firstName = json['firstName'];
    gender = json['gender'];
    lastName = json['lastName'];
    middleName = json['middleName'];
    name = json['name'];
    primaryPhone = json['primaryPhone'];
    relationshipTypeOid = json['relationshipTypeOid'];
    secondaryPhone = json['secondaryPhone'];
    stateOid = json['stateOid'];
    createdBy = json['createdBy'];
    createdOn = json['createdOn'];
    pcDomainName = json['pcDomainName'];
    pcIpAddress = json['pcIpAddress'];
    pcName = json['pcName'];
    pcUserName = json['pcUserName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bvn'] = this.bvn;
    data['contactAddress'] = this.contactAddress;
    data['email'] = this.email;
    data['firstName'] = this.firstName;
    data['gender'] = this.gender;
    data['lastName'] = this.lastName;
    data['middleName'] = this.middleName;
    data['name'] = this.name;
    data['primaryPhone'] = this.primaryPhone;
    data['relationshipTypeOid'] = this.relationshipTypeOid;
    data['secondaryPhone'] = this.secondaryPhone;
    data['stateOid'] = this.stateOid;
    data['createdBy'] = this.createdBy;
    data['createdOn'] = this.createdOn;
    data['pcDomainName'] = this.pcDomainName;
    data['pcIpAddress'] = this.pcIpAddress;
    data['pcName'] = this.pcName;
    data['pcUserName'] = this.pcUserName;
    return data;
  }
}

class Spouse {
  String? bvn;
  String? email;
  String? firstName;
  int? gender;
  String? lastName;
  String? middleName;
  String? name;
  String? primaryPhone;
  String? residentialAddress;
  String? secondaryPhone;
  int? stateOid;
  String? createdBy;
  String? createdOn;
  String? pcDomainName;
  String? pcIpAddress;
  String? pcName;
  String? pcUserName;

  Spouse(
      {this.bvn,
      this.email,
      this.firstName,
      this.gender,
      this.lastName,
      this.middleName,
      this.name,
      this.primaryPhone,
      this.residentialAddress,
      this.secondaryPhone,
      this.stateOid,
      this.createdBy,
      this.createdOn,
      this.pcDomainName,
      this.pcIpAddress,
      this.pcName,
      this.pcUserName});

  Spouse.fromJson(Map<String, dynamic> json) {
    bvn = json['bvn'];
    email = json['email'];
    firstName = json['firstName'];
    gender = json['gender'];
    lastName = json['lastName'];
    middleName = json['middleName'];
    name = json['name'];
    primaryPhone = json['primaryPhone'];
    residentialAddress = json['residentialAddress'];
    secondaryPhone = json['secondaryPhone'];
    stateOid = json['stateOid'];
    createdBy = json['createdBy'];
    createdOn = json['createdOn'];
    pcDomainName = json['pcDomainName'];
    pcIpAddress = json['pcIpAddress'];
    pcName = json['pcName'];
    pcUserName = json['pcUserName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bvn'] = this.bvn;
    data['email'] = this.email;
    data['firstName'] = this.firstName;
    data['gender'] = this.gender;
    data['lastName'] = this.lastName;
    data['middleName'] = this.middleName;
    data['name'] = this.name;
    data['primaryPhone'] = this.primaryPhone;
    data['residentialAddress'] = this.residentialAddress;
    data['secondaryPhone'] = this.secondaryPhone;
    data['stateOid'] = this.stateOid;
    data['createdBy'] = this.createdBy;
    data['createdOn'] = this.createdOn;
    data['pcDomainName'] = this.pcDomainName;
    data['pcIpAddress'] = this.pcIpAddress;
    data['pcName'] = this.pcName;
    data['pcUserName'] = this.pcUserName;
    return data;
  }
}
