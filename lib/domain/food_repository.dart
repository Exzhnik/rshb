import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:rshb/model/list_food.dart';
import 'package:rshb/config/strings.dart' as s;

class FoodRepository {
  Future<ListFood> listFoodApi() async {
    var _dio = Dio();

    try {
      var response = await _dio.get(s.url);
      return compute(parseCatalog, response.data as String);
    } on DioError catch (e) {
      return Future.error(e);
    }
  }
}

ListFood parseCatalog(String responseBody) {
  return ListFood.fromJson(jsonDecode(responseBody) as Map<String, dynamic>);
}
