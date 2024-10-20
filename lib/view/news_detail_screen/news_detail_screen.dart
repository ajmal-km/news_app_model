import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_model/utils/color_constants.dart';

class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({super.key});

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
            padding: EdgeInsets.only(right: 15, left: 15, bottom: 15, top: 12),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 20,
                  backgroundColor: ColorConstants.transparent,
                  child: FaIcon(
                    FontAwesomeIcons.globe,
                    color: ColorConstants.white,
                    size: 25,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  "SOURCE",
                  style: GoogleFonts.kanit(
                    color: ColorConstants.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.4,
                  ),
                ),
                Spacer(),
                Text(
                  "Time",
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
                "https://images.pexels.com/photos/28864480/pexels-photo-28864480/free-photo-of-tranquil-beach-sunset-with-vibrant-sky.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load",
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
                      "AUTHOR",
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
                "Ukraine's President Zelensky to BBC: Blood money being paid for Russian oil",
                style: GoogleFonts.kanit(
                  color: ColorConstants.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w400,
                  letterSpacing: -1,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Ukrainian President Volodymyr Zelensky has accused European countries that continue to buy Russian oil of earning their money in other people's blood.",
                style: GoogleFonts.kanit(
                  height: 1.2,
                  color: ColorConstants.bodyFont,
                  fontSize: 23,
                  fontWeight: FontWeight.w200,
                  letterSpacing: -0.3,
                  wordSpacing: 2,
                ),
              ),
              SizedBox(height: 15),
              Text(
                "Ukrainian President Volodymyr Zelensky has accused European countries that continue to buy Russian oil of earning their money in other people's blood.",
                style: GoogleFonts.kanit(
                  height: 1.2,
                  color: ColorConstants.bodyFont,
                  fontSize: 23,
                  fontWeight: FontWeight.w200,
                  letterSpacing: -0.3,
                  wordSpacing: 2,
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: ColorConstants.black,
          border: Border(
            top: BorderSide(width: 0.75, color: ColorConstants.transparent),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          children: <Widget>[
            Expanded(
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
            SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                //
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
