import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_model/controller/search_screen_controller.dart';
import 'package:news_app_model/utils/color_constants.dart';
import 'package:news_app_model/view/global_widgets/custom_tile.dart';
import 'package:news_app_model/view/search_screen/widgets/popular_news_container.dart';
import 'package:news_app_model/view/search_screen/widgets/source_tile.dart';
import 'package:news_app_model/view/source_details_screen/source_details_screen.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await context.read<SearchScreenController>().getPopularNews();
        await context.read<SearchScreenController>().getAllSources();
      },
    );
    super.initState();
  }

  TextEditingController dataController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final searchProvider = context.watch<SearchScreenController>();
    return Scaffold(
      backgroundColor: ColorConstants.black,
      appBar: AppBar(
        backgroundColor: ColorConstants.black,
        surfaceTintColor: ColorConstants.black,
        title: Text(
          "Search",
          style: GoogleFonts.kanit(
            color: ColorConstants.red,
            fontWeight: FontWeight.w600,
            fontSize: 27,
          ),
        ),
      ),
      body: searchProvider.isPopularLoading
          ? Center(
              child: CircularProgressIndicator(
                color: ColorConstants.red,
              ),
            )
          : Padding(
              padding: EdgeInsets.only(top: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: searchProvider.newsSearchModel == null
                        ? EdgeInsets.only(left: 18, right: 18, bottom: 16)
                        : EdgeInsets.only(left: 18),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            controller: dataController,
                            onTapOutside: (event) {
                              FocusManager.instance.primaryFocus!.unfocus();
                            },
                            onSubmitted: (value) {
                              context
                                  .read<SearchScreenController>()
                                  .onSearch(value);
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
                              prefixIcon: IconButton(
                                onPressed: () {
                                  context
                                      .read<SearchScreenController>()
                                      .onSearch(dataController.text);
                                },
                                icon: Icon(
                                  Icons.search,
                                  color: ColorConstants.white,
                                  size: 30,
                                ),
                              ),
                              suffixIcon: Icon(
                                Icons.tune,
                                color: ColorConstants.white,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: searchProvider.newsSearchModel == null
                              ? false
                              : true,
                          child: IconButton(
                            padding: EdgeInsets.only(left: 10),
                            onPressed: () {
                              context
                                  .read<SearchScreenController>()
                                  .setSearchListNull();
                            },
                            icon: Icon(
                              Icons.close,
                              size: 26,
                              color: ColorConstants.bodyFont,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        if (searchProvider.newsSearchModel == null) {
                          return ListView(
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 15, right: 8, bottom: 10),
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          "Popular News",
                                          style: GoogleFonts.kanit(
                                            color: ColorConstants.white,
                                            fontSize: 19,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Spacer(),
                                        TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            "See all",
                                            style: GoogleFonts.kanit(
                                              color: ColorConstants.red,
                                              fontSize: 19,
                                              fontWeight: FontWeight.w400,
                                              letterSpacing: -0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  CarouselSlider.builder(
                                    options: CarouselOptions(
                                      height: 190,
                                      autoPlay: true,
                                    ),
                                    itemCount: 3,
                                    itemBuilder: (context, index, realIndex) =>
                                        PopularNewsContainer(
                                      image: searchProvider
                                          .popularNewsList[index].urlToImage
                                          .toString(),
                                      title: searchProvider
                                          .popularNewsList[index].title
                                          .toString(),
                                      source: searchProvider
                                          .popularNewsList[index].source!.name
                                          .toString(),
                                      time: context
                                          .read<SearchScreenController>()
                                          .formatDateTime(searchProvider
                                              .popularNewsList[index]
                                              .publishedAt),
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 18),
                                    child: Text(
                                      "Sources",
                                      style: GoogleFonts.kanit(
                                        color: ColorConstants.white,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: -0.2,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 18),
                                  SizedBox(
                                    height: 40,
                                    child: ListView.separated(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 16),
                                      scrollDirection: Axis.horizontal,
                                      separatorBuilder: (context, index) =>
                                          SizedBox(width: 14),
                                      itemCount:
                                          searchProvider.sourceCategory.length,
                                      itemBuilder: (context, index) =>
                                          GestureDetector(
                                        onTap: () {
                                          context
                                              .read<SearchScreenController>()
                                              .setSourceCateogry(index);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: searchProvider.sourceIndex ==
                                                    index
                                                ? ColorConstants.red
                                                : null,
                                            border: searchProvider
                                                        .sourceIndex ==
                                                    index
                                                ? null
                                                : Border.all(
                                                    width: 2,
                                                    color: ColorConstants.red,
                                                  ),
                                            borderRadius:
                                                BorderRadius.circular(9),
                                          ),
                                          child: Text(
                                            searchProvider
                                                .sourceCategory[index],
                                            style: GoogleFonts.kanit(
                                              color: ColorConstants.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w300,
                                              letterSpacing: -0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 17),
                                  searchProvider.isSourcesLoading
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
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          separatorBuilder: (context, index) =>
                                              Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 13),
                                            child: Divider(
                                              height: 3,
                                              thickness: 2,
                                              color: ColorConstants.transparent,
                                            ),
                                          ),
                                          itemCount:
                                              searchProvider.sourcesList.length,
                                          itemBuilder: (context, index) =>
                                              SourceTile(
                                            name: searchProvider
                                                .sourcesList[index].name
                                                .toString(),
                                            description: searchProvider
                                                .sourcesList[index].description
                                                .toString(),
                                            category: searchProvider
                                                .sourcesList[index].category
                                                .toString(),
                                            onTapped: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      SourceDetailsScreen(),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                ],
                              ),
                            ],
                          );
                        } else if (searchProvider.isSearchLoading) {
                          return Center(
                            child: CircularProgressIndicator(
                                color: ColorConstants.red),
                          );
                        } else if (searchProvider.newsArticles.isEmpty) {
                          return Center(
                            child: Text(
                              "No Result Found",
                              style: GoogleFonts.kanit(
                                color: ColorConstants.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w300,
                                letterSpacing: -1,
                              ),
                            ),
                          );
                        } else {
                          return ListView.separated(
                            padding: EdgeInsets.only(top: 16),
                            itemCount: 4,
                            separatorBuilder: (context, index) => Padding(
                              padding: EdgeInsets.symmetric(vertical: 13),
                              child: Divider(
                                height: 3,
                                thickness: 2,
                                color: ColorConstants.transparent,
                              ),
                            ),
                            itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.symmetric(horizontal: 18),
                              child: CustomTile(
                                image: searchProvider
                                    .newsArticles[index].urlToImage
                                    .toString(),
                                title: searchProvider.newsArticles[index].title
                                    .toString(),
                                channelName: searchProvider
                                    .newsArticles[index].source!.name
                                    .toString(),
                                author: searchProvider
                                    .newsArticles[index].author
                                    .toString()
                                    .toUpperCase(),
                                time: context
                                    .read<SearchScreenController>()
                                    .formatDateTime(searchProvider
                                        .newsArticles[index].publishedAt),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
