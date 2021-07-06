import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'ListViewProductByCategory.dart';
/*
class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<ProductData>productList;
  List<CategoryData>catagoryList;
  List<String>productImage=[];
  @override
  Widget build(BuildContext context) {
    return Container(
      child:getCategory()
    );
  }

  Widget getCategory() {
    return FutureBuilder(
      future: getCategoryData(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return ListView.builder(itemCount: catagoryList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
          return RaisedButton(child: Text(catagoryList.elementAt(index).name),
          onPressed: (){
            //createImage(catagoryList.elementAt(index).id);
            //fetchProduct(catagoryList.elementAt(index).id);
            //new CategoryId(catagoryList.elementAt(index).id);
            new ProductImagePage.name(catagoryList.elementAt(index).id);
          },);
        },);
      },
    );
  }

  Future<List<CategoryData>>getCategoryData()async {
    await SignUpService().getCategories().then((value) {
      print('category is being fetched');
      catagoryList=value.categorydata;
    });
    return catagoryList;
  }

  *//*Future<void> createImage(String id) async{
    FutureBuilder(
      future: fetchProduct(id),
      builder: (context,snapshot){
        return ListView.builder(
            itemCount: productList.length,
            itemBuilder: (context,index){
          return //Image.network("http://api.sallybase.com/ro/uploads/products/"+productList.elementAt(index).proImageFile);
              Image(image: NetworkImage("http://api.sallybase.com/ro/uploads/products/"+productList.elementAt(index).proImageFile));
        });
      },
    );
  }*//*

  Future<List<String>>fetchProduct(String id) async{
    await SignUpService().getProductById(id).then((value) {
      productList=value.productData;
    });
    for(int i=0;i<productList.length;i++){
      productImage.add(productList.elementAt(i).proImageFile);
    }
    return productImage;
  }
}*/
