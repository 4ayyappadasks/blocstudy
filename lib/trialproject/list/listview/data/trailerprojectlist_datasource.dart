import 'dart:convert';
import 'dart:developer';

import 'package:flutterblocstudey/trialproject/list/listview/data/trailerprojectlist_model.dart';
import 'package:http/http.dart'as http;

abstract class TrailerprojectlistDatasource {
  Future<Trailerprojectlistmodel> functionforApi();
}

class TrailerprojectlistDatasourceimpl implements TrailerprojectlistDatasource{
  @override
  Future<Trailerprojectlistmodel> functionforApi() async{
    try{
      final response = await http.get(Uri.parse("https://dummyjson.com/posts"),
          headers: {"Content-Type":"application/json"});
      if(response.statusCode==200)
        {
          log("success in response check ${response.statusCode}, response ${response.body}");
          return Trailerprojectlistmodel.fromJson(json.decode(response.body));
        }
      else
        {
          log("error in response check ${response.statusCode},response ${response.body}");
          throw Exception("error in response check ${response.statusCode}");
        }
    }
        catch(e){
      throw Exception("error in try catch $e");
        }
  }
}