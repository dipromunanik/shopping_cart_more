import 'package:flutter/widgets.dart';
import 'package:shopping_cart_more/model/product_model.dart';
import 'package:shopping_cart_more/services/api_service.dart';

class ProductController extends ChangeNotifier{

  var productList = ProductModel();
  bool loader = false;

  ApiService apiService = ApiService();

  void getData() async{
    loader =true;

    var productData= await apiService.getProductDataCalling();

    if(productData !=null){

      productList = productData;
      loader = false;

    }
    notifyListeners();

  }


}