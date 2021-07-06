import 'package:flutter/material.dart';
import 'package:flutter_ro_test/model/CategoryModel.dart';
import 'package:flutter_ro_test/model/ProductModel.dart';
import 'package:flutter_ro_test/viewModel/Categories.dart';
import 'package:flutter_ro_test/web_services/SignUpService.dart';
import 'package:flutter_ro_test/widgets/ListViewProductByCategory.dart';


class ProductBody extends StatefulWidget {
  final homeContext;

  ProductBody(this.homeContext);

  @override
  _ProductBodyState createState() => _ProductBodyState();
}

class _ProductBodyState extends State<ProductBody> {
  CategoryViewModel categoryViewModel=CategoryViewModel();
  List<CategoryData>catagoryList;
  List<ProductData>productList;
  List<String>productImage=[];

  String cat_id="7";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 5,),
          Container(
            padding: EdgeInsets.only(left: 5, right: 5),
            height: 40,
            child:FutureBuilder(
              future: getCategoryData(),
              builder: (BuildContext context1, AsyncSnapshot<dynamic> snapshot) {
                if(snapshot.connectionState==ConnectionState.waiting){
                  return Text('Loading ........');
                }
                return ListView.builder(itemCount: catagoryList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context2,index){
                    return RaisedButton(child: Text(catagoryList.elementAt(index).name),
                      textColor: Colors.white,
                      color: Colors.blue[500],
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(3),
                        side: BorderSide(color: Colors.black),
                      ),
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
            height: 15,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: ProductImagePage.name(cat_id,widget.homeContext),
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
}
