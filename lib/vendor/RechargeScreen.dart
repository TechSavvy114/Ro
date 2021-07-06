import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ro_test/web_services/SignUpService.dart';


class RechargeScreen extends StatelessWidget {

  double checkOutPrice;
  String sessionID,vid;
  int index;


  RechargeScreen();

  RechargeScreen.buynow(this.sessionID,this.index,this.vid,{this.checkOutPrice});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "RazorPay Gateway",
      home: MyHomePage(checkOutPrice,sessionID,index,vid),
    );
  }
}

class MyHomePage extends StatefulWidget {
  double checkoutPrice;
  String sessionID;
  int index;

  String vid;
  MyHomePage(this.checkoutPrice,this.sessionID, this. index, this.vid);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int totalAmount = 0;
  Razorpay _razorpay;
  TextEditingController textEditingController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  Future<void> _handlePaymentSuccess(PaymentSuccessResponse response) async {
    //print('Payment Success');
    if(widget.index==0) {
      await SignUpService()
          .getOrder(
          widget.sessionID,widget.checkoutPrice.toString() , response.paymentId,widget.vid)
          .then((value) {
            //print(value.cartdata.elementAt(0).cartItems.elementAt(0).totalPrice);
        Fluttertoast.showToast(msg: "Success: " + response.paymentId);
      });
    }
    else if(widget.index==1){
      await SignUpService().getRechargeStatus(widget.vid,widget.sessionID, textEditingController.text.toString(),response.paymentId).then((value) {
        Fluttertoast.showToast(msg: "Success: " + response.paymentId);
      });
    }
   /// confirmOrder(sessionId,'vendor',response.paymentId,'success',response.);
  }

  void _handlePaymentError(PaymentFailureResponse response){
    Fluttertoast.showToast(msg: "Error:"+ response.code.toString() + "-" + response.message);

  }

  void _handleExternalWallet(ExternalWalletResponse response){
    Fluttertoast.showToast(msg: "External Wallet"+ response.walletName);
  }

  void dispose(){
    super.dispose();
    _razorpay.clear();
  }

  void openCheckOut() async{
    var options = {
      "key" : "rzp_live_UzFzFUBuGhvNIQ",
      "amount" : widget.checkoutPrice!=null ? totalAmount=widget.checkoutPrice.toInt()*100 : totalAmount*100,
      "name" : 'Just24You',
      "description" : 'Online payment',
      "prefill" : {'contact' : '', 'email' : ''},
      "external" :{
        "wallets" : ['paytm']
      }
    };
    try{
      _razorpay.open(options);

    }
    catch(e){
      debugPrint(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Online Payment'),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: textEditingController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: widget.checkoutPrice!=null ? widget.checkoutPrice.toString() : 'Please enter amount',hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                      labelText: 'Amount',labelStyle: TextStyle(color: Colors.white)),
                    onChanged: (value) {
                      //widget.checkoutPrice!=null ? totalAmount=widget.checkoutPrice.toInt() :
                      setState(() {
                        totalAmount = num.parse(value);
                      });
                    },style: TextStyle(color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    border: Border.all(width: 1.0, color: Colors.blue)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              color: Colors.blue,
                child: Text(
                  'Make Payment',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold),
                ),onPressed: (){
              openCheckOut();
            }
            ),
          ],
        ),
      ),
    );
  }

  void confirmOrder() {

  }
}
