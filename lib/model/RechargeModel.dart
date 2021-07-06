class RechargeModel {
  String status;
  int wallet;
  String result;

  RechargeModel({this.status, this.wallet, this.result});

  RechargeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    wallet = json['wallet'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['wallet'] = this.wallet;
    data['result'] = this.result;
    return data;
  }
}