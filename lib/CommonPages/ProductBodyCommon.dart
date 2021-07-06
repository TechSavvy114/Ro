 /*import 'package:flutter/material.dart';
import 'package:ro_servicing/Sample.dart';
import 'package:ro_servicing/model/CategoryModel.dart';
import 'package:ro_servicing/model/ProductModel.dart';
import 'package:ro_servicing/viewModel/Categories.dart';
import 'package:ro_servicing/web_services/SignUpService.dart';
import 'package:ro_servicing/widgets/ListViewProductByCategory.dart';

class ProductBody extends StatefulWidget {

  ProductBody();

  @override
  _ProductBodyState createState() => _ProductBodyState();
}

class _ProductBodyState extends State<ProductBody> {
  CategoryViewModel categoryViewModel=CategoryViewModel();
  List<CategoryData>catagoryList;
  List<ProductData>productList;
  List<String>productImage=[];

  String cat_id="3";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            height: 50,
            child:FutureBuilder(
              future: getCategoryData(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if(snapshot.connectionState==ConnectionState.waiting){
                  return Text('Loading ........');
                }
                return ListView.builder(itemCount: catagoryList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    return RaisedButton(child: Text(catagoryList.elementAt(index).name),
                      onPressed: (){
                        setState(() {
                          cat_id=catagoryList.elementAt(index).id;
                        });
                        //new ProductImagePage.name(catagoryList.elementAt(index).id);
                      },);
                  },);
              },
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: ProductImagePage.name(cat_id),
              //createImage(),
            ),
          ),
          SizedBox(height: 10),
        ],
      )
    );

  }
  Future<List<CategoryData>>getCategoryData()async {
    await SignUpService().getCategories().then((value) {
      print('category is being fetched');
      catagoryList=value.categorydata;
    });
    return catagoryList;
  }
}*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ro_test/model/ProductModel.dart';
import 'package:flutter_ro_test/web_services/SignUpService.dart';


import 'ProductImageCommon.dart';

/*class Products {
  //BuildContext context;

  //Products(this.context);

  CategoryViewModel categoryViewModel = CategoryViewModel();
  List<CategoryData> catagoryList;
  List<ProductData> productList;
  List<String> productImage = [];

  Widget getProducts() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 15, right: 15),
          height: 50,
          child: FutureBuilder(
            future: getCategoryData(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text('Loading ........');
              }
              return ListView.builder(
                itemCount: catagoryList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return RaisedButton(
                    child: Text(catagoryList.elementAt(index).name),
                    onPressed: () {
                      //getImage(catagoryList.elementAt(index).id,context);
                      //GetProductImage().getImages(catagoryList.elementAt(index).id);
                    },
                  );
                },
              );
            },
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Future<List<CategoryData>> getCategoryData() async {
    await SignUpService().getCategories().then((value) {
      print('category is being fetched');
      catagoryList = value.categorydata;
    });
    return catagoryList;
  }

  *//* Widget getImage(String index1,BuildContext context) {
    @override
    Widget build(context) {
      return Container(
        child: FutureBuilder(
            future: getImages(index1),
            builder: (context, snapshot) {
              return Padding(
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductDetails(
                                        productImage.elementAt(index),
                                        productList.elementAt(index).proDetail,
                                        productList.elementAt(index).proName,
                                        productList.elementAt(index).proPrice,
                                        productList.elementAt(index).proDiscount)));
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
              );
            }),
      );
    }

    *//**//*return Container(
      child: FutureBuilder(
          future: getImages(index1),
          builder: (context, snapshot) {
            return Padding(
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductDetails(
                                      productImage.elementAt(index),
                                      productList.elementAt(index).proDetail,
                                      productList.elementAt(index).proName,
                                      productList.elementAt(index).proPrice,
                                      productList.elementAt(index).proDiscount)));
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
            );
          }),
    );*//**//*
  }
  Future<List<String>> getImages(String id) async {
    await SignUpService().getProductById(id).then((value) {
      productList = value.productData;
      print('product list is being fetched');
      productImage.clear();
    });
    for (int i = 0; i < productList.length; i++) {
      productImage.add("https://api.sallybase.com/ro/uploads/products/" +
          productList.elementAt(i).proImageFile);
    }
    return productImage;
  }*//*
}*/

class GetProductImage{

  List<ProductData> productList;
  List<String> productImage = [];

  Widget getImage(String index1) {
    return Container(
        child: FutureBuilder(
            future: getImages(index1),
            builder: (context, snapshot) {
              return Padding(
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
              );
            }),
      );

    /*return Container(
      child: FutureBuilder(
          future: getImages(index1),
          builder: (context, snapshot) {
            return Padding(
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductDetails(
                                      productImage.elementAt(index),
                                      productList.elementAt(index).proDetail,
                                      productList.elementAt(index).proName,
                                      productList.elementAt(index).proPrice,
                                      productList.elementAt(index).proDiscount)));
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
            );
          }),
    );*/
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
