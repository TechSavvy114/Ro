import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return   SafeArea(
      child: Container(
       // height: MediaQuery.of(context).size.height,
        //width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            width: 3.0,
            color: Colors.white
          ),
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.white, Color.fromRGBO(10, 10, 55, 1)])),

        child: Column(
          children:<Widget> [
            Image.asset('assets/ro.jpg',width: 100,height: 100,),
            Text('Just24You', style: TextStyle(fontSize: 20),),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Welcome to Just24You. We are dedicated to giving you the very best of service of your all short of electronics good and applicances,'
                  'along with best price for electronic appliances. Seeing this pandemic we are here to provide you inhouse services.'
                  'Your queries will be resolved within 24 hours, as our name suggest. In case of you feel to get in touch '
                  'kindly connect us on tollfree number given below. \n\nCustomercare Number: 18003098080',style: TextStyle(fontSize: 16,color: Colors.black),),
            ),

          ],

        )
      ),
    );
  }
}
