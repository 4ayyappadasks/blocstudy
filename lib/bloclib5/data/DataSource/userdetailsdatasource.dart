import 'dart:convert';
import 'dart:developer';
import 'package:flutterblocstudey/bloclib5/data/model/userdetailsmodel.dart';
import "package:http/http.dart" as http;

abstract class UserDetailsDataSource{
  Future<UserdetailsModel> FetchdatafromApi();
}
class UserDetailsDataSourceImpl implements UserDetailsDataSource{
  @override
  Future<UserdetailsModel> FetchdatafromApi() async{
    try{
      final response = await http.get(Uri.parse("https://dummyjson.com/c/079d-6abc-47bb-86bd"),
        headers: {
          "Content-Type": "application/json",
        },);
      if(response.statusCode==200)
        {
          log("Response: ${response.body}");
          return UserdetailsModel.fromJson(json.decode(response.body));
        }
      else {
        throw Exception("Failed to load data: ${response.statusCode}");
      }
    }
    catch(e)
    {
      throw Exception("error in api call $e");
    }
  }
}