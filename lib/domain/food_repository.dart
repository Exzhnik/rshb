import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:rshb/model/list_food.dart';

class FoodRepository {
  Future<ListFood> listFoodApi() async {
    var _dio = Dio();
    const url = 'https://www.dropbox.com/s/rp9eu1rnq1ts4y7/example.json?raw=1';
    try {
      var response = await _dio.get(url);
      return compute(parseCatalog, response.data as String);
    } on DioError catch (e) {
      return Future.error(e);
    }
  }
}

ListFood parseCatalog(String responseBody) {
  return ListFood.fromJson(jsonDecode(responseBody) as Map<String, dynamic>);
}
