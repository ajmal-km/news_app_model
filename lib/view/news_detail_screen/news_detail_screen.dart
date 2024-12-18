import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_model/controller/bookmark_screen_controller.dart';
import 'package:news_app_model/model/bookmark_model.dart';
import 'package:news_app_model/utils/color_constants.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({
    super.key,
    this.title,
    this.source,
    this.imageUrl,
    this.time,
    this.author,
    this.websiteUrl,
    this.description,
    this.content,
  });

  final String? title;
  final String? source;
  final String? imageUrl;
  final String? time;
  final String? author;
  final String? websiteUrl;
  final String? description;
  final String? content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.black,
      appBar: AppBar(
        backgroundColor: ColorConstants.black,
        surfaceTintColor: ColorConstants.black,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: ColorConstants.red,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(15, 12, 15, 15),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 20,
                  backgroundColor: ColorConstants.transparent,
                  child: FaIcon(
                    FontAwesomeIcons.globe,
                    color: ColorConstants.white,
                    size: 22,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  "${source.toString()}",
                  style: GoogleFonts.kanit(
                    color: ColorConstants.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.4,
                  ),
                ),
                Spacer(),
                Text(
                  "${time.toString()}",
                  style: GoogleFonts.kanit(
                    color: ColorConstants.bodyFont,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.1,
                  ),
                ),
              ],
            ),
          ),
          CachedNetworkImage(
            imageUrl:
                "${imageUrl?.toString()}",
            height: 290,
            width: double.infinity,
            fit: BoxFit.cover,
            placeholder: (context, url) => Center(
              child: CircularProgressIndicator(
                color: ColorConstants.bodyFont,
              ),
            ),
            errorWidget: (context, url, error) => Center(
              child: FaIcon(
                FontAwesomeIcons.image,
                color: ColorConstants.bodyFont,
                size: 120,
              ),
            ),
          ),
          ListView(
            padding: EdgeInsets.fromLTRB(15, 20, 15, 15),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 8.0, bottom: 16),
                child: Row(
                  children: <Widget>[
                    FaIcon(
                      FontAwesomeIcons.solidUser,
                      color: ColorConstants.lightWhite,
                      size: 18,
                    ),
                    SizedBox(width: 15),
                    Text(
                      "${author?.toString()}",
                      style: GoogleFonts.kanit(
                        color: ColorConstants.lightWhite,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.2,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "${title?.toString()}",
                style: GoogleFonts.kanit(
                  color: ColorConstants.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w400,
                  letterSpacing: -1,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "${description?.toString()}",
                style: GoogleFonts.kanit(
                  height: 1.2,
                  color: ColorConstants.bodyFont,
                  fontSize: 20,
                  fontWeight: FontWeight.w200,
                  letterSpacing: -0,
                  wordSpacing: 2,
                ),
              ),
              SizedBox(height: 15),
              Text(
                "${content?.toString()}",
                style: GoogleFonts.kanit(
                  height: 1.2,
                  color: ColorConstants.bodyFont,
                  fontSize: 20,
                  fontWeight: FontWeight.w200,
                  letterSpacing: -0,
                  wordSpacing: 2,
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                onTap: () async {
                  var url = Uri.parse("${websiteUrl?.toString()}");
                  if (!await launchUrl(url)) {}
                },
                child: Container(
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: ColorConstants.red,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Text(
                    "See website",
                    style: GoogleFonts.kanit(
                      color: ColorConstants.white,
                      fontSize: 18.6,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.2,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                context.read<BookmarkScreenController>().addToBookmark(
                      BookmarkModel(
                        title: title,
                        author: author,
                        content: content,
                        description: description,
                        source: source,
                        urlToImage: imageUrl,
                        url: websiteUrl,
                        publishedAt: time,
                      ),
                    );
              },
              child: Container(
                height: 40,
                width: 42,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: ColorConstants.red,
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Icon(
                  Icons.bookmark_border_outlined,
                  size: 27,
                  color: ColorConstants.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
