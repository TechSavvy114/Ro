import 'package:flutter/material.dart';
import 'package:flutter_ro_test/model/OfferScreenModel.dart';
import 'package:flutter_ro_test/web_services/SignUpService.dart';

class OfferScreen extends StatefulWidget {
  @override
  _OfferScreenState createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  List<OfferData> offerdata;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Latest Offer'),),
      body: FutureBuilder(
        future: getOffers(),
        builder: (context,snap){
          return
            snap.connectionState==ConnectionState.waiting ? Center(child: Text('loading ....')):
            ListView.builder(
            itemCount: offerdata.length,
            itemBuilder: (BuildContext context,int index){
              return Card(
                elevation: 1.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    )
                ),
                color: Colors.green[100],
                child: Column(
                  children: [
                    Image.network(
                      'https://just24you.com/ro/uploads/offers/'+ offerdata.elementAt(index).image,
                      height: 200,
                      width: 500,
                    ),
                    Text('Offer No: '+offerdata.elementAt(index).id),
                    Text('Title:'+offerdata.elementAt(index).title),
                    Text('Detail: '+offerdata.elementAt(index).details),
                  ],
                )
              );
            },
          );
        },
      ),
    );
  }

  Future<List<OfferData>> getOffers() async{
    await SignUpService().getOffer().then((value) {
      offerdata= value.offerData;
    });
  }
}
