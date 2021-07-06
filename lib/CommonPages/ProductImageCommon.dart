import 'package:flutter/material.dart';
import 'package:flutter_ro_test/model/ProductModel.dart';
import 'package:flutter_ro_test/web_services/SignUpService.dart';

class ProductImagePage extends StatefulWidget {
  String _id;
  ProductImagePage();

  ProductImagePage.name(this._id);

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
    return Container(
      child: FutureBuilder(
          future: getImages(widget._id),
          builder: (context, snapshot) {
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
                              /*Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductDetails(
                                          productImage.elementAt(index),
                                          productList.elementAt(index).proDetail,
                                          productList.elementAt(index).proName,
                                          productList.elementAt(index).proPrice,
                                          productList.elementAt(index).proDiscount)));*/
                            },
                            child: Card(
                                child: Column(children: [
                                  Image.network(
                                    productImage.elementAt(index),
                                    height: 100,
                                    width: 100,
                                  ),
                                  Text(productList.elementAt(index).proName),
                                  Text(productList.elementAt(index).proDiscount),
                                ])));
                      }),
                ));
          }),
    );
  }

  Future<List<String>> getImages(String id) async {
    await SignUpService().getProductById(id).then((value) {
      productList = value.productData;
      print('product list is being fetched');
      productImage.clear();
    });
    for (int i = 0; i < productList.length; i++) {
      productImage.add("https://just24you.com/admin/uploads/products/" +
          productList.elementAt(i).proImageFile);
    }
    return productImage;
  }
}