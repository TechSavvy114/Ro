import 'package:flutter/material.dart';
import 'package:flutter_ro_test/model/BrandModel.dart';
import 'package:flutter_ro_test/model/LeadShowModel.dart';
import 'package:flutter_ro_test/web_services/SignUpService.dart';
import 'OTPScreen.dart';

class ShowAccpetedLeads extends StatefulWidget {
  int cid,sid;
  String vid;


  ShowAccpetedLeads(this.cid, this.sid, this.vid);

  @override
  _ShowAccpetedLeadsState createState() => _ShowAccpetedLeadsState();
}

class _ShowAccpetedLeadsState extends State<ShowAccpetedLeads> {
  List<LeadShowData>leadData;
  List<BrandData>list;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getCidSid();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('accepted Leads')),
      body: FutureBuilder(
          future: getLeads(),
          builder: (context,snap){
            if(snap.hasData){
              if(snap.connectionState==ConnectionState.waiting){
                return Center(child: Text('Loading....'));
              }
              return ListView.builder(
                  itemCount: leadData.length,
                  itemBuilder: (context,index){
                    return GestureDetector(
                      onTap: (){
                        debugPrint(widget.vid);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>OTPScreen(leadData.elementAt(index).id,widget.vid)));
                      },
                      child: Card(
                          elevation: 10.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            side: BorderSide(
                              color: Colors.black,
                              width: 1.0,
                            )
                          ),
                          color: Colors.green[300],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Customer Name: "+leadData.elementAt(index).username),
                                Text("ISSUE:"+leadData.elementAt(index).issue),
                                Text("Lead Cost: Rs "+leadData.elementAt(index).leadCost),
                                Text("Customer No: "+leadData.elementAt(index).usernumber),
                                Text("Address: "+leadData.elementAt(index).address),
                                Text("Email: "+leadData.elementAt(index).useremail),
                                Text("Pincode: "+leadData.elementAt(index).userpincode),
                                Text("Lead Id: "+leadData.elementAt(index).leadId),
                              ],
                            ),
                          )
                      ),
                    );
                  });
            }else{
              return Center(child: Text('No New Lead'),);
            }
          }),
    );
  }

  Future<List<LeadShowData>>getLeads() async{
    await SignUpService().getAcceptedLeads(widget.vid).then((value) {
      print(value.leadShowData);
      leadData=value.leadShowData;
    });
    return leadData;
  }
}