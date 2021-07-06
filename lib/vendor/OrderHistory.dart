import 'package:flutter/material.dart';
import 'package:flutter_ro_test/model/OrderHistoryModel.dart';
import 'package:flutter_ro_test/web_services/SignUpService.dart';

class showorderHistory extends StatefulWidget {
  String sessionID;

  showorderHistory(this.sessionID);

  @override
  _ShowCompletedLeadsState createState() => _ShowCompletedLeadsState();
}

class _ShowCompletedLeadsState extends State<showorderHistory> {
  List<OrderDetails>orderDetails;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Order History')),
      body: FutureBuilder(
          future: getOrder(),
          builder: (context,snap){
            if(snap.hasData){
              if(snap.connectionState==ConnectionState.waiting){
                return Center(child: Text('Loading....'));
              }
              return ListView.builder(
                  itemCount: orderDetails.length,
                  itemBuilder: (context,index){
                    return Card(
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            side: BorderSide(
                              color: Colors.black,
                              width: 1.0,
                            )
                        ),
                        color: Colors.blue[300],
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Order Id: "+orderDetails.elementAt(index).orderId),
                              Text("Total Amount: Rs "+orderDetails.elementAt(index).totalAmt),
                              Text("Discount Amount: Rs "+orderDetails.elementAt(index).discountAmt),
                              Text("Paid Amount: Rs "+orderDetails.elementAt(index).amtAfterDiscount),
                            ],
                          ),
                        )
                    );
                  });
            }else{
              return Center(child: Text('No orders'),);
            }
          }),
    );
  }

  Future<List<OrderDetails>>getOrder() async{
    await SignUpService().getOrderHistory(widget.sessionID).then((value) {
      orderDetails=value.details;
    });
    return orderDetails;
  }
}