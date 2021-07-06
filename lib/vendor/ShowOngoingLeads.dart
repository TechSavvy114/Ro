import 'package:flutter/material.dart';
import 'package:flutter_ro_test/model/BrandModel.dart';
import 'package:flutter_ro_test/model/LeadShowModel.dart';
import 'package:flutter_ro_test/web_services/SignUpService.dart';
import 'LeadComplete.dart';
import 'LeadDetails.dart';

class ShowOngoingLeads extends StatefulWidget {
  int cid,sid;
  String vid;


  ShowOngoingLeads(this.cid, this.sid, this.vid);

  @override
  _ShowOngoingLeadsState createState() => _ShowOngoingLeadsState();
}

class _ShowOngoingLeadsState extends State<ShowOngoingLeads> {
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
      appBar: AppBar(title: Text('ongoing Leads')),
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LeadComplete(widget.vid,leadData.elementAt(index).id)));
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
                          color: Colors.red[300],
                          child: Column(
                            children: [
                              Text("Customer Name: "+leadData.elementAt(index).username),
                              Text("ISSUE:"+leadData.elementAt(index).issue),
                              Text("Lead Cost: Rs "+leadData.elementAt(index).leadCost),
                              Text("User Number: +91-"+leadData.elementAt(index).usernumber),
                              Text("Address: "+leadData.elementAt(index).address),
                              Text("Email:  "+leadData.elementAt(index).useremail),
                             // Text("Pincode "+leadData.elementAt(index).userpincode),
                              Text("Lead Id:  "+leadData.elementAt(index).id),
                            ],
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
    await SignUpService().getOngoingLeads(widget.vid).then((value) {
      print(value.leadShowData);
      leadData=value.leadShowData;
    });
    return leadData;
  }

/*Future<void> getCidSid() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int cid1 = sharedPreferences.getInt('venCid');
    int sid1 = sharedPreferences.getInt('venSid');
    //int vid1 = sharedPreferences.getInt('vid');
    print(cid1.toString());
    print(sid1.toString());
    setState(() {
      sid = sid1;
      cid = cid1;
      //vid=vid1;
    });
  }*/

}