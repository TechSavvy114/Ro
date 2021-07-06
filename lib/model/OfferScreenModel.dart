class OfferScreenModel {
  String status;
  List<OfferData> offerData;
  String result;

  OfferScreenModel({this.status, this.offerData, this.result});

  OfferScreenModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      offerData = new List<OfferData>();
      json['data'].forEach((v) {
        offerData.add(new OfferData.fromJson(v));
      });
    }
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.offerData != null) {
      data['data'] = this.offerData.map((v) => v.toJson()).toList();
    }
    data['result'] = this.result;
    return data;
  }
}

class OfferData {
  String id;
  String title;
  String image;
  String details;

  OfferData({this.id, this.title, this.image, this.details});

  OfferData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    details = json['details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['details'] = this.details;
    return data;
  }
}