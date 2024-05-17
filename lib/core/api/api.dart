import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/core/api/api_model.dart';
import 'package:http/http.dart' as http;

class Api {
  final String url =
      "https://saurav.tech/NewsAPI/top-headlines/category/health/in.json";

  Future<List<ApiModel>?> fetchNews() async {
    final response = await http.get(Uri.parse("$url"));
    try {
      if (response.statusCode == 200) {
        List newsList = jsonDecode(response.body);
        return newsList.map((e) => ApiModel.fromJson(e)).toList();
      } else {
        throw Exception();
      }
    } catch (e) {
      debugPrint("Exception caught $e");
    }
    return null;
  }
}
