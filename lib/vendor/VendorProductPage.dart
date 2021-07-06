import 'package:flutter/material.dart';
import 'package:flutter_ro_test/HomePageUser/PartsBody.dart';
import 'package:flutter_ro_test/HomePageUser/ProductBody.dart';


class VendorProductPartsPage extends StatelessWidget {
  int index;

  VendorProductPartsPage(this.index);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Product Page'),
        ),
        body: Center(
          child: Container(
            child: index==0 ? ProductBody(context) : PartsBody(),
          ),
        ),
      ),
    );
  }
}
