class myCart {
  String status;
  List<Details> details;
  String result;

  myCart({this.status, this.details, this.result});

  myCart.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['details'] != null) {
      details = new List<Details>();
      json['details'].forEach((v) {
        details.add(new Details.fromJson(v));
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

class Details {
  String cartId;
  String totalAmt;
  String discountAmt;
  String amtAfterDiscount;
  List<CartItems> cartItems;

  Details(
      {this.cartId,
        this.totalAmt,
        this.discountAmt,
        this.amtAfterDiscount,
        this.cartItems});

  Details.fromJson(Map<String, dynamic> json) {
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
  String imageFile;
  String itemName;

  CartItems(
      {this.cartDetailId,
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
    cartDetailId = json['cart_detail_id'];
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
    data['cart_detail_id'] = this.cartDetailId;
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