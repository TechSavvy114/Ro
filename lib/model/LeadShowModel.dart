class LeadShowModel {
  String status;
  List<LeadShowData> leadShowData;
  String result;

  LeadShowModel({this.status, this.leadShowData, this.result});

  LeadShowModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      leadShowData = new List<LeadShowData>();
      json['data'].forEach((v) {
        leadShowData.add(new LeadShowData.fromJson(v));
      });
    }
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.leadShowData != null) {
      data['data'] = this.leadShowData.map((v) => v.toJson()).toList();
    }
    data['result'] = this.result;
    return data;
  }
}

class LeadShowData {
  String id;
  String leadId;
  String username;
  String useremail;
  String usernumber;
  String useraddress;
  String city;
  String state;
  String userpincode;
  String brand;
  String issue;
  String service;
  String details;
  String leadCost;
  String addedon;
  String status;
  String address;

  LeadShowData(
      {this.id,
        this.leadId,
        this.username,
        this.useremail,
        this.usernumber,
        this.useraddress,
        this.city,
        this.state,
        this.userpincode,
        this.brand,
        this.issue,
        this.service,
        this.details,
        this.leadCost,
        this.addedon,
        this.status,
        this.address});

  LeadShowData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    leadId = json['lead_id'];
    username = json['username'];
    useremail = json['useremail'];
    usernumber = json['usernumber'];
    useraddress = json['useraddress'];
    city = json['city'];
    state = json['state'];
    userpincode = json['userpincode'];
    brand = json['brand'];
    issue = json['issue'];
    service = json['service'];
    details = json['details'];
    leadCost = json['lead_cost'];
    addedon = json['addedon'];
    status = json['status'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['lead_id'] = this.leadId;
    data['username'] = this.username;
    data['useremail'] = this.useremail;
    data['usernumber'] = this.usernumber;
    data['useraddress'] = this.useraddress;
    data['city'] = this.city;
    data['state'] = this.state;
    data['userpincode'] = this.userpincode;
    data['brand'] = this.brand;
    data['issue'] = this.issue;
    data['service'] = this.service;
    data['details'] = this.details;
    data['lead_cost'] = this.leadCost;
    data['addedon'] = this.addedon;
    data['status'] = this.status;
    data['address'] = this.address;
    return data;
  }
}