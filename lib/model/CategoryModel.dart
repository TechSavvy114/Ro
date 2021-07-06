class CategoryModel {
  String status;
  List<CategoryData> categorydata;
  String result;

  CategoryModel({this.status, this.categorydata, this.result});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      categorydata = new List<CategoryData>();
      json['data'].forEach((v) {
        categorydata.add(new CategoryData.fromJson(v));
      });
    }
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.categorydata != null) {
      data['data'] = this.categorydata.map((v) => v.toJson()).toList();
    }
    data['result'] = this.result;
    return data;
  }
}

class CategoryData {
  String id;
  String name;
  String status;

  CategoryData({this.id, this.name, this.status});

  CategoryData.fromJson(Map<String, dynamic> json) {
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