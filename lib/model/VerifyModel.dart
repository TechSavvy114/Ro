class VerifyModel {
  String status;
  String verifyData;
  String result;

  VerifyModel({this.status, this.verifyData, this.result});

  VerifyModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    verifyData = json['data'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['data'] = this.verifyData;
    data['result'] = this.result;
    return data;
  }
}