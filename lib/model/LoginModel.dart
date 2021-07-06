  class LoginModel {
    String status;
    List<LoginData> loginData;
    String result;

    LoginModel({this.status, this.loginData, this.result});

    LoginModel.fromJson(Map<String, dynamic> json) {
      status = json['status'];
      if (json['data'] != null) {
        loginData = new List<LoginData>();
        json['data'].forEach((v) {
          loginData.add(new LoginData.fromJson(v));
        });
      }
      result = json['result'];
    }

    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['status'] = this.status;
      if (this.loginData != null) {
        data['data'] = this.loginData.map((v) => v.toJson()).toList();
      }
      data['result'] = this.result;
      return data;
    }
  }

  class LoginData {
    String id;
    String uid;
    String username;
    String useremail;
    String usernumber;
    String useraddress;
    String cid;
    String sid;
    String pincode;
    String password;
    String addedon;
    String status;

    LoginData(
        {this.id,
          this.uid,
          this.username,
          this.useremail,
          this.usernumber,
          this.useraddress,
          this.cid,
          this.sid,
          this.pincode,
          this.password,
          this.addedon,
          this.status});

    LoginData.fromJson(Map<String, dynamic> json) {
      id = json['id'];
      uid = json['uid'];
      username = json['username'];
      useremail = json['useremail'];
      usernumber = json['usernumber'];
      useraddress = json['useraddress'];
      cid = json['cid'];
      sid = json['sid'];
      pincode = json['pincode'];
      password = json['password'];
      addedon = json['addedon'];
      status = json['status'];
    }

    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['id'] = this.id;
      data['uid'] = this.uid;
      data['username'] = this.username;
      data['useremail'] = this.useremail;
      data['usernumber'] = this.usernumber;
      data['useraddress'] = this.useraddress;
      data['cid'] = this.cid;
      data['sid'] = this.sid;
      data['pincode'] = this.pincode;
      data['password'] = this.password;
      data['addedon'] = this.addedon;
      data['status'] = this.status;
      return data;
    }
  }