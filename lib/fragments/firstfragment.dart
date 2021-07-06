import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ro_test/HomePageUser/MainScreen.dart';
import 'package:flutter_ro_test/model/BrandModel.dart';
import 'package:flutter_ro_test/model/IssueModel.dart';
import 'package:flutter_ro_test/model/ServiceModel.dart';
import 'package:flutter_ro_test/web_services/SignUpService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddService extends StatefulWidget {
  AddService({Key key}) : super(key: key);
  final String title = "Request Service";

  @override
  _AddServiceState createState() => new _AddServiceState();
}

class _AddServiceState extends State<AddService> {
  String name, email, address, uid, detail;
  int pincode, number, issue_id, service_id, brand_id, cid, sid;
  List<IssueData> issueList;
  List<BrandData> brandList;
  List<ServiceData> serviceList;
  var issue = [];
  var brand = [];
  var service = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(microseconds: 10000), () => getData());
    getIssue();
    getBrand();
    getService();
  }

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController brandController = TextEditingController();
  TextEditingController issueController = TextEditingController();
  TextEditingController serviceController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController detailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
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
                    color: Colors.white),
                child: new ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  children: <Widget>[
                    SizedBox(
                      height: 6,
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: new TextFormField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.person),
                            border: InputBorder.none,
                            hintText: 'Enter your first and last name',
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
                          controller: addressController,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.home),
                            border: InputBorder.none,
                            hintText: 'Enter your address',
                            labelText: 'Address',
                          ),
                          keyboardType: TextInputType.text,
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
                          controller: issueController,
                          decoration: InputDecoration(
                            icon: const Icon(Icons.loyalty),
                            border: InputBorder.none,
                            hintText: "issue",
                            labelText: "Issue",
                            hintStyle: TextStyle(color: Colors.grey[400]),
                            suffixIcon: (PopupMenuButton<dynamic>(
                              icon: const Icon(Icons.arrow_drop_down_circle),
                              onSelected: (dynamic value) {
                                issueController.text = value;
                                setState(() {
                                  issue_id = int.parse(issueList
                                      .elementAt(issue.indexOf(value))
                                      .id);
                                });
                              },
                              itemBuilder: (BuildContext context) {
                                return issue.map<PopupMenuItem<dynamic>>(
                                    (dynamic value) {
                                  return new PopupMenuItem(
                                      child: new Text(value), value: value);
                                }).toList();
                              },
                            )),
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
                          controller: brandController,
                          decoration: InputDecoration(
                            icon: const Icon(Icons.loyalty),
                            border: InputBorder.none,
                            hintText: "brand",
                            labelText: "Brand",
                            hintStyle: TextStyle(color: Colors.grey[400]),
                            suffixIcon: (PopupMenuButton<dynamic>(
                              icon: const Icon(Icons.arrow_drop_down_circle),
                              onSelected: (dynamic value) {
                                brandController.text = value;
                                setState(() {
                                  brand_id = int.parse(brandList
                                      .elementAt(brand.indexOf(value))
                                      .id);
                                });
                              },
                              itemBuilder: (BuildContext context) {
                                return brand.map<PopupMenuItem<dynamic>>(
                                    (dynamic value) {
                                  return new PopupMenuItem(
                                      child: new Text(value), value: value);
                                }).toList();
                              },
                            )),
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
                          controller: serviceController,
                          decoration: InputDecoration(
                            icon: const Icon(Icons.loyalty),
                            border: InputBorder.none,
                            hintText: "service",
                            labelText: "Service",
                            hintStyle: TextStyle(color: Colors.grey[400]),
                            suffixIcon: (PopupMenuButton<dynamic>(
                              icon: const Icon(Icons.arrow_drop_down_circle),
                              onSelected: (dynamic value) {
                                serviceController.text = value;
                                setState(() {
                                  service_id = int.parse(serviceList
                                      .elementAt(service.indexOf(value))
                                      .id);
                                });
                              },
                              itemBuilder: (BuildContext context) {
                                return service.map<PopupMenuItem<dynamic>>(
                                    (dynamic value) {
                                  return new PopupMenuItem(
                                      child: new Text(value), value: value);
                                }).toList();
                              },
                            )),
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
                            icon: const Icon(Icons.content_paste),
                            border: InputBorder.none,
                            hintText: 'Enter your issue details',
                            labelText: 'Description',
                          ),
                          keyboardType: TextInputType.multiline,
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          border: Border.all(width: 1.0, color: Colors.black)),
                    ),
                    SizedBox(height: 30),
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
                      child:
                          /*new RaisedButton(
                          child: const Text('Submit'),
                        //  color: Colors.transparent,
                          onPressed: () {
                            postLead(uid, name, email, number, cid.toString(), sid.toString(), pincode,
                                address, service_id, brand_id, issue_id,detailController.text.toString());

                            setState(() {
                              issueController.text='';
                              brandController.text='';
                              serviceController.text='';
                              detailController.text='';
                            }
                            );
                          },
                        ),*/
                          FlatButton(
                              onPressed: () {
                                postLead(
                                    uid,
                                    name,
                                    email,
                                    number,
                                    cid.toString(),
                                    sid.toString(),
                                    pincode,
                                    address,
                                    service_id,
                                    brand_id,
                                    issue_id,
                                    detailController.text.toString());

                                setState(() {
                                  issueController.text = '';
                                  brandController.text = '';
                                  serviceController.text = '';
                                  detailController.text = '';

                                });

                                Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreenUser()));
                                },
                              child: const Text('Submit',style: TextStyle(fontSize: 20),)),
                    ),
                  ],
                ),
              ))),
    );
  }

  Future<void> getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String uid1 = sharedPreferences.getString('uid');
    String name1 = sharedPreferences.getString('userName');
    String email1 = sharedPreferences.getString('useremail');
    int number1 = sharedPreferences.getInt('userNumber');
    int cid1 = sharedPreferences.getInt('cid');
    int sid1 = sharedPreferences.getInt('sid');
    int pincode1 = sharedPreferences.getInt('userpincode');
    String address1 = sharedPreferences.getString('userAddress');
    print(uid1 +
        "\n" +
        name1 +
        "\n" +
        email1 +
        "\n" +
        number1.toString() +
        "\n" +
        cid1.toString() +
        "\n" +
        sid1.toString() +
        "\n" +
        pincode1.toString() +
        "\n" +
        address1);
    setState(() {
      name = name1;
      nameController.text = name1;
      mobileController.text = number1.toString();
      addressController.text = address1;
      address = address1;
      uid = uid1;
      number = number1;
      email = email1;
      sid = sid1;
      cid = cid1;
      pincode = pincode1;
    });
  }

  Future<void> postLead(
      String uid,
      String name,
      String email,
      int number,
      String cid,
      String sid,
      int pincode,
      String address,
      int service_id1,
      int brand_id1,
      int issue_id1,
      String detail) async {
    await SignUpService()
        .postLead(uid, name, email, number, cid, sid, pincode, address,
            service_id1, brand_id1, issue_id1, detail)
        .then((value) {
      print(value.status);
    });
  }

  Future<void> getIssue() async {
    await SignUpService().getIssue().then((value) {
      issueList = value.issueDAta;
      print(issueList.elementAt(0).name);
    });
    for (int i = 0; i < issueList.length; i++) {
      issue.add(issueList.elementAt(i).name);
    }
  }

  Future<void> getBrand() async {
    await SignUpService().getBrand().then((value) {
      brandList = value.brandData;
      print(brandList.elementAt(0).name);
    });
    for (int i = 0; i < brandList.length; i++) {
      brand.add(brandList.elementAt(i).name);
    }
  }

  Future<void> getService() async {
    await SignUpService().getService().then((value) {
      serviceList = value.serviceData;
      print(serviceList.elementAt(0).name);
    });
    for (int i = 0; i < serviceList.length; i++) {
      service.add(serviceList.elementAt(i).name);
    }
  }
}
