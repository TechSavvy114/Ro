class ClearAllModel {
  String status;
  String clearalldata;
  String result;

  ClearAllModel({this.status, this.clearalldata, this.result});

  ClearAllModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    clearalldata = json['data'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['data'] = this.clearalldata;
    data['result'] = this.result;
    return data;
  }
}