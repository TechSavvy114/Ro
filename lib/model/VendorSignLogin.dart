class VendorSignLogin {
  String status;
  List<VendorLoginData> vendorLoginData;
  String result;

  VendorSignLogin({this.status, this.vendorLoginData, this.result});

  VendorSignLogin.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      vendorLoginData = new List<VendorLoginData>();
      json['data'].forEach((v) {
        vendorLoginData.add(new VendorLoginData.fromJson(v));
      });
    }
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.vendorLoginData != null) {
      data['data'] = this.vendorLoginData.map((v) => v.toJson()).toList();
    }
    data['result'] = this.result;
    return data;
  }
}

class VendorLoginData {
  String id;
  String venId;
  String name;
  String email;
  String phone;
  String address;
  String cid;
  String sid;
  String pincode;
  String wallet;
  String password;
  String gstin;
  String idprooftype;
  String idproofno;
  String proofimage;
  String addedon;
  String status;

  VendorLoginData(
      {this.id,
        this.venId,
        this.name,
        this.email,
        this.phone,
        this.address,
        this.cid,
        this.sid,
        this.pincode,
        this.wallet,
        this.password,
        this.gstin,
        this.idprooftype,
        this.idproofno,
        this.proofimage,
        this.addedon,
        this.status});

  VendorLoginData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    venId = json['ven_id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    cid = json['cid'];
    sid = json['sid'];
    pincode = json['pincode'];
    wallet = json['wallet'];
    password = json['password'];
    gstin = json['gstin'];
    idprooftype = json['idprooftype'];
    idproofno = json['idproofno'];
    proofimage = json['proofimage'];
    addedon = json['addedon'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ven_id'] = this.venId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['cid'] = this.cid;
    data['sid'] = this.sid;
    data['pincode'] = this.pincode;
    data['wallet'] = this.wallet;
    data['password'] = this.password;
    data['gstin'] = this.gstin;
    data['idprooftype'] = this.idprooftype;
    data['idproofno'] = this.idproofno;
    data['proofimage'] = this.proofimage;
    data['addedon'] = this.addedon;
    data['status'] = this.status;
    return data;
  }
}