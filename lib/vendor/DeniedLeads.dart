import 'package:flutter/material.dart';
import 'package:flutter_ro_test/model/BrandModel.dart';
import 'package:flutter_ro_test/model/LeadShowModel.dart';
import 'package:flutter_ro_test/web_services/SignUpService.dart';


class ShowDeniedLeads extends StatefulWidget {
  String vid;
  ShowDeniedLeads(this.vid);
  @override
  _ShowDeniedLeadsState createState() => _ShowDeniedLeadsState();
}

class _ShowDeniedLeadsState extends State<ShowDeniedLeads> {
  List<LeadShowData>deniedData;
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
      appBar: AppBar(title: Text('Denied Leads')),
      body: FutureBuilder(
          future: getLeads(),
          builder: (context,snap){
            if(snap.hasData){
              if(snap.connectionState==ConnectionState.waiting){
                return Center(child: Text('Loading....'));
              }
              return ListView.builder(
                  itemCount: deniedData.length,
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
                        color: Colors.red[300],
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Customer Name: "+deniedData.elementAt(index).username),
                              Text("ISSUE:"+deniedData.elementAt(index).issue),
                              Text("Lead Cost: Rs "+deniedData.elementAt(index).leadCost),
                              Text("Customer No.: "+deniedData.elementAt(index).usernumber),
                              Text("Address: "+deniedData.elementAt(index).address),
                              Text("Email: "+deniedData.elementAt(index).useremail),
                              Text("Pincode: "+deniedData.elementAt(index).userpincode),
                              Text("Lead Id: "+deniedData.elementAt(index).id),
                            ],
                          ),
                        )
                    );
                  });
            }else{
              return Center(child: Text('No Denied Lead'),);
            }
          }),
    );
  }

  Future <List<LeadShowData>>getLeads()async {
    await SignUpService().getDeniedLeads(widget.vid).then((value) {
      deniedData=value.leadShowData;
    });
    return deniedData;
  }


}