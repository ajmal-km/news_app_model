import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_model/controller/trending_news_controller_screen.dart';
import 'package:news_app_model/utils/color_constants.dart';
import 'package:news_app_model/view/trending_news_screen/widgets/trending_container.dart';
import 'package:provider/provider.dart';

class TrendingNewsScreen extends StatefulWidget {
  const TrendingNewsScreen({super.key});

  @override
  State<TrendingNewsScreen> createState() => _TrendingNewsScreenState();
}

class _TrendingNewsScreenState extends State<TrendingNewsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await context.read<TrendingNewsControllerScreen>().getTrendNews();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final trendProvider = context.watch<TrendingNewsControllerScreen>();
    return Scaffold(
      backgroundColor: ColorConstants.black,
      appBar: AppBar(
        backgroundColor: ColorConstants.black,
        surfaceTintColor: ColorConstants.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 20,
            color: ColorConstants.red,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Trending",
          style: GoogleFonts.kanit(
            color: ColorConstants.red,
            fontSize: 23,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              //
            },
            iconSize: 22,
            icon: Icon(
              Icons.more_vert,
              color: ColorConstants.red,
            ),
          ),
        ],
      ),
      body: trendProvider.isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: ColorConstants.red,
              ),
            )
          : ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 18),
              itemCount: trendProvider.articles.length,
              separatorBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 19),
                child: Divider(
                  height: 3,
                  thickness: 3,
                  color: ColorConstants.transparent,
                ),
              ),
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: TrendingContainer(
                  image: trendProvider.articles[index].urlToImage,
                  author: trendProvider.articles[index].author.toString(),
                  title: trendProvider.articles[index].title,
                  channelName: trendProvider.articles[index].source!.name,
                  time: context
                      .read<TrendingNewsControllerScreen>()
                      .formatDateTime(
                          trendProvider.articles[index].publishedAt),
                ),
              ),
            ),
    );
  }
}
