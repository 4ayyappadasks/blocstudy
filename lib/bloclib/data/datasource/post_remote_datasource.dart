import 'dart:convert';
import 'dart:developer';
import 'package:flutterblocstudey/bloclib/data/model/post_model.dart';
import 'package:http/http.dart' as http;

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getPostFromApi();
}

class PostRemoteDataSourceimpl implements PostRemoteDataSource{
  @override
  Future<List<PostModel>> getPostFromApi() async{
    try{
      final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"),
          headers: {
            "Content-type":"application/json"
          });
      if(response.statusCode ==200)
      {
        log("response : ${response.body}");
        final List<dynamic> responsebody =jsonDecode(response.body);
        final List<PostModel> post = responsebody.map((json)=>PostModel.fromJson(json)).toList();
        return post;
      }
      else
        {
          throw Exception("failed to load data from api");
        }
    }
    catch(e)
    {
      throw Exception("${e}");
    }
  }
}