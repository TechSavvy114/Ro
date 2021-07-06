class PartsModel {
  String status;
  List<PartsData> partsData;
  String result;

  PartsModel({this.status, this.partsData, this.result});

  PartsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      partsData = new List<PartsData>();
      json['data'].forEach((v) {
        partsData.add(new PartsData.fromJson(v));
      });
    }
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.partsData != null) {
      data['data'] = this.partsData.map((v) => v.toJson()).toList();
    }
    data['result'] = this.result;
    return data;
  }
}

class PartsData {
  String id;
  String type;
  String partName;
  String partPrice;
  String partDetail;
  String partImageFile;
  String partQuantity;
  String partMinPurchase;
  String brandName;
  String categoryName;
  String subcategoryName;
  String partDiscount;
  //String part_images;

  PartsData(
      {this.id,
        this.type,
        this.partName,
        this.partPrice,
        this.partDetail,
        this.partImageFile,
        this.partQuantity,
        this.partMinPurchase,
        this.brandName,
        this.categoryName,
        this.subcategoryName,
        this.partDiscount,
      //this.part_images
      });

  PartsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['item_type'];
    partName = json['part_name'];
    partPrice = json['part_price'];
    partDetail = json['part_detail'];
    partImageFile = json['part_image_file'];
    partQuantity = json['part_quantity'];
    partMinPurchase = json['part_min_purchase'];
    brandName = json['brand_name'];
    categoryName = json['category_name'];
    subcategoryName = json['subcategory_name'];
    partDiscount = json['part_discount'];
    //part_images=json['part_images'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['item_type'] = this.type;
    data['part_name'] = this.partName;
    data['part_price'] = this.partPrice;
    data['part_detail'] = this.partDetail;
    data['part_image_file'] = this.partImageFile;
    data['part_quantity'] = this.partQuantity;
    data['part_min_purchase'] = this.partMinPurchase;
    data['brand_name'] = this.brandName;
    data['category_name'] = this.categoryName;
    data['subcategory_name'] = this.subcategoryName;
    data['part_discount'] = this.partDiscount;
    //data['part_images'] = this.part_images;
    return data;
  }
}