import 'package:flutter/material.dart';
import 'package:flutter_ro_test/model/LeadShowModel.dart';
import 'package:flutter_ro_test/vendor/VendorHome.dart';
import 'package:flutter_ro_test/web_services/SignUpService.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LeadDetails extends StatefulWidget {
  int cid, sid, index;
  String vid,walletBalance;

  LeadDetails(this.cid, this.sid, this.index,this.vid, this.walletBalance);

  @override
  _LeadDetailsState createState() => _LeadDetailsState();
}

class _LeadDetailsState extends State<LeadDetails> {
  List<LeadShowData> list;
  List<LeadShowModel> leadModelList;
  String status;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLeadData(widget.cid, widget.sid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lead Details')),
      body: list != null
          ? Details()
          : Center(
              child: Text('Loading ....'),
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
                          'Lead ID : ' + list.elementAt(widget.index).leadId,
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
                          'brand : ' + list.elementAt(widget.index).brand,
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
                          'Details : ' + list.elementAt(widget.index).details,
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
                          'Cost : Rs ' + list.elementAt(widget.index).leadCost,
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(width: 1.0, color: Colors.white70)),
                  ),
                ),
                Align(
                  child: list.elementAt(widget.index).status == 'approved'
                      ? Expanded(
                          flex: 1,
                          child: RaisedButton(
                            color: Colors.green[800],
                            splashColor: Colors.blue[200],
                            child: Text(
                              'Accept',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 20),
                            ),
                            onPressed: () {
                              if(int.parse(widget.walletBalance) > int.parse(list.elementAt(widget.index).leadCost)) {
                                acceptLead(list
                                    .elementAt(widget.index)
                                    .id,
                                    widget.vid.toString(), 'accepted',
                                    list.elementAt(widget.index).leadCost);
                              }else{
                                return;
                              }
                              Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreenVendor()));
                            },
                          ))
                      : Text('This Lead has been not available'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> getLeadData(int cid, int sid) async {
    await SignUpService()
        .getLeads(cid.toString(), sid.toString())
        .then((value) {
      list = value.leadShowData;
    });
    setState(() {});
  }

  Future<void> updateWalletBance(String walletBalance, String leadCost) async {
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.remove('wallet');
    sharedPreferences.setString('wallet',(int.parse(walletBalance)-int.parse(leadCost)).toString());
  }

  Future<void> acceptLead(String id, String string, String s, String leadCost)async {
    await SignUpService().getLeadAcceptResponse(list
        .elementAt(widget.index)
        .id,
        widget.vid.toString(), 'accepted',
        list.elementAt(widget.index).leadCost).then((value){
      updateWalletBance(widget.walletBalance,list.elementAt(widget.index).leadCost);
    });
  }
}
