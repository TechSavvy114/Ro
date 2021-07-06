import 'package:flutter/material.dart';
import 'package:flutter_ro_test/web_services/SignUpService.dart';

import 'LeadComplete.dart';


class OTPScreen extends StatefulWidget {
  String id,vid;

  OTPScreen(this.id,this.vid);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: TextField(
                  controller: otpController,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.content_paste),
                    border: InputBorder.none,
                    hintText: 'Enter your otp here',
                    labelText: 'OTP',
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    border: Border.all(width: 1.0, color: Colors.blue)),
              ),
            ),
            SizedBox(height: 20),
            RaisedButton(
              color: Colors.blue,
              splashColor: Colors.white,
                child: Text('Verify',style: TextStyle(fontSize: 18,color: Colors.white),),
                onPressed: (){
                SignUpService().getVerified(otpController.text.toString(), widget.id,widget.vid,'ongoing').then((value) {
                  if (value.result=="Verification Code Has Been Matched"){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LeadComplete(widget.vid,widget.id)));
                  }
                  print(value.result);
                });
            })
          ],
        ),
      ),
    );
  }
}
