import 'package:flutter/material.dart';
import 'package:flutter_ro_test/User/ProductDetails.dart';
import 'package:flutter_ro_test/model/PartsModel.dart';
import 'package:flutter_ro_test/web_services/SignUpService.dart';

class Parts extends StatefulWidget {
  final homeContext;

  const Parts({Key key, this.homeContext}) : super(key: key);
  @override
  _PartsState createState() => _PartsState();
}

class _PartsState extends State<Parts> {
  List<PartsData> partsList;
  List<String> partsImages = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('init state is running ==============================================================================================');
  }

  @override
  Widget build(BuildContext context) {
    print('build state is running ==============================================================================================');
    return Container(
      child: FutureBuilder(
          future: getImages(),
          builder: (context, snapshot) {
            print('===========================================================================================${snapshot.data}');
            return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: GridView.builder(
                      itemCount: partsImages.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                        childAspectRatio: 0.75,
                      ),
                      itemBuilder: (context1, index) {
                        print(snapshot.data[index]);
                        return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  widget.homeContext,
                                  MaterialPageRoute(
                                      builder: (context) => ProductDetails(
                                          partsImages.elementAt(index),
                                          partsList.elementAt(index).partDetail,
                                          partsList.elementAt(index).partName,
                                          partsList.elementAt(index).partPrice,
                                          partsList.elementAt(index).partDiscount,
                                          partsList.elementAt(index).partQuantity,
                                          partsList.elementAt(index).id,
                                  )
                              ));
                            },
                            child:
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              shadowColor: Colors.blueAccent,
                              elevation: 6,
                              child: ClipPath(
                                clipper: ShapeBorderClipper(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15))),
                                child: Container(
                                    height: 180,
                                    decoration: BoxDecoration(
                                      border: Border(
                                          left: BorderSide(color: Colors.blue, width: 15)),
                                      color: Colors.lightBlueAccent[100],
                                    ),
                                    padding: EdgeInsets.all(20.0),
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      children: [
                                        Image.network(
                                          partsImages.elementAt(index),
                                          height: 100,
                                          width: 100,
                                        ),
                                        Text('Product Name: '+partsList.elementAt(index).partName),
                                        Text('Discount:'+partsList.elementAt(index).partDiscount+'%'),
                                        Text('Price: Rs'+partsList.elementAt(index).partPrice),
                                      ],
                                    )),
                              ),
                            )
                        );
                      }),
                ));
          }),
    );
  }

  Future<List<String>> getImages() async {
    await SignUpService().getPart().then((value) {
      partsList = value.partsData;
      print('product list is being fetched===============================================================================');
      partsImages.clear();
    });
    for (int i = 0; i < partsList.length; i++) {
      partsImages.add("https://just24you.com/admin/uploads/parts/" +
          partsList.elementAt(i).partImageFile);
    }
    return partsImages;
  }
}
