class CityModel {
  String status;
  List<CityData> citydata;
  String result;

  CityModel({this.status, this.citydata, this.result});

  CityModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      citydata = new List<CityData>();
      json['data'].forEach((v) {
        citydata.add(new CityData.fromJson(v));
      });
    }
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.citydata != null) {
      data['data'] = this.citydata.map((v) => v.toJson()).toList();
    }
    data['result'] = this.result;
    return data;
  }
}

class CityData {
  String id;
  String name;
  String sid;
  String status;

  CityData({this.id, this.name, this.sid, this.status});

  CityData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    sid = json['sid'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['sid'] = this.sid;
    data['status'] = this.status;
    return data;
  }
}