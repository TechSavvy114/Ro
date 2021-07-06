import 'package:flutter/material.dart';
import 'main.dart';
import 'model/CItyModel.dart';
import 'model/StateModel.dart';
import 'web_services/SignUpService.dart';

class SignupVendor extends StatefulWidget {
  Future<SignUpService> _createUser;
  Future<SignUpService> _cityPick;

  @override
  _SignupVendorState createState() => _SignupVendorState();
}

class _SignupVendorState extends State<SignupVendor> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController mobilecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController citycontroller = TextEditingController();
  TextEditingController statecontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController gstin = TextEditingController();
  TextEditingController idprooftype = TextEditingController();
  TextEditingController idproofno = TextEditingController();

  List<StateData> myList;
  List<CityData>cityList;
  var city = [];
  var state=[];

  String state_id,city_id;

  @override
  initState() {
    // TODO: implement initState
    super.initState();
    getStateName();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                       Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .2),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10)
                              )
                            ]
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey[100]))
                              ),
                              child: TextField(
                                controller: namecontroller,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Name",
                                    hintStyle: TextStyle(color: Colors.grey[400])
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                controller: mobilecontroller,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Mobile Number",
                                    hintStyle: TextStyle(color: Colors.grey[400])
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                controller: emailcontroller,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Email",
                                    hintStyle: TextStyle(color: Colors.grey[400])
                                ),
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                controller: statecontroller,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "State",
                                  hintStyle:
                                  TextStyle(color: Colors.grey[400]),
                                  suffixIcon: (PopupMenuButton<dynamic>(
                                    icon: const Icon(
                                        Icons.arrow_drop_down_circle),
                                    onSelected: (dynamic value) {
                                      statecontroller.text = value;
                                      getCity(myList.elementAt(state.indexOf(value)).id);
                                      setState(() {
                                        state_id=myList.elementAt(state.indexOf(value)).id;
                                      });
                                      //print(myList.elementAt(state.indexOf(value)).id);
                                      //print(state.indexOf(value));
                                    },
                                    itemBuilder: (BuildContext context) {
                                      return state
                                          .map<PopupMenuItem<dynamic>>(
                                              (dynamic value) {
                                            return new PopupMenuItem(
                                                child: new Text(value),
                                                value: value);
                                          }).toList();
                                    },
                                  )),
                                ),
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                controller: citycontroller,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "City",
                                  hintStyle:
                                  TextStyle(color: Colors.grey[400]),
                                  suffixIcon: (PopupMenuButton<String>(
                                    icon: const Icon(
                                        Icons.arrow_drop_down_circle),
                                    onSelected: (String value) {
                                      citycontroller.text = value;
                                      setState(() {
                                        city_id=cityList.elementAt(city.indexOf(value)).id;
                                      });
                                    },
                                    itemBuilder: (BuildContext context) {
                                      return city
                                          .map<PopupMenuItem<String>>(
                                              (dynamic value) {
                                            return new PopupMenuItem(
                                                child: new Text(value),
                                                value: value);
                                          }).toList();
                                    },
                                  )),
                                ),
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                controller: addresscontroller,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Address",
                                    hintStyle: TextStyle(color: Colors.grey[400])
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                controller: passwordcontroller,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Password",
                                    hintStyle: TextStyle(color: Colors.grey[400])
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                controller: gstin,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "gst IN (optional)",
                                    hintStyle: TextStyle(color: Colors.grey[400])
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                controller: idprooftype,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "id_proof_type",
                                    hintStyle: TextStyle(color: Colors.grey[400])
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                controller: idproofno,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "idproofno",
                                    hintStyle: TextStyle(color: Colors.grey[400])
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30,),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(colors: [
                                  Color.fromRGBO(143, 148, 251, 1),
                                  Color.fromRGBO(143, 148, 251, .6),
                                ])),
                            child: Center(
                                child: FlatButton (
                                    child: Text('SignUp'),
                                    onPressed: (){
                                  SignUpService().createVendor(namecontroller.text,
                                      emailcontroller.text.toString(),
                                      mobilecontroller.text.toString(),
                                      addresscontroller.text,
                                      city_id.toString(),
                                      state_id.toString(),
                                      '123456',
                                      passwordcontroller.text.toString(),
                                  gstin.text.toString(),
                                    idprooftype.text.toString(),
                                    idproofno.text.toString()
                                  );
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                                },
                                    color: Color.fromRGBO(143, 148, 251, .7),
                                )
                            ),
                          ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }

  Future<void> getStateName()async {
    SignUpService().getStateIds().then((value){
      //myList=value.dataList;
      myList=value.data;
      for(int i=0;i<myList.length;i++){
        state.add(myList.elementAt(i).name);
      }
    });
  }

  Future<void> getCity(String sid)async {
    SignUpService().getCities(sid).then((value) {
      cityList = value.citydata;
      for(int i=0;i<cityList.length;i++){
        city.add(cityList.elementAt(i).name);
      }
    });
  }

}
