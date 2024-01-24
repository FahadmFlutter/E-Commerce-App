import 'dart:convert';

import 'package:http/http.dart';
import 'package:product/Repository/Api/api_client.dart';

import '../../Model_class/ProductModel.dart';

class ProductApi{
  ApiClient apiClient= ApiClient();
  Future<ProductModel>getProduct({required String Product})async{
    String path  = 'https://real-time-product-search.p.rapidapi.com/search?q=${Product} shoes&country=us&language=en';
    var body={};
    Response response = await apiClient.invokeAPI(path, 'GET', body);
    return ProductModel.fromJson(jsonDecode(response.body));
  }
}