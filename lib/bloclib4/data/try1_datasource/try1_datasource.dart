import 'dart:convert';
import 'dart:developer';

import 'package:flutterblocstudey/bloclib4/data/try1_model/try1_model.dart';
import "package:http/http.dart" as http;

abstract class Try1DataSource {
  Future<Try1Model> FetchdatafromApi();
}

class Try1DataSourceimpl implements Try1DataSource {
  @override
  Future<Try1Model> FetchdatafromApi() async {
    try {
      final response = await http.get(
        Uri.parse("https://dummyjson.com/c/7fe7-a3d6-4ac4-a8c7"),
        headers: {
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        log("Response: ${response.body}");
        final jsonData = json.decode(response.body);
        return Try1Model.fromJson(jsonData);
      } else {
        throw Exception("Failed to load data: ${response.statusCode}");
      }
    } catch (e) {
      log("Error in data source: $e");
      throw Exception("Error from data source: $e");
    }
  }
}
