/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ro_latest7/model/AddToCartModel.dart';
import 'package:ro_latest7/web_services/SignUpService.dart';

class AddToCart extends StatefulWidget {

  String _productImage;
  String _productDetails;
  String _productName;
  String _productPrice;
  String _productDiscount;
  String item_id,productQuantity;
  String discountAmount,totalAmount;
  String session_id;


  AddToCart(this._productImage,this._productDetails,this.totalAmount,this._productPrice,
      this.discountAmount,this._productDiscount,this.item_id,this._productName,this.session_id);


  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  List<CartData>cartData;
  List<CartItems>cartItems=[];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add To Cart'),
      ),
      body:
      FutureBuilder(
        future: getCart(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return */
/*Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Colors.blueAccent),
            child: Text('Cart',style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)
            ),
            color: Colors.grey,
            child: Row(
              children: [
                Image.network(widget._productImage),
                Column(
                  children: [
                    Text(widget._productName),
                    Text(widget.totalAmount),
                    Row(
                      children: [
                        IconButton(icon: Icon(Icons.remove,size: 26,color: Colors.red,), onPressed: (){}, ),
                       // EditableText(),
                        IconButton(icon: Icon(Icons.add,size: 26,color: Colors.red,), onPressed: (){}, ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)
              ),
              color: Colors.grey,
              child: Text('Total: Rs 500')
          ),
          SizedBox(height: 10,),
          Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)
            ),
            color: Colors.green,
            child: Text('Checkout'),
          )

        ],
      );*//*

          ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context,index){
            return Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Colors.blueAccent),
            child: Text('Cart',style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)
            ),
            color: Colors.grey,
            child: Row(
              children: [
                Image.network("https://api.sallybase.com/ro/uploads/products/"+cartItems.elementAt(index).image_file),
                Column(
                  children: [
                    Text(cartItems.elementAt(index).name),
                    Text(cartItems.elementAt(index).discountAmount),
                    Row(
                      children: [
                        IconButton(icon: Icon(Icons.remove,size: 26,color: Colors.red,), onPressed: (){}, ),
                       // EditableText(),
                        IconButton(icon: Icon(Icons.add,size: 26,color: Colors.red,), onPressed: (){}, ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)
              ),
              color: Colors.grey,
              child: Text('Total: Rs 500')
          ),
          SizedBox(height: 10,),
          Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)
            ),
            color: Colors.green,
            child: Text('Checkout'),
          )

        ],
      );
          });
      },)
    );
  }

  getCart() {
    SignUpService().getCart(widget.session_id).then((value){
      cartData=value.cartdata;
      print(cartData.elementAt(0).totalAmt);
    });
    for(int i=0;i<cartData.length;i++){
      print(i.toString());
      for(int k=0;k<i;k++){
        cartItems.add(cartData.elementAt(i).cartItems.elementAt(k));
        print(cartItems.elementAt(k).discountAmount);
      }
    }
  }

}

*/

import 'package:flutter/material.dart';
import 'package:flutter_ro_test/model/AddToCartModel.dart';
import 'package:flutter_ro_test/vendor/RechargeScreen.dart';
import 'package:flutter_ro_test/web_services/SignUpService.dart';

class
AddToCart extends StatefulWidget {
  final String sessionId,vid;
  AddToCart(this.sessionId,this.vid);

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  List<CartData>cartList;
  List<CartItems>itemList;
  double totalPriceafterdiscount;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Screen'),
        elevation: 0.0,
      ),
      body:FutureBuilder(
          future: getData(),
          builder: (context,snapshot){
            //itemList=snapshot.data;
            //print(snapshot.data.toString());
          return Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)),
                    color: Colors.blue),
                child: Center(child: Text('Cart Details',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: itemList!=null ? itemList.length : 0,
                    itemBuilder: (context,index){
                      print('https://just24you.com/admin/uploads/products/${itemList.elementAt(index).image_file}==================================================${itemList.elementAt(index).name }');
                      /*setState(() {
                        totalPriceafterdiscount=totalPriceafterdiscount+int.parse(itemList.elementAt(index).totalPrice);
                      });*/
                  return Card(
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      color: Colors.blue[100],
                      child: Row(
                        children: [
                          Expanded(
                              flex:1,
                              child: itemList.elementAt(index).image_file!=null ? Image.network("https://just24you.com/admin/uploads/products/"+itemList.elementAt(index).image_file,) :
                              Image.asset('assets/ro.jpg')),
                          Expanded(
                            flex:2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Product: '+itemList.elementAt(index).name ?? 'name',style: TextStyle(fontSize: 18),),
                                Text('Quantity: '+itemList.elementAt(index).itemQuantity,style: TextStyle(fontSize: 16),),
                                Text('Discounted: '+itemList.elementAt(index).discountAmount,style: TextStyle(fontSize: 16),),
                                Text('Price: Rs '+itemList.elementAt(index).totalPrice,style: TextStyle(fontSize: 16,color: Colors.red)),
                                Positioned(
                                  left: 1,
                                  right: 150,
                                  bottom: 2,
                                  child: IconButton(icon: Icon(Icons.delete), onPressed: (){
                                    deleteItem(itemList.elementAt(index).cartDetailId);
                                  }),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                }),
              ),
              SizedBox(
                height: 40,
                child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)
                    ),
                    color: Colors.grey[300],
                    child: totalPriceafterdiscount!=null ? Center(child: Text('Total Price : Rs '+totalPriceafterdiscount.toString(),style: TextStyle(fontSize: 16,color: Colors.red,fontWeight: FontWeight.bold),)) : Text('Total Price')
                ),
              ),
              SizedBox(height: 10,),
              InkWell(
                onTap: (){
                  // payment gateway
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Colors.green),
                  child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>RechargeScreen.buynow(widget.sessionId, 0, widget.vid,checkOutPrice: totalPriceafterdiscount,)));
                      },
                      child: Center(child: Text('Checkout',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),))),
                ),
              ),
            ],
          );
      }),
    );
  }

  Future<List<CartItems>>getData()async {
    await SignUpService().getCart(widget.sessionId).then((value) {
     cartList=value.cartdata;
      itemList=value.cartdata.elementAt(0).cartItems;
      //print('Hello length of itemList is '+itemList.length.toString());
    });
    double totalsum=0;
    for(int i=0;i<itemList.length;i++){
      totalsum=totalsum+double.parse(itemList.elementAt(i).totalPrice);
    }

    setState(() {
      totalPriceafterdiscount=totalsum;
    });
    return itemList;
  }
   deleteItem(String itemId) {
    SignUpService().deleteItem(widget.sessionId,itemId );
   }
}





