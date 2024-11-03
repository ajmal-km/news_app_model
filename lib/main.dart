import 'package:flutter/material.dart';
import 'package:news_app_model/controller/bookmark_screen_controller.dart';
import 'package:news_app_model/controller/bottom_nav_bar_controller.dart';
import 'package:news_app_model/controller/home_screen_controller.dart';
import 'package:news_app_model/controller/search_screen_controller.dart';
import 'package:news_app_model/controller/trending_news_controller.dart';
import 'package:news_app_model/view/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BottomNavBarController(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => TrendingNewsController(),
        ),
        ChangeNotifierProvider(
          create: (context) => BookmarkScreenController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
