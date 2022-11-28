import 'package:http/http.dart';
import 'package:shopping_cart_more/model/product_model.dart';

class ApiService{

 String url = 'https://univarselfood.etrackersolution.com/api/frontend/popular/product/list/1';


 Future<ProductModel?> getProductDataCalling() async{

   Response response =await get(Uri.parse(url));

   if(response.statusCode==200){

     return productModelFromJson(response.body);
   }
   else{
     throw Exception(response.reasonPhrase);

   }

 }

}