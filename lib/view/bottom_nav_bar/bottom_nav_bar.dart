import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app_model/controller/bottom_nav_bar_controller.dart';
import 'package:news_app_model/utils/color_constants.dart';
import 'package:provider/provider.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  @override
  Widget build(BuildContext context) {
    final bottomNavProvider = context.watch<BottomNavBarController>();
    return Scaffold(
        body: bottomNavProvider.screens[bottomNavProvider.currentScreenIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: bottomNavProvider.currentScreenIndex,
          onTap: (value) {
            context.read<BottomNavBarController>().setCurrentIndex(value);
          },
          selectedItemColor: ColorConstants.red,
          unselectedItemColor: ColorConstants.bodyFont,
          backgroundColor: ColorConstants.black,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: FaIcon(
                size: 21,
                FontAwesomeIcons.house,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: FaIcon(
                size: 21,
                FontAwesomeIcons.magnifyingGlass,
              ),
              label: "Search",
            ),
            BottomNavigationBarItem(
              activeIcon: FaIcon(
                size: 21,
                FontAwesomeIcons.solidBookmark,
              ),
              icon: FaIcon(
                size: 21,
                FontAwesomeIcons.bookmark,
              ),
              label: "Bookmark",
            ),
            BottomNavigationBarItem(
              activeIcon: FaIcon(
                size: 21,
                FontAwesomeIcons.solidCircleUser,
              ),
              icon: FaIcon(
                size: 21,
                FontAwesomeIcons.circleUser,
              ),
              label: "Profile",
            ),
          ],
        ));
  }
}
