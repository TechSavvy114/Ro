import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ro_test/web_services/SignUpService.dart';

class AddComplain extends StatefulWidget {

  String uid;
  AddComplain(this.uid);


  @override
  _AddComplainState createState() => new _AddComplainState();
}

class _AddComplainState extends State<AddComplain> {

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  List<String> _lists = <String> ['Misbehave', 'Not working', 'Extra charge ','Servicing' ];

  TextEditingController leadController=TextEditingController();
  TextEditingController reasonController=TextEditingController();
  TextEditingController nameController=TextEditingController();
  TextEditingController mobileController=TextEditingController();
  TextEditingController detailController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Compliant'),
      ),
      body: new SafeArea(
          top: false,
          bottom: false,
          child: new Form(
              key: _formKey,
              autovalidate: true,
              child: Container(
                decoration: BoxDecoration(
                   /* gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomCenter,
                        colors: [Colors.white, Color.fromRGBO(0, 41, 100, 1)])*/
                  color: Colors.white
                ),
                child: new ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  children: <Widget>[
                    SizedBox(height: 6,),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: new TextFormField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.person),
                            border: InputBorder.none,
                            hintText: 'Enter Vendor name/Id',
                            labelText: 'Name',
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          border: Border.all(width: 1.0, color: Colors.black)),
                    ),
                    SizedBox(height: 2),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: new TextFormField(
                          controller: leadController,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.loyalty),
                            border: InputBorder.none,
                            hintText: 'Enter a Lead Id',
                            labelText: 'Lead Id.',
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          border: Border.all(width: 1.0, color: Colors.black)),
                    ),
                    SizedBox(height: 2),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: new TextFormField(
                          controller: mobileController,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.phone_android),
                            border: InputBorder.none,
                            hintText: 'Enter a phone number',
                            labelText: 'Mobile No.',
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          border: Border.all(width: 1.0, color: Colors.black)),
                    ),
                    SizedBox(height: 2),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: new TextFormField(
                          controller: reasonController,
                          decoration: InputDecoration(
                            icon: const Icon(Icons.loyalty),
                            border: InputBorder.none,
                            hintText: "Reason",
                            labelText: "Reason",
                            hintStyle:
                            TextStyle(color: Colors.grey[400]),
                            suffixIcon: (PopupMenuButton<dynamic>(
                              icon: const Icon(
                                  Icons.arrow_drop_down_circle),
                              onSelected: (dynamic value) {
                                reasonController.text=value;
                              },
                              itemBuilder: (BuildContext context) {
                                return _lists
                                    .map<PopupMenuItem<dynamic>>(
                                        (dynamic value) {
                                      return new PopupMenuItem(
                                          child: new Text(value),
                                          value: value);
                                    }).toList();
                              },
                            )
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          border: Border.all(width: 1.0, color: Colors.black)),
                    ),
                    SizedBox(height: 2),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: new TextFormField(
                          controller: detailController,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.details),
                            border: InputBorder.none,
                            hintText: 'Compliant Detail',
                            labelText: 'Description',
                          ),
                          keyboardType: TextInputType.multiline,
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          border: Border.all(width: 1.0, color: Colors.black)),
                    ),
                    SizedBox(height: 30,),
                    new Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFFF05A22),
                            style: BorderStyle.solid,
                            width: 2.0,
                          ),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: FlatButton(
                          color: Colors.transparent,
                          child: const Text('Submit',style: TextStyle(color: Colors.black,fontSize: 20 ),),
                          onPressed: (){
                            postComplain(widget.uid.toString(),nameController.text.toString(),detailController.text.toString(),reasonController.text.toString(),
                                leadController.text.toString(),mobileController.text.toString());
                          },
                        )
                    ),
                  ],
                ),
              ))),
    );
  }

  Future<void> postComplain(String uid,String name,String detail, String reason,String lead_id, String number) async{
    await SignUpService().raiseComplaint(uid,name,lead_id,number,reason.toString(),detail.toString()).then((value) {
      print('successful');
    });
  }
}
