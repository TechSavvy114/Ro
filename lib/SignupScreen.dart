import 'package:flutter/material.dart';
import 'package:flutter_ro_test/signupVendor.dart';

import 'SignUp.dart';


class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: true,
                pinned: true,
                snap: true,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text("SignUp",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        )),
                    background: Image.asset('assets/ro.jpg',fit: BoxFit.fill,),),
                bottom: TabBar(
                  labelColor: Colors.black87,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    new Tab(icon: new Icon(Icons.perm_identity), text: "User"),
                    new Tab(icon: new Icon(Icons.perm_identity), text: "Vendor"),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              SignupPage(),
              SignupVendor()
            ],
          )
        ),
      ),
    );
  }
}