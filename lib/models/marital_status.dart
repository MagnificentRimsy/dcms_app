class MaritalStatus {
  int? statusCode;
  String? message;
  List<MaritalStatusValues>? maritalStatusValues;

  MaritalStatus({this.statusCode, this.message, this.maritalStatusValues});

  MaritalStatus.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['value'] != null) {
      maritalStatusValues = <MaritalStatusValues>[];
      json['value'].forEach((v) {
        maritalStatusValues!.add(new MaritalStatusValues.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.maritalStatusValues != null) {
      data['value'] = this.maritalStatusValues!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MaritalStatusValues {
  int? id;
  String? description;

  MaritalStatusValues({this.id, this.description});

  MaritalStatusValues.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    return data;
  }
}
