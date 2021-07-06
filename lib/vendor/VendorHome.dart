/*
import 'package:flutter/material.dart';
import 'package:ro_servicing/HomePageUser/WelcomeBox.dart';
import 'package:ro_servicing/fragments/secondfragment.dart';
import 'package:ro_servicing/vendor/AcceptedLeads.dart';
import 'package:ro_servicing/vendor/RechargeScreen.dart';
import 'package:ro_servicing/vendor/ShowCompletedLeads.dart';
import 'package:ro_servicing/vendor/WalletBalance.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
import 'ShowLeads.dart';
import 'ShowOngoingLeads.dart';

class MainScreenVendor extends StatefulWidget {
  @override
  _MainScreenVendorState createState() => _MainScreenVendorState();
}

class _MainScreenVendorState extends State<MainScreenVendor> {
  String name, email, vid,walletBalance;
  int cid, sid;
  int index=1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed((Duration(seconds: 1)), () => getData());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: MyAppBar(context,walletBalance),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: name!=null ? Text(name) : Text('No Name'),
                accountEmail: email!=null ? Text(email) : Text('No Email'),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: name!=null ? Text(
                    name[0],
                    style: TextStyle(fontSize: 40.0),
                  ) : Text('A'),
                ),
              ),
              ListTile(
                title: Text('Home'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainScreenVendor()),
                  );
                  //Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Lead'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ShowLeads(cid, sid, vid)),
                  );
                  //Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Complaint'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddComplain()),
                  );
                  // Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Logout'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  logout();
                },
              ),
            ],
          ),),
        body: Column(
          children: [
            FutureBuilder(
              future: getUserName(),
              builder: (context,snap){
                return WelcomeBox(widget: Text("Welcome "+name,
                  style: TextStyle(
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold),));
              },
            ),
            Column(
              children: [
                FittedBox(
                  child: Row(
                    children: [
                      RaisedButton.icon(
                        onPressed: (){

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ShowLeads(cid, sid, vid)),
                          );

                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0))),
                        label: Text('New lead',
                          style: TextStyle(color: Colors.white),),
                        icon: Icon(Icons.loyalty, color:Colors.white,),
                        textColor: Colors.white,
                        splashColor: Colors.red,
                        color: Colors.green,),

                      RaisedButton.icon(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowOngoingLeads(cid,sid,vid)));
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0))),
                        label: Text('Ongoing lead',
                          style: TextStyle(color: Colors.white),),
                        icon: Icon(Icons.loyalty, color:Colors.white,),
                        textColor: Colors.white,
                        splashColor: Colors.red,
                        color: Colors.green,),

                      RaisedButton.icon(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ShowAccpetedLeads(cid, sid, vid)),
                          );
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0))),
                        label: Text('Accepted Lead',
                          style: TextStyle(color: Colors.white),),
                        icon: Icon(Icons.loyalty, color:Colors.white,),
                        textColor: Colors.white,
                        splashColor: Colors.red,
                        color: Colors.green,),
                    ],
                  ),
                ),
                FittedBox(
                  child: Row(
                    children: [
                      RaisedButton.icon(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowCompletedLeads(cid, sid, vid)));
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0))),
                        label: Text('Completed lead',
                          style: TextStyle(color: Colors.white),),
                        icon: Icon(Icons.loyalty, color:Colors.white,),
                        textColor: Colors.white,
                        splashColor: Colors.red,
                        color: Colors.green,),

                      RaisedButton.icon(
                        onPressed: (){  },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0))),
                        label: Text('My Accounts',
                          style: TextStyle(color: Colors.white),),
                        icon: Icon(Icons.loyalty, color:Colors.white,),
                        textColor: Colors.white,
                        splashColor: Colors.red,
                        color: Colors.green,),

                      RaisedButton.icon(
                        onPressed: (){  },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0))),
                        label: Text('Complaints',
                          style: TextStyle(color: Colors.white),),
                        icon: Icon(Icons.loyalty, color:Colors.white,),
                        textColor: Colors.white,
                        splashColor: Colors.red,
                        color: Colors.green,),
                    ],
                  ),
                ),
                FittedBox(
                  child: Row(
                    children: [
                      */
/*RaisedButton.icon(
                        onPressed: (){  },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0))),
                        label: Text('Reports',
                          style: TextStyle(color: Colors.white),),
                        icon: Icon(Icons.loyalty, color:Colors.white,),
                        textColor: Colors.white,
                        splashColor: Colors.red,
                        color: Colors.green,),*//*


                      RaisedButton.icon(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>RechargeScreen()));
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0))),
                        label: Text('Recharge',
                          style: TextStyle(color: Colors.white),),
                        icon: Icon(Icons.loyalty, color:Colors.white,),
                        textColor: Colors.white,
                        splashColor: Colors.red,
                        color: Colors.green,),

                      RaisedButton.icon(
                        onPressed: (){  },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0))),
                        label: Text('Products',
                          style: TextStyle(color: Colors.white),),
                        icon: Icon(Icons.loyalty, color:Colors.white,),
                        textColor: Colors.white,
                        splashColor: Colors.red,
                        color: Colors.green,),
                    ],
                  ),
                ),
                Row(

                  children: [
                    Expanded(
                      flex: 1,
                      child: RaisedButton.icon(
                        onPressed: (){ },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0))),
                        label: Text('Part',
                          style: TextStyle(color: Colors.white),),
                        icon: Icon(Icons.loyalty, color:Colors.white,),
                        textColor: Colors.white,
                        splashColor: Colors.red,
                        color: Colors.green,),
                    ),

                    Expanded(
                      flex: 1,
                      child: RaisedButton.icon(
                        onPressed: (){ },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0))),
                        label: Text('Support',
                          style: TextStyle(color: Colors.white),),
                        icon: Icon(Icons.loyalty, color:Colors.white,),
                        textColor: Colors.white,
                        splashColor: Colors.red,
                        color: Colors.green,),
                    ),

                    Expanded(
                      flex: 1,
                      child: RaisedButton.icon(
                        onPressed: (){  },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0))),
                        label: Text('Offers',
                          style: TextStyle(color: Colors.white),),
                        icon: Icon(Icons.loyalty, color:Colors.white,),
                        textColor: Colors.white,
                        splashColor: Colors.red,
                        color: Colors.green,),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<String>getUserName() async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    return sharedPreferences.getString('venName');
  }

  Future<void> getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String name1 = sharedPreferences.getString('venName');
    String email1 = sharedPreferences.getString('venEmail');
    int cid1 = sharedPreferences.getInt('venCid');
    int sid1 = sharedPreferences.getInt('venSid');
    String vid1 = sharedPreferences.getString('vid');
    String wallet = sharedPreferences.getString('wallet');
    //String address1 = sharedPreferences.getString('userAddress');
    setState(() {
      name = name1;
      email = email1;
      sid = sid1;
      cid = cid1;
      vid = vid1;
      walletBalance=wallet;
    });
  }

  Future<void> logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }
}

AppBar MyAppBar(BuildContext context, String walletBalance) {
  return AppBar(
    title: Text('RCI'),
    elevation: 0.0,
    actions: [
      IconButton(icon: Icon(Icons.notifications_rounded), onPressed: () {  },),
      IconButton(icon: Icon(Icons.account_balance_wallet), onPressed: () {
         Navigator.push(context, MaterialPageRoute(builder: (context)=>WalletBalance(walletBalance)));
      },),
      SizedBox(width: 15.0),
    ],
  );
}



*/

import 'package:flutter/material.dart';
import 'package:flutter_ro_test/CommonPages/AboutUs.dart';
import 'package:flutter_ro_test/CommonPages/Profile.dart';
import 'package:flutter_ro_test/HomePageUser/WelcomeBox.dart';
import 'package:flutter_ro_test/User/OfferScreen.dart';
import 'package:flutter_ro_test/model/NotificationModel.dart';
import 'package:flutter_ro_test/vendor/ComplaintList.dart';
import 'package:flutter_ro_test/vendor/DeniedLeads.dart';
import 'package:flutter_ro_test/vendor/OrderHistory.dart';
import 'package:flutter_ro_test/vendor/VendorNotification.dart';
import 'package:flutter_ro_test/web_services/SignUpService.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
import 'AcceptedLeads.dart';
import 'RechargeScreen.dart';
import 'ShowCompletedLeads.dart';
import 'ShowLeads.dart';
import 'ShowOngoingLeads.dart';
import 'VendorProductPage.dart';
import 'WalletBalance.dart';




class MainScreenVendor extends StatefulWidget {
  @override
  _MainScreenVendorState createState() => _MainScreenVendorState();
}

class _MainScreenVendorState extends State<MainScreenVendor> {
  String name, email, vid, walletBalance, address,session_id;
  int cid, sid,phone;
  int index = 1;
  List<NotificationData>list;
  //bool red_dot;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchNotification();
    Future.delayed((Duration(seconds: 1)), () => getData());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          appBar: MyAppBar(context, vid,list!=null ? list.length.toString() : null , list),
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: name != null ? Text(name) : Text('No Name'),
                  accountEmail: email != null ? Text(email) : Text('No Email'),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.orange,
                    child: name != null
                        ? Text(
                      name[0],
                      style: TextStyle(fontSize: 40.0),
                    )
                        : Text('A'),
                   ),
                ),
                ListTile(
                  title: Text('Home'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MainScreenVendor()),
                    );
                    //Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Order History'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => showorderHistory(session_id)),
                    );
                  },
                ),
                ListTile(
                  title: Text('Logout'),
                  onTap: () {
                    logout();
                  },
                ),
                Divider(thickness: 2,color: Colors.red,),
                ListTile(
                  title: Text('About Us'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AboutUs()),
                    );
                  },
                ),
                Divider(thickness: 2,color: Colors.red,),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                    WelcomeBox(
                        widget: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              name != null ? Text(
                          "Welcome " + name,
                            style: TextStyle(
                                fontSize: 23.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ) : Text('.'),
                              SizedBox(
                                height: 5,
                              ),

                              session_id!=null ? Text(session_id,style: TextStyle(color: Colors.white),) : Text('.'),
                              Text(
                                "Good to see you again, stay tune for latest offers. ",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FittedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              width: 140,
                              height: 140,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipOval(
                                    child: Material(
                                      color: Colors.blue[100], // button color
                                      child: InkWell(
                                        splashColor: Colors.grey, // inkwell color
                                        child: SizedBox(
                                            width: 56,
                                            height: 56,
                                            child: Icon(Icons.new_releases)),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ShowLeads(cid, sid, vid,walletBalance)),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('New Leads')
                                ],
                              ),
                            ),
                            Container(
                              width: 140,
                              height: 140,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipOval(
                                    child: Material(
                                      color: Colors.blue[100], // button color
                                      child: InkWell(
                                        splashColor: Colors.grey, // inkwell color
                                        child: SizedBox(
                                            width: 56,
                                            height: 56,
                                            child: Icon(Icons.arrow_forward)),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ShowAccpetedLeads(
                                                        cid, sid, vid)),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Accepted\n   Lead')
                                ],
                              ),
                            ),
                            Container(
                              width: 140,
                              height: 140,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipOval(
                                    child: Material(
                                      color: Colors.blue[100], // button color
                                      child: InkWell(
                                        splashColor: Colors.grey, // inkwell color
                                        child: SizedBox(
                                            width: 56,
                                            height: 56,
                                            child: Icon(Icons.call_missed_outgoing)),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ShowOngoingLeads(
                                                          cid, sid, vid)));
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Ongoing\n  Lead')
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                    FittedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              width: 140,
                              height: 140,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipOval(
                                    child: Material(
                                      color: Colors.blue[100], // button color
                                      child: InkWell(
                                        splashColor: Colors.grey, // inkwell color
                                        child: SizedBox(
                                            width: 56,
                                            height: 56,
                                            child: Icon(Icons.done_all)),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ShowCompletedLeads(
                                                          cid, sid, vid)));
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Completed\n    Leads')
                                ],
                              ),
                            ),
                            Container(
                              width: 140,
                              height: 140,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipOval(
                                    child: Material(
                                      color: Colors.blue[100], // button color
                                      child: InkWell(
                                        splashColor: Colors.grey, // inkwell color
                                        child: SizedBox(
                                            width: 56,
                                            height: 56,
                                            child: Icon(Icons.clear)),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ShowDeniedLeads(
                                                        vid)),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Denied \n Leads')
                                ],
                              ),
                            ),
                            Container(
                              width: 140,
                              height: 140,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipOval(
                                    child: Material(
                                      color: Colors.blue[100], // button color
                                      child: InkWell(
                                        splashColor: Colors.grey, // inkwell color
                                        child: SizedBox(
                                            width: 56,
                                            height: 56,
                                            child: Icon(Icons.perm_identity)),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      //Profile();
                                                     Profile(name,address,phone.toString(),email,walletBalance),
                                              ));
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('My Account')
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                    FittedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              width: 140,
                              height: 140,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipOval(
                                    child: Material(
                                      color: Colors.blue[100], // button color
                                      child: InkWell(
                                        splashColor: Colors.grey, // inkwell color
                                        child: SizedBox(
                                            width: 56,
                                            height: 56,
                                            child: Icon(Icons.account_balance_wallet)),
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder:(context)=>RechargeScreen.buynow(session_id,1,vid)));
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Recharge')
                                ],
                              ),
                            ),
                            Container(
                              width: 140,
                              height: 140,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipOval(
                                    child: Material(
                                      color: Colors.blue[100], // button color
                                      child: InkWell(
                                        splashColor: Colors.grey, // inkwell color
                                        child: SizedBox(
                                            width: 56,
                                            height: 56,
                                            child: Icon(Icons.album)),
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder:(context)=>VendorProductPartsPage(0)));
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Products')
                                ],
                              ),
                            ),
                            Container(
                              width: 140,
                              height: 140,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipOval(
                                    child: Material(
                                      color: Colors.blue[100], // button color
                                      child: InkWell(
                                        splashColor: Colors.grey, // inkwell color
                                        child: SizedBox(
                                            width: 56,
                                            height: 56,
                                            child: Icon(Icons.adjust)),
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder:(context)=>VendorProductPartsPage(1)));
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Parts')
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    FittedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              width: 140,
                              height: 140,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipOval(
                                    child: Material(
                                      color: Colors.blue[100], // button color
                                      child: InkWell(
                                        splashColor: Colors.grey, // inkwell color
                                        child: SizedBox(
                                            width: 56,
                                            height: 56,
                                            child: Icon(Icons.rate_review)),
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder:(context)=>ComplaintList(session_id)));
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Complaint')
                                ],
                              ),
                            ),
                            Container(
                              width: 140,
                              height: 140,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipOval(
                                    child: Material(
                                      color: Colors.blue[100], // button color
                                      child: InkWell(
                                        splashColor: Colors.grey, // inkwell color
                                        child: SizedBox(
                                            width: 56,
                                            height: 56,
                                            child: Icon(Icons.loyalty)),
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder:(context)=>OfferScreen()));
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Offers')
                                ],
                              ),
                            ),
                            /*Container(
                              width: 140,
                              height: 140,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipOval(
                                    child: Material(
                                      color: Colors.blue[100], // button color
                                      child: InkWell(
                                        splashColor: Colors.grey, // inkwell color
                                        child: SizedBox(
                                            width: 56,
                                            height: 56,
                                            child: Icon(Icons.menu)),
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>PickerDemo()));
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Reports')
                                ],
                              ),
                            ),*/
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


  Future<void> getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String name1 = sharedPreferences.getString('venName');
    String email1 = sharedPreferences.getString('venEmail');
    int cid1 = sharedPreferences.getInt('venCid');
    int sid1 = sharedPreferences.getInt('venSid');
    String vid1 = sharedPreferences.getString('vid');
    sharedPreferences.reload();
    String wallet = sharedPreferences.getString('wallet');
    int phone1 = sharedPreferences.getInt('venNumber');
    String address1 = sharedPreferences.getString('venAddress');
    String session_id1 = sharedPreferences.getString('venid');
    setState(() {
      name = name1;
      email = email1;
      sid = sid1;
      cid = cid1;
      vid = vid1;
      phone = phone1;
      address = address1;
      walletBalance = wallet;
      session_id=session_id1;
    });
  }

  Future<void> logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit an App'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('Yes'),
          ),
        ],
      ),
    )) ??
        false;
  }

  Future<NotificationModel> fetchNotification () async {
    await SignUpService().getNotification(session_id).then((value) {
      if(value.notificationdata!=null){
        setState(() {
          list=value.notificationdata;
        });
        print(list.length.toString());
      }else{
        print('no new Notification');
      }
    });

  }
}

AppBar MyAppBar(BuildContext context, String vid,String no_of_notification, List<NotificationData> list) {
  return AppBar(
    title: Text('Just24You'),
    elevation: 0.0,
    actions: [
      Stack(
        children: [
          new  IconButton(icon: Icon(Icons.notifications), onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Ven_Notify(list)));
          }),
          new Positioned(
              right: 11,
              top: 11,
              child: no_of_notification!=null ? new Container(
                padding: EdgeInsets.all(2),
                decoration: new BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(6),
                ),
                constraints: BoxConstraints(
                  minWidth: 14,
                  minHeight: 14,
                ),
                child: Text(no_of_notification,
                style:  TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                ),
                  textAlign: TextAlign.center,
                )

          ):Text('')

          )
        ],
      ),
      IconButton(
        icon: Icon(Icons.account_balance_wallet),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => WalletBalance(vid.toString())));
        },
      ),
      SizedBox(width: 15.0),
    ],
  );
}
