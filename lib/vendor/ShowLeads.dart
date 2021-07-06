import 'package:flutter/material.dart';
import 'package:flutter_ro_test/model/BrandModel.dart';
import 'package:flutter_ro_test/model/LeadShowModel.dart';
import 'package:flutter_ro_test/web_services/SignUpService.dart';
import 'LeadDetails.dart';

class ShowLeads extends StatefulWidget {
  int cid,sid;
  String vid;
  String walletBalance;


  ShowLeads(this.cid, this.sid, this.vid, this.walletBalance);

  @override
  _ShowLeadsState createState() => _ShowLeadsState();
}

class _ShowLeadsState extends State<ShowLeads> {
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
      appBar: AppBar(title: Text('New Leads')),
      body: FutureBuilder(
          future: getLeads(),
          builder: (context,snap){
            if(snap.hasData){
              if(snap.connectionState==ConnectionState.waiting){
                return Center(child: Text('No New Lead'));
              }
              return ListView.builder(
                  itemCount: leadData.length,
                  itemBuilder: (context,index){
                    return GestureDetector(
                      onTap: (){
                        debugPrint(widget.vid);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LeadDetails(widget.cid,widget.sid,index,widget.vid,widget.walletBalance)));
                      },
                      child: Container(
                        height: 100,
                        child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            shadowColor: Colors.blue[100],
                            elevation: 6,
                            color: Colors.blue[100],
                            child: Container(
                              height: 180,
                              decoration: BoxDecoration(
                                border: Border(
                                    left: BorderSide(color: Colors.red, width: 15)),
                                color: Colors.lightBlueAccent[100],
                              ),
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Customer Name: "+leadData.elementAt(index).username),
                                    Text("Issue: "+leadData.elementAt(index).issue),
                                    Text("Lead Cost: Rs "+leadData.elementAt(index).leadCost),
                                  ],
                                ),
                              ),
                            )
                        ),
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
    await SignUpService().getLeads(widget.cid.toString(), widget.sid.toString()).then((value) {
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

