import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_model/utils/color_constants.dart';
import 'package:news_app_model/view/edit_profile_screen/edit_profile_screen.dart';
import 'package:news_app_model/view/profile_screen/tabs/recent_tab.dart';
import 'package:news_app_model/view/profile_screen/tabs/settings_tab.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: ColorConstants.black,
        appBar: AppBar(
          backgroundColor: ColorConstants.black,
          surfaceTintColor: ColorConstants.black,
          centerTitle: true,
          title: Text(
            "Profile",
            style: GoogleFonts.kanit(
              color: ColorConstants.red,
              fontWeight: FontWeight.w300,
              fontSize: 22,
              letterSpacing: -0.3,
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 8),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 54,
                        backgroundImage: NetworkImage(
                            "https://images.pexels.com/photos/19228242/pexels-photo-19228242/free-photo-of-back-view-of-woman-in-trench-coat-and-with-transparent-umbrella-in-park-in-autumn.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load"),
                        backgroundColor: ColorConstants.grey,
                        // child: FaIcon(
                        //   FontAwesomeIcons.solidUser,
                        //   color: ColorConstants.lightWhite,
                        //   size: 50,
                        // ),
                      ),
                      SizedBox(width: 16),
                      Text(
                        "Username",
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.kanit(
                          color: ColorConstants.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w300,
                          letterSpacing: -0.9,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  "Bio",
                  style: GoogleFonts.kanit(
                    color: ColorConstants.red,
                    fontSize: 17.6,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.kanit(
                    color: ColorConstants.bodyFont,
                    fontSize: 15.9,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: 14),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProfileScreen(),
                      ),
                    );
                  },
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: ColorConstants.red,
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: Text(
                      "Edit profile",
                      style: GoogleFonts.kanit(
                        color: ColorConstants.white,
                        fontSize: 16.6,
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            TabBar(
              overlayColor: WidgetStateColor.transparent,
              dividerHeight: 0.09,
              indicatorColor: ColorConstants.red,
              labelColor: ColorConstants.white,
              labelStyle: GoogleFonts.kanit(
                fontSize: 17.6,
                fontWeight: FontWeight.w400,
                letterSpacing: -0.1,
              ),
              unselectedLabelStyle: GoogleFonts.kanit(
                color: ColorConstants.lightWhite,
                fontSize: 17.6,
                fontWeight: FontWeight.w400,
                letterSpacing: -0.1,
              ),
              tabs: <Widget>[
                Tab(text: "Recent"),
                Tab(text: "Settings"),
              ],
            ),
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  RecentTab(),
                  SettingsTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
