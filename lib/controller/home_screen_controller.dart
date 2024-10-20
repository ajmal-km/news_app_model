import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:news_app_model/model/trending_headlines_model.dart';
import 'package:news_app_model/view/notifications_screen/notifications_screen.dart';
import 'package:news_app_model/view/trending_news_screen/trending_news_screen.dart';

class HomeScreenController with ChangeNotifier {
  TrendingHeadlinesModel? trendingNewsModel;
  TrendingHeadlinesModel? categorizedNews;
  bool isLoading = false;
  bool isCategoryLoading = false;
  List<Article> articles = [];
  List<Article> categorizedArticles = [];
  int categoryIndex = 0;
  List<String> categories = [
    "All",
    "Business",
    "Entertainment",
    "General",
    "Health",
    "Science",
    "Sports",
    "Technology",
  ];

  Future<void> getCategorizedNews(String category) async {
    isCategoryLoading = true;
    notifyListeners();
    try {
      final url = Uri.parse(
          "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=5e4535981a3640e0b6e16c70f325644e");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        categorizedNews = trendingHeadlinesModelFromJson(response.body);
      }
      if (categorizedNews != null) {
        categorizedArticles = categorizedNews?.articles ?? [];
      }
    } catch (e) {
      print(e);
    }
    isCategoryLoading = false;
    notifyListeners();
  }

  Future<void> getTrendingNews({bool categoryTapped = false}) async {
    if (categoryTapped == true) {
      isCategoryLoading = true;
      notifyListeners();
    } else {
      isLoading = true;
      notifyListeners();
    }
    try {
      final url = Uri.parse(
          "https://newsapi.org/v2/top-headlines?country=us&apiKey=5e4535981a3640e0b6e16c70f325644e");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        trendingNewsModel = trendingHeadlinesModelFromJson(response.body);
      }
      if (trendingNewsModel != null) {
        articles = trendingNewsModel?.articles ?? [];
      }
    } catch (e) {
      print(e);
    }
    if (categoryTapped == true) {
      isCategoryLoading = false;
      notifyListeners();
    } else {
      isLoading = false;
      notifyListeners();
    }
  }

  void setCategoryIndex(int index) {
    categoryIndex = index;
    notifyListeners();
    if (categoryIndex == 0) {
      getTrendingNews(categoryTapped: true);
    } else {
      getCategorizedNews(categories[categoryIndex]);
    }
  }

  String formatDateTime(var dateTime) {
    return DateFormat.yMd().add_jm().format(dateTime);
  }

  void navigateToNotifications(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NotificationsScreen(),
      ),
    );
  }

  void navigateToTrendingNews(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TrendingNewsScreen(),
      ),
    );
  }
}
