import 'package:flutter/material.dart';
import 'package:flutter_ro_test/model/WalletUpdateModel.dart';
import 'package:flutter_ro_test/web_services/SignUpService.dart';

class WalletBalance extends StatefulWidget {

  String id;
  WalletBalance(this.id);

  @override
  _WalletBalanceState createState() => _WalletBalanceState();
}

class _WalletBalanceState extends State<WalletBalance> {
  List<WalletUpdateData>list;
  @override
  void initState() {
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        color: Colors.blue[100],
        child: FutureBuilder(
            future: getWalletUpdate(widget.id),
            builder: (context,snap){
          return snap.connectionState==ConnectionState.waiting ? Center(child: Text('loading ......'),):  Center(child: Text('Your Wallet Balance: \n           Rs '+list.elementAt(0).wallet));
        }),
      ),
    );
  }

  Future<List<WalletUpdateData>> getWalletUpdate(String id)async{
    await SignUpService().getUpdateWallet(id).then((value){
      list=value.walletupdatedata;
    });
  }
}
