import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Animation/FadeAnimation.dart';
import 'HomePageUser/MainScreen.dart';
import 'SignupScreen.dart';
import 'vendor/VendorHome.dart';
import 'web_services/SignUpService.dart';
//import 'User/userhome.dart';

void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    )
);

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 1),()=>checkUserLoginState());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/ro.jpg'),
                          fit: BoxFit.fill
                      )
                  ),
                  child: Stack(
                    children: <Widget>[

                      Positioned(
                        child:  Container(
                          margin: EdgeInsets.only(top: 50),
                          child: Center(
                            child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
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
                                controller: nameController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Email or UserID",
                                    hintStyle: TextStyle(color: Colors.grey[400])
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                controller: passwordController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Password",
                                    hintStyle: TextStyle(color: Colors.grey[400])
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),

                      Container(
                        height: 50,
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          gradient: new LinearGradient(
                            colors: [
                              Color.fromRGBO(143, 148, 251, 1),
                              Color.fromRGBO(143, 148, 251, .6),
                            ],

                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            new FlatButton(
                              child: new Text(
                                'USER',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                doLogin(nameController.text,passwordController.text,context);
                              }
                          ),
                            new FlatButton(
                                child: new Text(
                                  'VENDOR',
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {
                                  doLoginAsVendor(nameController.text,passwordController.text,context);
                                }
                            ),],
                        ),
                      ),
                      SizedBox(height: 20,),
                      /*FadeAnimation( 2,Container(
                        height: 50,
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          gradient: new LinearGradient(
                            colors: [
                              Color.fromRGBO(143, 148, 251, 1),
                              Color.fromRGBO(143, 148, 251, .6),
                            ],

                          ),
                        ),
                        child: new FlatButton(
                            child: new Text(
                              'SignUp as User ',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SignupPage()),
                              );
                            }
                        ),
                      ),),*/
                      SizedBox(height: 20),
                      Container(
                        height: 50,
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          gradient: new LinearGradient(
                            colors: [
                              Color.fromRGBO(143, 148, 251, 1),
                              Color.fromRGBO(143, 148, 251, .6),
                            ],

                          ),
                        ),
                        child: new FlatButton(
                            child: new Text(
                              'Not yet Register!! SignUp. ',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SignupScreen()),
                              );
                            }
                        ),
                      ),
                      SizedBox(height: 20),
                      Text("Forgot Password?", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),),

                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }

 Future<void> doLogin(String text, String text2, BuildContext context) async{
    await SignUpService().getLoginData(text, text2).then((value) async {
      SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
      sharedPreferences.setString('uid', value.loginData.elementAt(0).id);
      sharedPreferences.setString('uid1', value.loginData.elementAt(0).uid);
      sharedPreferences.setString('userName', value.loginData.elementAt(0).username);
      sharedPreferences.setString('useremail', value.loginData.elementAt(0).useremail);
      sharedPreferences.setInt('userNumber', int.parse(value.loginData.elementAt(0).usernumber));
      sharedPreferences.setInt('cid', int.parse(value.loginData.elementAt(0).cid));
      sharedPreferences.setInt('sid',int.parse(value.loginData.elementAt(0).sid));
      sharedPreferences.setInt('userpincode', int.parse(value.loginData.elementAt(0).pincode));
      sharedPreferences.setString('userAddress', value.loginData.elementAt(0).useraddress);
      sharedPreferences.setString('userType', 'user');
      print(value.loginData.elementAt(0).id+'\n'+value.loginData.elementAt(0).sid+'\n'+value.loginData.elementAt(0).cid+'\n'+
          value.loginData.elementAt(0).uid+'\n'+value.loginData.elementAt(0).useremail+'\n'+value.loginData.elementAt(0).usernumber+'\n');
      setState(() {
      });
      /*Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainScreenUser()),
      );*/
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => MainScreenUser()));
    });


 }

  Future<void>checkUserLoginState() async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    if(sharedPreferences.getString('userName')!=null){

   /*   Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainScreenUser()),
      );*/
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => MainScreenUser()));

    }else if(sharedPreferences.getString('venName')!=null){

      /*Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainScreenVendor()),
      );*/
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => MainScreenVendor()));
    }
  }

  Future<void> doLoginAsVendor(String text, String text2, BuildContext context) async{
    await SignUpService().getLoginDataForVendor(text, text2).then((value) async {
      SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
      sharedPreferences.setString('vid', value.vendorLoginData.elementAt(0).id);
      sharedPreferences.setString('venid', value.vendorLoginData.elementAt(0).venId);
      sharedPreferences.setString('venName', value.vendorLoginData.elementAt(0).name);
      sharedPreferences.setString('venEmail', value.vendorLoginData.elementAt(0).email);
      sharedPreferences.setInt('venNumber', int.parse(value.vendorLoginData.elementAt(0).phone));
      sharedPreferences.setInt('venCid', int.parse(value.vendorLoginData.elementAt(0).cid));
      sharedPreferences.setInt('venSid',int.parse(value.vendorLoginData.elementAt(0).sid));
      sharedPreferences.setInt('venPin', int.parse(value.vendorLoginData.elementAt(0).pincode));
      sharedPreferences.setString('venAddress', value.vendorLoginData.elementAt(0).address);
      sharedPreferences.setString('wallet', value.vendorLoginData.elementAt(0).wallet);
      sharedPreferences.setString('userType', 'vendor');
      setState(() {
      });
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => MainScreenVendor()));
    });
  }
}