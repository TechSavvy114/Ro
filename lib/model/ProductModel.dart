class ProductModel {
  String status;
  List<ProductData> productData;
  String result;

  ProductModel({this.status, this.productData, this.result});

  ProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      productData = new List<ProductData>();
      json['data'].forEach((v) {
        productData.add(new ProductData.fromJson(v));
      });
    }
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.productData != null) {
      data['data'] = this.productData.map((v) => v.toJson()).toList();
    }
    data['result'] = this.result;
    return data;
  }
}

class ProductData {
  String id;
  String type;
  String proName;
  String proPrice;
  String proDetail;
  String proImageFile;
  String proQuantity;
  String proMinPurchase;
  String brandName;
  String categoryName;
  String subcategoryName;
  String proDiscount;
  //tipleImages> pro_images;

  ProductData(
      {this.id,
        this.type,
        this.proName,
        this.proPrice,
        this.proDetail,
        this.proImageFile,
        this.proQuantity,
        this.proMinPurchase,
        this.brandName,
        this.categoryName,
        this.subcategoryName,
        this.proDiscount,
        //this.pro_images
  });

  ProductData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['item_type'];
    proName = json['pro_name'];
    proPrice = json['pro_price'];
    proDetail = json['pro_detail'];
    proImageFile = json['pro_image_file'];
    proQuantity = json['pro_quantity'];
    proMinPurchase = json['pro_min_purchase'];
    brandName = json['brand_name'];
    categoryName = json['category_name'];
    subcategoryName = json['subcategory_name'];
    proDiscount = json['pro_discount'];
    //pro_images=json['pro_images'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['item_type'] = this.type;
    data['pro_name'] = this.proName;
    data['pro_price'] = this.proPrice;
    data['pro_detail'] = this.proDetail;
    data['pro_image_file'] = this.proImageFile;
    data['pro_quantity'] = this.proQuantity;
    data['pro_min_purchase'] = this.proMinPurchase;
    data['brand_name'] = this.brandName;
    data['category_name'] = this.categoryName;
    data['subcategory_name'] = this.subcategoryName;
    data['pro_discount'] = this.proDiscount;
   //data['pro_images']=this.pro_images;
    return data;
  }
}

/*
class MultipleImages {
  String imageName;

  MultipleImages({this.imageName});

  MultipleImages.fromJson(Map<String, dynamic> json) {

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.imageName;
    return data;
  }

}*/
