import 'package:flutter/material.dart';
import 'package:news_app_model/view/bookmark_screen/bookmark_screen.dart';
import 'package:news_app_model/view/home_screen/home_screen.dart';
import 'package:news_app_model/view/profile_screen/profile_screen.dart';
import 'package:news_app_model/view/search_screen/search_screen.dart';

class BottomNavBarController with ChangeNotifier {
  int currentScreenIndex = 0;
  List screens = [
    HomeScreen(),
    SearchScreen(),
    BookmarkScreen(),
    ProfileScreen(),
  ];

  void setCurrentIndex(int value) {
    currentScreenIndex = value;
    notifyListeners();
  }
}
