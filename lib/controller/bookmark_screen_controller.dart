import 'package:flutter/material.dart';
import 'package:news_app_model/model/bookmark_model.dart';

class BookmarkScreenController with ChangeNotifier {
  List<BookmarkModel> bookmarkedNews = [];
  Future<void> initDatabase() async {}
  Future<void> addToBookmark() async {}
  void getBookmarkList() {}
  Future<void> deleteBookmark() async {}
}
