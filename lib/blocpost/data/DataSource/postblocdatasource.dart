import 'dart:convert';
import 'dart:developer';
import 'package:flutterblocstudey/blocpost/data/Model/postblocmodel.dart';
import 'package:http/http.dart' as http;

abstract class PostblocDataSource {
  Future<PostblocModell> fetchdatafromApi({required int id});
}

class PosrblocDataSourceimpl implements PostblocDataSource {
  @override
  Future<PostblocModell> fetchdatafromApi({required int id}) async {
    try {
      final url = Uri.parse("https://dummyjson.com/posts/$id");
      print("DataSource calling API: $url");
      final response = await http.get(url); // Use GET if POST is not correct
      if (response.statusCode == 200) {
        log("DataSource Response: ${response.body}");
        return PostblocModell.fromJson(json.decode(response.body));
      } else {
        throw Exception("Failed to load data: ${response.statusCode}");
      }
    } catch (e) {
      print("DataSource error: $e");
      throw Exception("Error in API call: $e");
    }
  }
}
