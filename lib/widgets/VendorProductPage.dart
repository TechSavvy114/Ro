/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ro_servicing/model/CategoryModel.dart';
import 'package:ro_servicing/model/ProductModel.dart';
import 'package:ro_servicing/viewModel/Categories.dart';
import 'package:ro_servicing/web_services/SignUpService.dart';

import 'ListViewProductByCategory.dart';

class VendorProductPage extends StatefulWidget {
  @override
  _VendorProductPageState createState() => _VendorProductPageState();
}

class _VendorProductPageState extends State<VendorProductPage> {
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
      ),
    );
  }

  Future<List<CategoryData>>getCategoryData()async {
    await SignUpService().getCategories().then((value) {
      print('category is being fetched');
      catagoryList=value.categorydata;
    });
    return catagoryList;
  }
}
*/
