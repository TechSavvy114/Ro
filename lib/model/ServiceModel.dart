class ServiceModel {
  String status;
  List<ServiceData> serviceData;
  String result;

  ServiceModel({this.status, this.serviceData, this.result});

  ServiceModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      serviceData = new List<ServiceData>();
      json['data'].forEach((v) {
        serviceData.add(new ServiceData.fromJson(v));
      });
    }
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.serviceData != null) {
      data['data'] = this.serviceData.map((v) => v.toJson()).toList();
    }
    data['result'] = this.result;
    return data;
  }
}

class ServiceData {
  String id;
  String name;
  String status;

  ServiceData({this.id, this.name, this.status});

  ServiceData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    return data;
  }
}