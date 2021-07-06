class OrderHistoryModel {
  String status;
  List<OrderDetails> details;
  String result;

  OrderHistoryModel({this.status, this.details, this.result});

  OrderHistoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['details'] != null) {
      details = new List<OrderDetails>();
      json['details'].forEach((v) {
        details.add(new OrderDetails.fromJson(v));
      });
    }
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.details != null) {
      data['details'] = this.details.map((v) => v.toJson()).toList();
    }
    data['result'] = this.result;
    return data;
  }
}

class OrderDetails {
  String orderId;
  String totalAmt;
  String discountAmt;
  String amtAfterDiscount;
  String addedon;
  List<CartItems> cartItems;

  OrderDetails(
      {this.orderId,
        this.totalAmt,
        this.discountAmt,
        this.amtAfterDiscount,
        this.addedon,
        this.cartItems});

  OrderDetails.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    totalAmt = json['total_amt'];
    discountAmt = json['discount_amt'];
    amtAfterDiscount = json['amt_after_discount'];
    addedon = json['addedon'];
    if (json['cart_items'] != null) {
      cartItems = new List<CartItems>();
      json['cart_items'].forEach((v) {
        cartItems.add(new CartItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['total_amt'] = this.totalAmt;
    data['discount_amt'] = this.discountAmt;
    data['amt_after_discount'] = this.amtAfterDiscount;
    data['addedon'] = this.addedon;
    if (this.cartItems != null) {
      data['cart_items'] = this.cartItems.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CartItems {
  String odId;
  String itemId;
  String itemType;
  String itemQuantity;
  String itemPrice;
  String itemDiscount;
  String discountAmount;
  String totalPrice;
  String imageFile;
  String itemName;

  CartItems(
      {this.odId,
        this.itemId,
        this.itemType,
        this.itemQuantity,
        this.itemPrice,
        this.itemDiscount,
        this.discountAmount,
        this.totalPrice,
        this.imageFile,
        this.itemName});

  CartItems.fromJson(Map<String, dynamic> json) {
    odId = json['od_id'];
    itemId = json['item_id'];
    itemType = json['item_type'];
    itemQuantity = json['item_quantity'];
    itemPrice = json['item_price'];
    itemDiscount = json['item_discount'];
    discountAmount = json['discount_amount'];
    totalPrice = json['total_price'];
    imageFile = json['image_file'];
    itemName = json['item_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['od_id'] = this.odId;
    data['item_id'] = this.itemId;
    data['item_type'] = this.itemType;
    data['item_quantity'] = this.itemQuantity;
    data['item_price'] = this.itemPrice;
    data['item_discount'] = this.itemDiscount;
    data['discount_amount'] = this.discountAmount;
    data['total_price'] = this.totalPrice;
    data['image_file'] = this.imageFile;
    data['item_name'] = this.itemName;
    return data;
  }
}
