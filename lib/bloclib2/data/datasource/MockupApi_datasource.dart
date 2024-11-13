import 'dart:convert';
import 'dart:developer';

import 'package:flutterblocstudey/bloclib2/data/model/MockApi_model.dart';
import "package:http/http.dart" as http;

abstract class MockupApiDatasource {
  Future<List<MockApiModel>> GetdatafromAPi();
}

class MockupApiDatSourceimpl implements MockupApiDatasource {
  @override
  Future<List<MockApiModel>> GetdatafromAPi() async {
    try {
      final response = await http.get(
          Uri.parse(
              "https://673335102a1b1a4ae1128b30.mockapi.io/auxzon/v1/user"),
          headers: {"Content-type": "application/json"});
      if (response.statusCode == 200) {
        log("response : ${response.body}");
        final List<dynamic> Jsondecoded = jsonDecode(response.body);
        final List<MockApiModel> Dataconverted =
            Jsondecoded.map((e) => MockApiModel.fromJson(e)).toList();
        return Dataconverted;
      } else {
        throw Exception("error in api : ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("error is : ${e}");
    }
  }
}
