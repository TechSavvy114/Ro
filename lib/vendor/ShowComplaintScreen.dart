import 'package:flutter/material.dart';
import 'package:flutter_ro_test/model/ComplaintModel.dart';
import 'package:flutter_ro_test/model/ComplaintModel.dart';
import 'package:flutter_ro_test/model/ComplaintModel.dart';
import 'package:flutter_ro_test/model/ComplaintModel.dart';
import 'package:flutter_ro_test/model/LeadShowModel.dart';
import 'package:flutter_ro_test/vendor/VendorHome.dart';
import 'package:flutter_ro_test/web_services/SignUpService.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ShowComplaint extends StatefulWidget {
  String session_id;
  int index;


  ShowComplaint(this.session_id, this.index);

  @override
  _ShowComplaintState createState() => _ShowComplaintState();
}

class _ShowComplaintState extends State<ShowComplaint> {
  List<ComplaintData> list;
  List<GetComplaintModel> getComplaintList;
  String status;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getComplaintData(widget.session_id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Complaint Details')),
      body: list != null
          ? Details()
          : Center(
        child: Text('No Complaint '),
      ),
    );
  }

  Widget Details() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                  child: Container(
                    height: 60,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Lead ID : ' + list.elementAt(widget.index).compId,
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(width: 1.0, color: Colors.white70)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                  child: Container(
                    height: 60,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'UserName : ' + list.elementAt(widget.index).username,
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(width: 1.0, color: Colors.white70)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                  child: Container(
                    height: 60,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'User Number: ' + list.elementAt(widget.index).usernumber,
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(width: 1.0, color: Colors.white70)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                  child: Container(
                    height: 60,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Date: ' + list.elementAt(widget.index).addedon,
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(width: 1.0, color: Colors.white70)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                  child: Container(
                    height: 60,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Issue : ' + list.elementAt(widget.index).issue,
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(width: 1.0, color: Colors.white70)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                  child: Container(
                    height: 60,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Service :' + list.elementAt(widget.index).service,
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(width: 1.0, color: Colors.white70)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                  child: Container(
                    height: 60,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Address : ' + list.elementAt(widget.index).address,
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(width: 1.0, color: Colors.white70)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                  child: Container(
                    height: 60,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Reason: ' + list.elementAt(widget.index).reason,
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(width: 1.0, color: Colors.white70)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                  child: Container(
                    height: 60,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Details: ' + list.elementAt(widget.index).complaintDetails,
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(width: 1.0, color: Colors.white70)),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> getComplaintData(String session_id) async {
    await SignUpService()
        .getComplaint(session_id)
        .then((value) {
      list = value.complaintdata;
    });
    setState(() {});
  }
}
