import 'package:flutter/material.dart';
import 'package:news_app_model/model/bookmark_model.dart';
import 'package:sqflite/sqflite.dart';

class BookmarkScreenController with ChangeNotifier {
  List<BookmarkModel> bookmarkedNews = [];
  static late Database database;
  bool isLoading = false;
  Future<void> initDatabase() async {
    database = await openDatabase("bookmarkdb.db", version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
        "CREATE TABLE Bookmarks (id INTEGER PRIMARY KEY, title TEXT, author TEXT, description TEXT, content TEXT, source TEXT, siteUrl TEXT, url TEXT, publisheAt TEXT)",
      );
    });
  }

  Future<void> addToBookmark(BookmarkModel article) async {
    await database.insert(
      "Bookmarks",
      {
        "title": article.title,
        "author": article.author,
        "description": article.description,
        "content": article.content,
        "source": article.source,
        "siteUrl": article.url,
        "url": article.urlToImage,
        "publishedAt": article.publishedAt,
      },
    );
  }

  Future<void> getBookmarkList() async {
    isLoading = true;
    notifyListeners();
    List<Map> list = await database.rawQuery('SELECT * FROM Bookmarks');
    bookmarkedNews = [];
    for (int i = 0; i < list.length; i++) {
      bookmarkedNews.add(
        BookmarkModel(
          id: list[i]["id"],
          title: list[i]["title"],
          author: list[i]["author"],
          description: list[i]["description"],
          content: list[i]["content"],
          source: list[i]["source"],
          url: list[i]["siteUrl"],
          urlToImage: list[i]["url"],
          publishedAt: list[i]["publishedAt"],
        ),
      );
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> deleteBookmark(var id) async {
    await database.rawDelete('DELETE FROM Bookmarks WHERE id = ?', [id]);
    getBookmarkList();
  }
}
