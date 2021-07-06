

import 'package:flutter_ro_test/model/CategoryModel.dart';
import 'package:flutter_ro_test/web_services/SignUpService.dart';

class CategoryViewModel {
  List<CategoryData>categoryList;

  Future<List<CategoryData>> getCategory()async{
    await SignUpService().getCategories().then((value){
      categoryList=value.categorydata;
      print(value.result);
    });

    return categoryList;
  }
}