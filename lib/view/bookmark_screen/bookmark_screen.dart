import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_model/utils/color_constants.dart';
import 'package:news_app_model/view/global_widgets/custom_tile.dart';
import 'package:news_app_model/view/news_detail_screen/news_detail_screen.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  TextEditingController bookmarkController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.black,
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: ColorConstants.black,
        surfaceTintColor: ColorConstants.black,
        title: Text(
          "Bookmark",
          style: GoogleFonts.kanit(
            color: ColorConstants.red,
            fontWeight: FontWeight.w600,
            fontSize: 27,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              controller: bookmarkController,
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus!.unfocus();
              },
              onSubmitted: (value) {
                //
              },
              style: GoogleFonts.kanit(
                color: ColorConstants.white,
                fontSize: 18,
                fontWeight: FontWeight.w300,
                letterSpacing: 1.1,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: ColorConstants.grey,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(style: BorderStyle.none),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(style: BorderStyle.none),
                  borderRadius: BorderRadius.circular(8),
                ),
                hintText: "Search",
                hintStyle: GoogleFonts.kanit(
                  color: ColorConstants.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 1.1,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: ColorConstants.white,
                  size: 30,
                ),
                suffixIcon: Icon(
                  Icons.tune,
                  color: ColorConstants.white,
                  size: 30,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 15),
              separatorBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Divider(
                  height: 3,
                  thickness: 2,
                  color: ColorConstants.transparent,
                ),
              ),
              itemCount: 10,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: CustomTile(
                  onTapped: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsDetailScreen(),
                      ),
                    );
                  },
                  image:
                      "https://images.pexels.com/photos/27723986/pexels-photo-27723986/free-photo-of-medieval-gate.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load",
                  author: "AUTHOR",
                  title: "NEWS TITLE",
                  channelName: "SOURCE",
                  time: "PUBLISHED AT",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
