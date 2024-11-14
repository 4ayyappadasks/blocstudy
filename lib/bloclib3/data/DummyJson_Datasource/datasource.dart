import 'dart:convert';
import 'dart:developer';

import 'package:flutterblocstudey/bloclib3/data/DummyJson_Model/model.dart';
import 'package:flutterblocstudey/bloclib3/domain/DummyJson_Entity/enitity.dart';
import "package:http/http.dart" as http;

abstract class DummyJsonDataSource {
  Future<DummyJsonEntity> getDataFromApi();
}

class DummyJsonDataSourceImpl extends DummyJsonDataSource {
  @override
  Future<DummyJsonEntity> getDataFromApi() async {
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
        return DummyJsonModel.fromJson(jsonData);
      } else {
        throw Exception("Failed to load data: ${response.statusCode}");
      }
    } catch (e) {
      log("Error in data source: $e");
      throw Exception("Error from data source: $e");
    }
  }
}
