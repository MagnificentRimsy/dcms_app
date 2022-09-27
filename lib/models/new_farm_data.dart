class NewFarmData {
  int? statusCode;
  int? count;
  String? message;
  List<FarmValues>? values;

  NewFarmData({this.statusCode, this.count, this.message, this.values});

  NewFarmData.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    count = json['count'];
    message = json['message'];
    if (json['values'] != null) {
      values = <FarmValues>[];
      json['values'].forEach((v) {
        values!.add(FarmValues.fromJson(v));
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

class FarmValues {
  int? oid;
  int? farmerOid;
  String? title;

  FarmValues(
      {this.oid,
      this.farmerOid,
      this.title,
   });

  FarmValues.fromJson(Map<String, dynamic> json) {
    oid = json['oid'];
    farmerOid = json['farmerOid'];
    title = json['title'];
  }
    
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['oid'] = oid;
    data['farmerOid'] = farmerOid;
    data['title'] = title;
    return data;
  }
}
