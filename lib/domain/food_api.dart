import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:rshb/model/list_food.dart';

class FoodApi {
  static Future<ListFood> listFood() async {
    var dio = Dio();

    var url = 'https://www.dropbox.com/s/rp9eu1rnq1ts4y7/example.json?raw=1';
    try {
      var response = await dio.get(url);
      var map = ListFood.fromJson(
          jsonDecode(response.data as String) as Map<String, dynamic>);
      print(response.data);
      return map;
    } on DioError catch (e) {
      if (e.response != null) {
        if (e.response.statusCode == 404) return Future.error('not_found');
      }
      print(e.error);
      return Future.error(Error());
    }
  }
}
