import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:news_app_model/model/news_model.dart';

class TrendingNewsController with ChangeNotifier {
  NewsModel? trendingNewsModel;
  bool isLoading = false;
  List<Article> articles = [];

  Future<void> getTrendNews() async {
    isLoading = true;
    notifyListeners();
    try {
      final url = Uri.parse(
          "https://newsapi.org/v2/top-headlines?country=us&apiKey=5e4535981a3640e0b6e16c70f325644e");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        trendingNewsModel = newsModelFromJson(response.body);
      }
      if (trendingNewsModel != null) {
        articles = trendingNewsModel?.articles ?? [];
      }
    } catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }

  String formatDateTime(var dateTime) {
    String date = DateFormat.yMd().add_jm().format(dateTime);
    return date;
  }
}
