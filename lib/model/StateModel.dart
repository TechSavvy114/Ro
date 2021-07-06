class StateDataModel {
  String status;
  List<StateData> data;
  String result;

  StateDataModel({this.status, this.data, this.result});

  StateDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = new List<StateData>();
      json['data'].forEach((v) {
        data.add(new StateData.fromJson(v));
      });
    }
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['result'] = this.result;
    return data;
  }
}

class StateData {
  String id;
  String name;
  String status;

  StateData({this.id, this.name, this.status});

  StateData.fromJson(Map<String, dynamic> json) {
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