import 'dart:convert';
import 'dart:developer';

import 'package:flutterblocstudey/blocpost2/data/model/getmethod_model.dart';
import 'package:http/http.dart' as http;

abstract class GetmethodDataSource{
  Future<Getmethodmodel> GetipostApi();
}
class GetmehodDataSourceImpl implements GetmethodDataSource{
  @override
  Future<Getmethodmodel> GetipostApi() async{
    try{
      var response = await http.get(Uri.parse("https://dummyjson.com/posts"),
          headers: {"Content-Type":"application/json"});
      if(response.statusCode==200)
      {
        log("response : ${response.body}");
        return Getmethodmodel.fromJson(json.decode(response.body));

      }
      else
        {
          throw Exception("error in response status code : ${response.body}");
        }
    }catch(e){
      throw Exception("error in try-catch : $e");
    }
  }
  
}