class Cluster {
  int? statusCode;
  int? count;
  String? message;
  List<ClusterValues>? clusterValues;

  Cluster({this.statusCode, this.count, this.message, this.clusterValues});

  Cluster.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    count = json['count'];
    message = json['message'];
    if (json['values'] != null) {
      clusterValues = <ClusterValues>[];
      json['values'].forEach((v) {
        clusterValues!.add(new ClusterValues.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['count'] = this.count;
    data['message'] = this.message;
    if (this.clusterValues != null) {
      data['values'] =
          this.clusterValues!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ClusterValues {
  int? oid;
  int? locationOid;
  Null? location;
  String? name;
  String? createdBy;
  String? createdOn;
  String? modifiedBy;
  String? modifiedOn;
  String? pcDomainName;
  String? pcIpAddress;
  String? pcName;
  String? pcUserName;
  Null? cooperatives;

  ClusterValues(
      {this.oid,
      this.locationOid,
      this.location,
      this.name,
      this.createdBy,
      this.createdOn,
      this.modifiedBy,
      this.modifiedOn,
      this.pcDomainName,
      this.pcIpAddress,
      this.pcName,
      this.pcUserName,
      this.cooperatives});

  ClusterValues.fromJson(Map<String, dynamic> json) {
    oid = json['oid'];
    locationOid = json['locationOid'];
    location = json['location'];
    name = json['name'];
    createdBy = json['createdBy'];
    createdOn = json['createdOn'];
    modifiedBy = json['modifiedBy'];
    modifiedOn = json['modifiedOn'];
    pcDomainName = json['pcDomainName'];
    pcIpAddress = json['pcIpAddress'];
    pcName = json['pcName'];
    pcUserName = json['pcUserName'];
    cooperatives = json['cooperatives'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['oid'] = this.oid;
    data['locationOid'] = this.locationOid;
    data['location'] = this.location;
    data['name'] = this.name;
    data['createdBy'] = this.createdBy;
    data['createdOn'] = this.createdOn;
    data['modifiedBy'] = this.modifiedBy;
    data['modifiedOn'] = this.modifiedOn;
    data['pcDomainName'] = this.pcDomainName;
    data['pcIpAddress'] = this.pcIpAddress;
    data['pcName'] = this.pcName;
    data['pcUserName'] = this.pcUserName;
    data['cooperatives'] = this.cooperatives;
    return data;
  }
}
