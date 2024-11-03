import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_model/controller/bookmark_screen_controller.dart';
import 'package:news_app_model/utils/color_constants.dart';
import 'package:news_app_model/view/global_widgets/custom_tile.dart';
import 'package:news_app_model/view/news_detail_screen/news_detail_screen.dart';
import 'package:provider/provider.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await context.read<BookmarkScreenController>().getBookmarkList();
      },
    );
    super.initState();
  }

  TextEditingController bookmarkController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final bookmarkProvider = context.watch<BookmarkScreenController>();
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
            child: Builder(
              builder: (context) {
                if (bookmarkProvider.isLoading) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: ColorConstants.red,
                    ),
                  );
                } else if (bookmarkProvider.bookmarkedNews.isEmpty) {
                  return Center(
                    child: Text(
                      "No News Bookmarked!",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.kanit(
                        color: ColorConstants.red,
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.6,
                      ),
                    ),
                  );
                } else {
                  return ListView.separated(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    separatorBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Divider(
                        height: 3,
                        thickness: 2,
                        color: ColorConstants.transparent,
                      ),
                    ),
                    itemCount: bookmarkProvider.bookmarkedNews.length,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: CustomTile(
                        onTapped: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewsDetailScreen(
                                author: bookmarkProvider
                                    .bookmarkedNews[index].author
                                    .toString(),
                                source: bookmarkProvider
                                    .bookmarkedNews[index].source
                                    .toString(),
                                content: bookmarkProvider
                                    .bookmarkedNews[index].content,
                                imageUrl: bookmarkProvider
                                    .bookmarkedNews[index].urlToImage
                                    .toString(),
                                time: bookmarkProvider
                                    .bookmarkedNews[index].publishedAt
                                    .toString(),
                                title: bookmarkProvider
                                    .bookmarkedNews[index].title
                                    .toString(),
                                websiteUrl: bookmarkProvider
                                    .bookmarkedNews[index].url
                                    .toString(),
                                description: bookmarkProvider
                                    .bookmarkedNews[index].description,
                              ),
                            ),
                          );
                        },
                        image: bookmarkProvider.bookmarkedNews[index].urlToImage
                            .toString(),
                        author: bookmarkProvider.bookmarkedNews[index].author
                            .toString(),
                        title: bookmarkProvider.bookmarkedNews[index].title
                            .toString(),
                        channelName: bookmarkProvider
                            .bookmarkedNews[index].source
                            .toString(),
                        time: bookmarkProvider.bookmarkedNews[index].publishedAt
                            .toString(),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
