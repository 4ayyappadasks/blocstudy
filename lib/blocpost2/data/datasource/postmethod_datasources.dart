import 'dart:convert';
import 'dart:developer';
import 'package:flutterblocstudey/blocpost2/data/model/postmethod_model.dart';
import 'package:http/http.dart' as http;

abstract class Postmethoddatasource {
  Future<Postmethodmodel> fethcdataromApi({required String tittle});
}

class Postmethoddatasouceimpl implements Postmethoddatasource {


  @override
  Future<Postmethodmodel> fethcdataromApi({required String tittle}) async {
    try {
      final response = await http.post(
        Uri.parse("https://dummyjson.com/posts/add"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "title": tittle.toString(),
          "userId": 5
        }),
      );
      log("response : ${response.body}");
      if (response.statusCode == 201) {
        return Postmethodmodel.fromJson(json.decode(response.body));
      }
      else {
        throw Exception("error with status code : ${response
            .statusCode},response : ${response.body}");
      }
    } catch (e) {
      throw Exception("error in api call : $e");
    }
  }
}