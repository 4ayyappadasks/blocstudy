import 'dart:convert';
import 'dart:developer';

import 'package:flutterblocstudey/trialproject/list/bottomfield/data/trailproject_model.dart';
import 'package:flutterblocstudey/trialproject/list/listview/application/bloc/trailerprojectlist_bloc.dart';
import "package:http/http.dart" as http;

abstract class Trialprojectdatasource {
  Future<Trialprojectmodel> functionforapicall({required String message});
}

class Trialprojectdatasourceimpl implements Trialprojectdatasource{
  @override
  Future<Trialprojectmodel> functionforapicall({required String message}) async{
    try{
      final response = await http.post(Uri.parse("https://dummyjson.com/posts/add"),
      headers: {
        "Content-Type":"application/json"
      },
      body: jsonEncode({
        "title":message,
        "userId":5
      }));
      if(response.statusCode==201)
        {
          log("success response status code : ${response.statusCode} , with response : ${response.body}");
          return Trialprojectmodel.fromJson(json.decode(response.body));
        }
      else
      {
        log("error response status code : ${response.statusCode} , with response : ${response.body}");
        throw Exception("response status code : ${response.statusCode} , with response : ${response.body}");
      }
    }catch(e){
      throw Exception("error in api call : ${e.toString()}");
    }
  }
}