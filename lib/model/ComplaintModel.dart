class GetComplaintModel {
  String status;
  List<ComplaintData> complaintdata;
  String result;

  GetComplaintModel({this.status, this.complaintdata, this.result});

  GetComplaintModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      complaintdata = new List<ComplaintData>();
      json['data'].forEach((v) {
        complaintdata.add(new ComplaintData.fromJson(v));
      });
    }
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.complaintdata != null) {
      data['data'] = this.complaintdata.map((v) => v.toJson()).toList();
    }
    data['result'] = this.result;
    return data;
  }
}

class ComplaintData {
  String id;
  String compId;
  String username;
  String useremail;
  String usernumber;
  String address;
  String issue;
  String service;
  String complaintDetails;
  String reason;
  String addedon;
  String status;

  ComplaintData(
      {this.id,
        this.compId,
        this.username,
        this.useremail,
        this.usernumber,
        this.address,
        this.issue,
        this.service,
        this.complaintDetails,
        this.reason,
        this.addedon,
        this.status});

  ComplaintData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    compId = json['comp_id'];
    username = json['username'];
    useremail = json['useremail'];
    usernumber = json['usernumber'];
    address = json['address'];
    issue = json['issue'];
    service = json['service'];
    complaintDetails = json['complaint_details'];
    reason = json['reason'];
    addedon = json['addedon'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['comp_id'] = this.compId;
    data['username'] = this.username;
    data['useremail'] = this.useremail;
    data['usernumber'] = this.usernumber;
    data['address'] = this.address;
    data['issue'] = this.issue;
    data['service'] = this.service;
    data['complaint_details'] = this.complaintDetails;
    data['reason'] = this.reason;
    data['addedon'] = this.addedon;
    data['status'] = this.status;
    return data;
  }
}
