import 'package:flutter/material.dart';
import 'package:flutter_ro_test/model/ComplaintModel.dart';
import 'package:flutter_ro_test/vendor/ShowComplaintScreen.dart';
import 'package:flutter_ro_test/web_services/SignUpService.dart';

class ComplaintList extends StatefulWidget {

  String session_id;

  ComplaintList(this.session_id);

  @override
  _ComplaintListState createState() => _ComplaintListState();
}

class _ComplaintListState extends State<ComplaintList> {
  List<ComplaintData> complaintdata;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Complaints')),
      body: FutureBuilder(
          future: getComplaint(),
          builder: (context,snap){
            if(snap.hasData){
              if(snap.connectionState==ConnectionState.waiting){
                return Center(child: Text('Loading....'));
              }
              return ListView.builder(
                  itemCount: complaintdata.length,
                  itemBuilder: (context,index){
                    return GestureDetector(
                      onTap: (){
                        debugPrint(widget.session_id);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowComplaint(widget.session_id,index)));
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
                                    Text("Customer Name: "+complaintdata.elementAt(index).username),
                                    Text("Issue: "+complaintdata.elementAt(index).issue),
                                    Text("Reason: "+complaintdata.elementAt(index).reason),
                                    Text("Complaint Id: "+complaintdata.elementAt(index).compId),
                                  ],
                                ),
                              ),
                            )
                        ),
                      ),
                    );
                  });
            }else{
              return Center(child: Text('Loading.... '),);
            }
          }),
    );
  }

  Future<List<ComplaintData>>getComplaint() async{
    await SignUpService().getComplaint(widget.session_id).then((value) {
      print(value.complaintdata);
      complaintdata=value.complaintdata;
    });
    return complaintdata;
  }
}

