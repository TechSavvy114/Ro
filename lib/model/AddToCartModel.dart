class AddToCartModel {
  String status;
  List<CartData> cartdata;
  String result;

  AddToCartModel({this.status, this.cartdata, this.result});

  AddToCartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['details'] != null) {
      cartdata = new List<CartData>();
      json['details'].forEach((v) {
        cartdata.add(new CartData.fromJson(v));
      });
    }
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.cartdata != null) {
      data['details'] = this.cartdata.map((v) => v.toJson()).toList();
    }
    data['result'] = this.result;
    return data;
  }
}

class CartData {
  String cartId;
  String totalAmt;
  String discountAmt;
  String amtAfterDiscount;
  List<CartItems> cartItems;

  CartData(
      {this.cartId,
        this.totalAmt,
        this.discountAmt,
        this.amtAfterDiscount,
        this.cartItems});

  CartData.fromJson(Map<String, dynamic> json) {
    cartId = json['cart_id'];
    totalAmt = json['total_amt'];
    discountAmt = json['discount_amt'];
    amtAfterDiscount = json['amt_after_discount'];
    if (json['cart_items'] != null) {
      cartItems = new List<CartItems>();
      json['cart_items'].forEach((v) {
        cartItems.add(new CartItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cart_id'] = this.cartId;
    data['total_amt'] = this.totalAmt;
    data['discount_amt'] = this.discountAmt;
    data['amt_after_discount'] = this.amtAfterDiscount;
    if (this.cartItems != null) {
      data['cart_items'] = this.cartItems.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CartItems {
  String cartDetailId;
  String itemId;
  String itemType;
  String itemQuantity;
  String itemPrice;
  String itemDiscount;
  String discountAmount;
  String totalPrice;
  String image_file;
  String name;

  CartItems(
      {this.cartDetailId,
        this.itemId,
        this.itemType,
        this.itemQuantity,
        this.itemPrice,
        this.itemDiscount,
        this.discountAmount,
        this.totalPrice,
      this.image_file,
      this.name});

  CartItems.fromJson(Map<String, dynamic> json) {
    cartDetailId = json['cart_detail_id'];
    itemId = json['item_id'];
    itemType = json['item_type'];
    itemQuantity = json['item_quantity'];
    itemPrice = json['item_price'];
    itemDiscount = json['item_discount'];
    discountAmount = json['discount_amount'];
    totalPrice = json['total_price'];
    image_file = json['image_file'];
    name = json['item_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cart_detail_id'] = this.cartDetailId;
    data['item_id'] = this.itemId;
    data['item_type'] = this.itemType;
    data['item_quantity'] = this.itemQuantity;
    data['item_price'] = this.itemPrice;
    data['item_discount'] = this.itemDiscount;
    data['discount_amount'] = this.discountAmount;
    data['total_price'] = this.totalPrice;
    data['image_file'] = this.image_file;
    data['item_name'] = this.name;
    return data;
  }
}