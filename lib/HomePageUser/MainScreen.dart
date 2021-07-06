/*
import 'package:flutter/material.dart';
import 'package:ro_servicing/HomePageUser/ProductBody.dart';
import 'package:ro_servicing/User/ProductDetails.dart';
import 'package:ro_servicing/fragments/firstfragment.dart';
import 'package:ro_servicing/fragments/secondfragment.dart';
import 'package:ro_servicing/main.dart';
import 'package:ro_servicing/model/CategoryModel.dart';
import 'package:ro_servicing/model/ProductModel.dart';
import 'package:ro_servicing/viewModel/Categories.dart';
import 'package:ro_servicing/web_services/SignUpService.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Sample.dart';
import 'PartsBody.dart';
import 'WelcomeBox.dart';

class MainScreenUser extends StatefulWidget {
  @override
  _MainScreenUserState createState() => _MainScreenUserState();
}

class _MainScreenUserState extends State<MainScreenUser> {
  int index=1;
  String name;
  String email;

  CategoryViewModel categoryViewModel = CategoryViewModel();
  List<CategoryData> catagoryList;
  List<ProductData> productList;
  List<String> productImage = [];

  String cat_id='3';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed((Duration(seconds: 1)),()=>getData());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          appBar: MyAppBar(),
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: name!=null ? Text(name) : Text('No Name'),
                  accountEmail:email!=null ? Text(email) : Text('No Email'),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.orange,
                    child:  name!=null ? Text(
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
                      MaterialPageRoute(builder: (context) => MainScreenUser()),
                    );
                    //Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Lead'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddService()),
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
              WelcomeBox(
                  widget: name!=null ? Text(
                    "Welcome " + name,
                    style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
                  ) : Text('No Name')),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: RaisedButton(
                      child: Text('product'),
                        onPressed: (){
                      setState(() {
                        index=1;
                      });
                    }),
                  ),
                  Expanded(
                    flex: 1,
                    child: RaisedButton(
                        child: Text('parts'),
                        onPressed: (){
                        setState(() {
                          index=0;
                        });
                    }),
                  )
                ],
              ),
              Expanded(child: index == 1 ?
                 ProductBody(context): PartsBody(homeContext: context,))
            ],
          ),
        ),
      ),
    );
  }

 */
/* Future<String>getUserName() async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    return sharedPreferences.getString('userName');
  }*//*


  Future<void>logout() async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.clear();
    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
  }

  Future<void>getData() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String name1 = sharedPreferences.getString('userName');
    String email1 = sharedPreferences.getString('useremail');
    //String address1 = sharedPreferences.getString('userAddress');
    setState(() {
      name = name1;
      email = email1;
    });
  }
  */
/*Future<List<CategoryData>> getCategoryData() async {
    await SignUpService().getCategories().then((value) {
      print('category is being fetched');
      catagoryList = value.categorydata;
    });
    return catagoryList;
  }
  Future<List<String>> getImages(String id) async {
    await SignUpService().getProductById(id).then((value) {
      productList = value.productData;
      print('product list is being fetched');
      productImage.clear();
    });
    for (int i = 0; i < productList.length; i++) {
      productImage.add("https://api.sallybase.com/ro/uploads/products/" +
          productList.elementAt(i).proImageFile);
    }
    return productImage;
  }*//*



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
    )) ?? false;
  }
}

AppBar MyAppBar() {
    return AppBar(
      title: Text('RCI'),
      elevation: 0.0,
      actions: [
        Icon(Icons.notifications_on_outlined),
        SizedBox(width: 15.0),
        Icon(Icons.wallet_membership_outlined),
        SizedBox(width: 15.0),
      ],
    );
}




*/

import 'package:flutter/material.dart';
import 'package:flutter_ro_test/CommonPages/AboutUs.dart';
import 'package:flutter_ro_test/fragments/firstfragment.dart';
import 'package:flutter_ro_test/fragments/secondfragment.dart';
import 'package:flutter_ro_test/model/CategoryModel.dart';
import 'package:flutter_ro_test/model/NotificationModel.dart';
import 'package:flutter_ro_test/model/ProductModel.dart';
import 'package:flutter_ro_test/vendor/VendorNotification.dart';
import 'package:flutter_ro_test/viewModel/Categories.dart';
import 'package:flutter_ro_test/web_services/SignUpService.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import 'PartsBody.dart';
import 'ProductBody.dart';
import 'WelcomeBox.dart';

class MainScreenUser extends StatefulWidget {
  @override
  _MainScreenUserState createState() => _MainScreenUserState();
}

class _MainScreenUserState extends State<MainScreenUser> {
  int index=1;
  String name;
  String email;
  String uid;
  String session_id;
  List<NotificationData>list;

  CategoryViewModel categoryViewModel = CategoryViewModel();
  List<CategoryData> catagoryList;
  List<ProductData> productList;
  List<String> productImage = [];

  String cat_id='3';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed((Duration(seconds: 1)),()=>getData());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          appBar: MyAppBar(context, uid,list!=null ? list.length.toString() : null , list),
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: name!=null ? Text(name) : Text('No Name'),
                  accountEmail:email!=null ? Text(email) : Text('No Email'),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.orange,
                    child:  name!=null ? Text(
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
                      MaterialPageRoute(builder: (context) => MainScreenUser()),
                    );
                    //Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Lead'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddService()),
                    );
                    //Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Complaint'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddComplain(uid)),
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
            ),),
          body: Column(
            children: [
              WelcomeBox(
                  widget: name!=null ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(height: 5,),
                        Text(
                          "Welcome " + name,
                          style: TextStyle(fontSize: 23.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 15,),
                        Center(
                          child: Text("Good to see you again, End your search here. "  ,
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,),),
                        ),
                      ],
                    ),
                  ) : Text('')),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: RaisedButton(
                        textColor: Colors.white,
                        color: Colors.blue[700],
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(3),
                          side: BorderSide(color: Colors.black),
                        ),
                        child: Text('product'),
                        onPressed: (){
                          setState(() {
                            index=1;
                          });
                        }),
                  ),
                  SizedBox(width: 1,),
                  Expanded(
                    flex: 1,
                    child: RaisedButton(
                        textColor: Colors.white,
                        color: Colors.blue[700],
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(3),
                          side: BorderSide(color: Colors.black),
                        ),
                        child: Text('parts'),
                        onPressed: (){
                          setState(() {
                            index=0;
                          });
                        }),
                  )
                ],
              ),
              Expanded(child: index == 1 ?
              ProductBody(context): PartsBody(homeContext: context,))
            ],
          ),
        ),
      ),
    );
  }


  Future<void>logout() async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.clear();
    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
  }

  Future<void>getData() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String name1 = sharedPreferences.getString('userName');
    String email1 = sharedPreferences.getString('useremail');
    String uid1=sharedPreferences.getString('uid');
    setState(() {
      name = name1;
      email = email1;
      uid=uid1;

    });
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
    )) ?? false;
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

AppBar MyAppBar(BuildContext context, String uid,String no_of_notification, List<NotificationData> list) {
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



     /* Stack(
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
      ),*/
     // IconButton(icon: Icon(Icons.notifications),onPressed: (){} ),
      SizedBox(width: 15.0)
    ],
  );
}





