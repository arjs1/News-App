import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/features/news/model/news_model/news_model.dart';
import 'package:http/http.dart' as http;

class Api {
  Api._sumanConstructor();

  static final Api _api = Api._sumanConstructor();

  factory Api() {
    return _api;
  }

  final String url =
      "https://saurav.tech/NewsAPI/top-headlines/category/health/in.json";

  Future<List<NewsModel>?> fetchNews() async {
    final response = await http.get(Uri.parse(url));
    try {
      if (response.statusCode == 200) {
        Map newsData = jsonDecode(response.body);
        List newsList = newsData['articles'];
        return newsList.map((e) => NewsModel.fromJson(e)).toList();
      } else {
        throw Exception();
      }
    } catch (e) {
      debugPrint("Exception caught $e");
    }
    return null;
  }
}
