class NotificationModel {
  String status;
  List<NotificationData> notificationdata;
  String result;

  NotificationModel({this.status, this.notificationdata, this.result});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      notificationdata = new List<NotificationData>();
      json['data'].forEach((v) {
        notificationdata.add(new NotificationData.fromJson(v));
      });
    }
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.notificationdata != null) {
      data['data'] = this.notificationdata.map((v) => v.toJson()).toList();
    }
    data['result'] = this.result;
    return data;
  }
}

class NotificationData {
  String id;
  String title;
  String message;
  String time;

  NotificationData({this.id, this.title, this.message, this.time});

  NotificationData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    message = json['message'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['message'] = this.message;
    data['time'] = this.time;
    return data;
  }
}
