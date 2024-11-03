import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:news_app_model/model/news_model.dart';
import 'package:news_app_model/model/source_model.dart';

class SearchScreenController with ChangeNotifier {
  SourceModel? sourceModel;
  List<Sources> sourcesList = [];
  NewsModel? popularNewsModel;
  List<Article> popularNewsList = [];
  bool seeAll = false;
  int sourceIndex = 0;
  List<String> sourceCategory = [
    "All",
    "Health",
    "Science",
    "Sports",
    "Technology",
    "Business",
    "General",
    "Entertainment",
  ];
  NewsModel? newsSearchModel;
  List<Article> newsArticles = [];
  bool isSearchLoading = false;
  bool isPopularLoading = false;
  bool isSourcesLoading = false;

  void setSearchListNull() {
    isSearchLoading = true;
    notifyListeners();
    newsSearchModel = null;
    isSearchLoading = false;
    notifyListeners();
  }

  void setSourceCateogry(int index) {
    sourceIndex = index;
    notifyListeners();
    if (sourceIndex == 0) {
      getAllSources();
    } else {
      getCategorizedSources(sourceCategory[sourceIndex]);
    }
  }

  Future<void> getPopularNews() async {
    isPopularLoading = true;
    notifyListeners();
    try {
      final url = Uri.parse(
          "https://newsapi.org/v2/top-headlines?country=us&sortBy=popularity&apiKey=5e4535981a3640e0b6e16c70f325644e");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        popularNewsModel = newsModelFromJson(response.body);
        if (popularNewsModel != null) {
          popularNewsList = popularNewsModel?.articles ?? [];
        }
      }
    } catch (e) {
      print(e);
    }
    isPopularLoading = false;
    notifyListeners();
  }

  Future<void> getCategorizedSources(String category) async {
    isSourcesLoading = true;
    notifyListeners();
    try {
      final url = Uri.parse(
          "https://newsapi.org/v2/top-headlines/sources?country=us&category=$category&apiKey=5e4535981a3640e0b6e16c70f325644e");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        sourceModel = sourceModelFromJson(response.body);
        if (sourceModel != null) {
          sourcesList = sourceModel?.sources ?? [];
        }
      }
    } catch (e) {
      print(e);
    }
    isSourcesLoading = false;
    notifyListeners();
  }

  Future<void> getAllSources() async {
    isSourcesLoading = true;
    notifyListeners();
    try {
      final url = Uri.parse(
          "https://newsapi.org/v2/top-headlines/sources?country=us&apiKey=5e4535981a3640e0b6e16c70f325644e");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        sourceModel = sourceModelFromJson(response.body);
      }
      if (sourceModel != null) {
        sourcesList = sourceModel?.sources ?? [];
      }
    } catch (e) {
      print(e);
    }
    isSourcesLoading = false;
    notifyListeners();
  }

  Future<void> onSearch(String keyword) async {
    isSearchLoading = true;
    notifyListeners();
    try {
      final url = Uri.parse(
          "https://newsapi.org/v2/everything?q=$keyword&apiKey=5e4535981a3640e0b6e16c70f325644e");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        newsSearchModel = newsModelFromJson(response.body);
      }
      if (newsSearchModel != null) {
        newsArticles = newsSearchModel!.articles ?? [];
      }
    } catch (e) {
      print(e);
    }
    isSearchLoading = false;
    notifyListeners();
  }

  void seeAllSources() {
    seeAll = !seeAll;
    notifyListeners();
  }

  String formatDateTime(var dateTime) {
    String date = DateFormat.yMd().add_jm().format(dateTime);
    return date;
  }
}
