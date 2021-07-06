class BrandModel {
  String status;
  List<BrandData> brandData;
  String result;

  BrandModel({this.status, this.brandData, this.result});

  BrandModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      brandData = new List<BrandData>();
      json['data'].forEach((v) {
        brandData.add(new BrandData.fromJson(v));
      });
    }
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.brandData != null) {
      data['data'] = this.brandData.map((v) => v.toJson()).toList();
    }
    data['result'] = this.result;
    return data;
  }
}

class BrandData {
  String id;
  String name;
  String status;

  BrandData({this.id, this.name, this.status});

  BrandData.fromJson(Map<String, dynamic> json) {
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