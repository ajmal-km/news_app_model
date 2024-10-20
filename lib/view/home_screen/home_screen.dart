import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_model/controller/home_screen_controller.dart';
import 'package:news_app_model/utils/color_constants.dart';
import 'package:news_app_model/view/home_screen/widgets/carousel_container.dart';
import 'package:news_app_model/view/global_widgets/custom_tile.dart';
import 'package:news_app_model/view/news_detail_screen/news_detail_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await context.read<HomeScreenController>().getTrendingNews();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = context.watch<HomeScreenController>();
    return Scaffold(
      backgroundColor: ColorConstants.black,
      appBar: AppBar(
        backgroundColor: ColorConstants.black,
        surfaceTintColor: ColorConstants.black,
        title: Text(
          "NEWS HUT",
          style: GoogleFonts.kanit(
            color: ColorConstants.red,
            fontSize: 27,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.5,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              context
                  .read<HomeScreenController>()
                  .navigateToNotifications(context);
            },
            icon: FaIcon(
              FontAwesomeIcons.bell,
              color: ColorConstants.white,
            ),
          ),
          SizedBox(width: 5)
        ],
      ),
      body: homeProvider.isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: ColorConstants.red,
              ),
            )
          : ListView(
              padding: EdgeInsets.symmetric(vertical: 10),
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 18, right: 8, top: 8),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Trending News",
                            style: GoogleFonts.kanit(
                              color: ColorConstants.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Spacer(),
                          TextButton(
                            onPressed: () {
                              context
                                  .read<HomeScreenController>()
                                  .navigateToTrendingNews(context);
                            },
                            child: Text(
                              "See All",
                              style: GoogleFonts.kanit(
                                color: ColorConstants.red,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    CarouselSlider.builder(
                      itemCount: 5,
                      options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                      ),
                      itemBuilder: (context, index, realIndex) =>
                          CarouselContainer(
                        image: homeProvider.articles[index].urlToImage,
                        source: homeProvider.articles[index].source!.name
                            .toString(),
                        title: homeProvider.articles[index].title.toString(),
                        time: context
                            .read<HomeScreenController>()
                            .formatDateTime(
                                homeProvider.articles[index].publishedAt),
                        onTapped: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewsDetailScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.only(left: 18, right: 8),
                  child: Text(
                    "Latest News",
                    style: GoogleFonts.kanit(
                      color: ColorConstants.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: 13),
                SizedBox(
                  height: 40,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    itemCount: homeProvider.categories.length,
                    separatorBuilder: (context, index) => SizedBox(width: 15),
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        homeProvider.setCategoryIndex(index);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: homeProvider.categoryIndex == index
                              ? ColorConstants.red
                              : null,
                          borderRadius: BorderRadius.circular(9),
                          border: homeProvider.categoryIndex == index
                              ? null
                              : Border.all(width: 2, color: ColorConstants.red),
                        ),
                        child: Text(
                          homeProvider.categories[index],
                          style: GoogleFonts.kanit(
                            color: ColorConstants.white,
                            fontSize: 17,
                            fontWeight: homeProvider.categoryIndex == index
                                ? FontWeight.w600
                                : FontWeight.w300,
                            letterSpacing: -0.3,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                homeProvider.isCategoryLoading
                    ? SizedBox(
                        height: 300,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: ColorConstants.red,
                          ),
                        ),
                      )
                    : ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.only(top: 23, bottom: 8),
                        itemCount: homeProvider.categoryIndex == 0
                            ? homeProvider.articles.length
                            : homeProvider.categorizedArticles.length,
                        separatorBuilder: (context, index) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: Divider(
                            height: 3,
                            thickness: 2,
                            color: ColorConstants.transparent,
                          ),
                        ),
                        itemBuilder: homeProvider.categoryIndex == 0
                            ? (context, index) => Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 18),
                                  child: CustomTile(
                                    image: homeProvider
                                        .articles[index].urlToImage
                                        .toString(),
                                    author: homeProvider.articles[index].author
                                        .toString()
                                        .toUpperCase(),
                                    title: homeProvider.articles[index].title
                                        .toString(),
                                    channelName: homeProvider
                                        .articles[index].source!.name
                                        .toString(),
                                    time: context
                                        .read<HomeScreenController>()
                                        .formatDateTime(homeProvider
                                            .articles[index].publishedAt),
                                    onTapped: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              NewsDetailScreen(),
                                        ),
                                      );
                                    },
                                  ),
                                )
                            : (context, index) => Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 18),
                                  child: CustomTile(
                                    image: homeProvider
                                        .categorizedArticles[index].urlToImage
                                        .toString(),
                                    author: homeProvider
                                        .categorizedArticles[index].author
                                        .toString()
                                        .toUpperCase(),
                                    title: homeProvider
                                        .categorizedArticles[index].title
                                        .toString(),
                                    channelName: homeProvider
                                        .categorizedArticles[index].source!.name
                                        .toString(),
                                    time: context
                                        .read<HomeScreenController>()
                                        .formatDateTime(
                                          homeProvider
                                              .categorizedArticles[index]
                                              .publishedAt,
                                        ),
                                    onTapped: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              NewsDetailScreen(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                      ),
              ],
            ),
    );
  }
}
