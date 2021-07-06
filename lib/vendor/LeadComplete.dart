import 'package:flutter/material.dart';
import 'package:flutter_ro_test/web_services/SignUpService.dart';

import 'VendorHome.dart';


class LeadComplete extends StatefulWidget {
  String vid,leadID;

  LeadComplete(this.vid, this.leadID);

  @override
  _LeadCompleteState createState() => _LeadCompleteState();
}

class _LeadCompleteState extends State<LeadComplete> {
  TextEditingController remarkController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
          child: Column(
            children:<Widget> [
              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 70,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(hintText: 'Write remark here', border: InputBorder.none,hintStyle: TextStyle(color: Colors.white)),
                      controller: remarkController,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(width: 1.0, color: Colors.blue)),
                ),
              ),
              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: RaisedButton(
                        color: Colors.blue,
                        splashColor: Colors.green,
                        onPressed: () {
                  SignUpService().getLeadCompletedResponse(widget.leadID.toString(), widget.vid.toString(), 'completed', remarkController.text.toString());
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MainScreenVendor()));
                        },
                        child: Text('Completed',style: TextStyle(fontSize: 16,color: Colors.white),),
                      ),
                    ),
                    SizedBox(width: 5,),
                    Expanded(
                      flex: 1,
                      child: RaisedButton(
                        color: Colors.blue,
                        splashColor: Colors.red,
                        onPressed: ()  {
                          SignUpService().getLeadAcceptResponse(widget.leadID.toString(), widget.vid.toString(), 'denied', remarkController.text.toString());
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>MainScreenVendor()));
                        },
                        child: Text('Denial',style: TextStyle(fontSize: 16,color: Colors.white),),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
