class LeadAcceptModel {
  String status;
  List<LeadAcceptData> leadAcceptData;
  String result;

  LeadAcceptModel({this.status, this.leadAcceptData, this.result});

  LeadAcceptModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      leadAcceptData = new List<LeadAcceptData>();
      json['data'].forEach((v) {
        leadAcceptData.add(new LeadAcceptData.fromJson(v));
      });
    }
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.leadAcceptData != null) {
      data['data'] = this.leadAcceptData.map((v) => v.toJson()).toList();
    }
    data['result'] = this.result;
    return data;
  }
}

class LeadAcceptData {
  String vendorStatus;
  int wallet;

  LeadAcceptData({this.vendorStatus, this.wallet});

  LeadAcceptData.fromJson(Map<String, dynamic> json) {
    vendorStatus = json['vendor_status'];
    wallet = json['wallet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vendor_status'] = this.vendorStatus;
    data['wallet'] = this.wallet;
    return data;
  }
}