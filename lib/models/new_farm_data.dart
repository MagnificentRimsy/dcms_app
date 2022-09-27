class NewFarmData {
  int? statusCode;
  int? count;
  String? message;
  List<FarmData>? values;

  NewFarmData({this.statusCode, this.count, this.message, this.values});

  NewFarmData.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    count = json['count'];
    message = json['message'];
    if (json['values'] != null) {
      values = <FarmData>[];
      json['values'].forEach((v) {
        values!.add(FarmData.fromJson(v));
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

class FarmData {
  int? oid;
  int? farmerOid;
  String? title;

  FarmData({
    this.oid,
    this.farmerOid,
    this.title,
  });

  FarmData.fromJson(Map<String, dynamic> json) {
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
