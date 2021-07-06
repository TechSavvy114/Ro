import 'package:flutter/material.dart';
import 'package:flutter_ro_test/User/ProductDetails.dart';
import 'package:flutter_ro_test/model/ProductModel.dart';
import 'package:flutter_ro_test/web_services/SignUpService.dart';

class ProductImagePage extends StatefulWidget {
  String _id;
  BuildContext homeContext;

  ProductImagePage();

  ProductImagePage.name(this._id, this.homeContext);

  @override
  _ProductImagePageState createState() => _ProductImagePageState();
}

class _ProductImagePageState extends State<ProductImagePage> {
  List<ProductData> productList;
  List<String> productImage = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('${widget._id} =====================================================================');
    return Container(
      child: FutureBuilder(
          future: getImages(widget._id),
          builder: (context, snapshot) {
            print('product list is being fetched ===========================================================${snapshot.data}');
            return Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: GridView.builder(
                  itemCount: productImage.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          print(productList.elementAt(index).proQuantity);
                          Navigator.push(
                              widget.homeContext,
                              MaterialPageRoute(
                                  builder: (context) => ProductDetails(
                                      productImage.elementAt(index),
                                      productList.elementAt(index).proDetail,
                                      productList.elementAt(index).proName,
                                      productList.elementAt(index).proPrice,
                                      productList.elementAt(index).proDiscount,
                                      productList.elementAt(index).id,
                                      productList
                                          .elementAt(index)
                                          .proQuantity)));
                        },
                        child: Card(
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
                                      productImage.elementAt(index),
                                      height: 100,
                                      width: 100,
                                    ),
                                    Text(productList.elementAt(index).proName),
                                    Text('Discount:'+productList.elementAt(index).proDiscount+'%'),
                                    Text('Price: Rs'+productList.elementAt(index).proPrice),
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

  Future<List<String>> getImages(String id) async {
    print('getting wiget id $id');
    await SignUpService().getProductById(id).then((value) {
      productList = value.productData;
      print('product list is being fetched ===========================================================${productList.toString()}');
      productImage.clear();
    });
    for (int i = 0; i < productList.length; i++) {
      productImage.add("https://just24you.com/admin/uploads/products/" +
          productList.elementAt(i).proImageFile);
    }
    return productImage;
  }
}
