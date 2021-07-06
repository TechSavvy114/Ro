class IssueModel {
  String status;
  List<IssueData> issueDAta;
  String result;

  IssueModel({this.status, this.issueDAta, this.result});

  IssueModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      issueDAta = new List<IssueData>();
      json['data'].forEach((v) {
        issueDAta.add(new IssueData.fromJson(v));
      });
    }
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.issueDAta != null) {
      data['data'] = this.issueDAta.map((v) => v.toJson()).toList();
    }
    data['result'] = this.result;
    return data;
  }
}

class IssueData {
  String id;
  String name;
  String status;

  IssueData({this.id, this.name, this.status});

  IssueData.fromJson(Map<String, dynamic> json) {
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
