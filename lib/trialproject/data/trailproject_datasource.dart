import 'dart:convert';

import 'package:flutterblocstudey/trialproject/data/trailproject_model.dart';
import "package:http/http.dart" as http;

abstract class Trialprojectdatasource {
  Future<Trialprojectmodel> functionforapicall();
}

class Trialprojectdatasourceimpl implements Trialprojectdatasource{
  @override
  Future<Trialprojectmodel> functionforapicall() async{
    try{
      final response = await http.post(Uri.parse("https://dummyjson.com/posts/add"),
      headers: {
        "Content-Type":"application/json"
      },
      body: jsonEncode({
        "title":"trial",
        "userId":5
      }));
      if(response.statusCode==201)
        {
          return Trialprojectmodel.fromJson(json.decode(response.body));
        }
      else{
        throw Exception("response status code : ${response.statusCode} , with response : ${response.body}");
      }
    }catch(e){
      throw Exception("error in api call : ${e.toString()}");
    }
  }
}