import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_ro_test/User/AddToCart.dart';
import 'package:flutter_ro_test/vendor/RechargeScreen.dart';
import 'package:flutter_ro_test/web_services/SignUpService.dart';
import 'package:shared_preferences/shared_preferences.dart';



class ProductDetails extends StatefulWidget {
  String _productImage;
  String _productDetails;
  String _productName;
  String _productPrice;
  String _productDiscount;
  String userType;
  String vid,sessionID;
  String item_id;
  String discountAmount,totalAmount;
  int productQuantity=1;

  ProductDetails(this._productImage, this._productDetails, this._productName,
      this._productPrice, this._productDiscount, this.item_id,String productQuantity){
    this.productQuantity=int.parse(productQuantity);
  }

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(microseconds: 1000), () => getData());
  }

  @override
  Widget build(BuildContext context) {
    //int quantity=int.parse(widget.productQuantity);
    double productPrice=double.parse(widget._productPrice);
    double discount=double.parse(widget._productDiscount);
    widget.discountAmount=((productPrice*discount/100)*widget.productQuantity).toString();
    widget.totalAmount=((productPrice-productPrice*discount/100)*widget.productQuantity).toString();

    return WillPopScope(
      // ignore: missing_return
      onWillPop: () async {
        Navigator.of(context).pop(true);
      },
      child: new Scaffold(
        appBar: AppBar(leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(icon: Icon(Icons.add_shopping_cart,), onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AddToCart(widget.sessionID,widget.vid)));
              },),
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                height: 220,
                child: Stack(
                  children: <Widget>[
                    Image.network(widget._productImage),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: IconButton(icon: Icon(Icons.favorite), onPressed: () {  },),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8,),
              Text('Product Name: '+widget._productName,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              Text('Price: Rs'+widget._productPrice,style: TextStyle(fontSize: 18,color: Colors.black)),
              Text('Discount: '+widget._productDiscount+'%',style: TextStyle(fontSize: 14,color: Colors.red)),
              SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(icon: Icon(Icons.remove,size: 26,color: Colors.red,), onPressed: (){
                    if(widget.productQuantity>1){
                      setState(() {
                        widget.productQuantity--;
                      });
                      print(widget.productQuantity.toString());
                      //widget.productQuantity=quantity.toString();
                    }else{

                    }
                  }, ),
                  GestureDetector(
                    onTap: (){
                      print(widget.productQuantity);
                      addtoCart(widget.vid, widget.sessionID,
                          widget.item_id, 'product', widget.productQuantity.toString(), widget._productPrice,
                          widget._productDiscount,widget.discountAmount, widget.totalAmount);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.red
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(28,12,28,12),
                          child: Text("Add to Cart",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),)
                      ),
                    ),
                  ),
                  IconButton(icon: Icon(Icons.add ,size: 26,color: Colors.red,), onPressed: (){
                    setState(() {
                      widget.productQuantity++;
                    });
                    print(widget.productQuantity.toString());
                    //widget.productQuantity=quantity.toString();
                  }, ),
                ],
              ),
              SizedBox(height: 18,),
              Expanded(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Product Description :  '+widget._productDetails,style: TextStyle(fontSize: 20),),
              )),
              MaterialButton(
                minWidth: double.maxFinite, // set minWidth to maxFinite
                height: 40,
                color: Colors.blue,
                onPressed: () async {
               // await SignUpService().getCartResponse(user_id, session_id, item_id, item_type, item_quality, item_price, item_discount, discount_amount, total_price)
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>RechargeScreen.buynow(widget.sessionID,0,widget.vid,checkOutPrice: double.parse(widget.totalAmount))));
                  addtoCart(widget.vid, widget.sessionID,
                      widget.item_id, 'product', widget.productQuantity.toString(), widget._productPrice,
                      widget._productDiscount,widget.discountAmount, widget.totalAmount);
                },
                child: Text("Buy Now",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
              ),
              SizedBox(height: 8,),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String uid1 = sharedPreferences.getString('userType');
    String vid1 = sharedPreferences.getString('vid');
    String sessionID1 = sharedPreferences.getString('venid');
    setState(() {
      widget.userType=uid1;
      widget.vid=vid1;
      widget.sessionID=sessionID1;
    });
  }

  Future<void> addtoCart(String vid, String sessionID, String item_id, String s, String productQuantity, String productPrice,
      String productDiscount, String discountAmount, String totalAmount) async{
    SignUpService().getCartResponse(vid, sessionID,
        item_id, 'product', productQuantity,productPrice,
        productDiscount,discountAmount, totalAmount).then((value) {
      print(value.status);
      setState(() {
        widget.productQuantity=1;
      });
      Fluttertoast.showToast(msg: "Product is added");

     /* Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                AddToCart(widget.sessionID,widget.vid),)
      );*/
      print(value.cartdata.elementAt(0).cartId);
    });
  }
}
