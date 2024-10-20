// import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_model/utils/color_constants.dart';

class CarouselContainer extends StatelessWidget {
  const CarouselContainer({
    super.key,
    this.image,
    this.title,
    this.source,
    this.time,
    this.onTapped,
  });

  final String? image;
  final String? title;
  final String? source;
  final String? time;
  final void Function()? onTapped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
              imageUrl: "${image.toString()}",
              height: double.infinity,
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
          ),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: ColorConstants.carouselGradient,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  "${title.toString()}",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.kanit(
                    height: 1.2,
                    color: ColorConstants.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 7),
                Text(
                  "${source}",
                  style: GoogleFonts.kanit(
                    color: ColorConstants.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 7),
                Row(
                  children: <Widget>[
                    FaIcon(
                      FontAwesomeIcons.clock,
                      size: 11,
                      color: ColorConstants.white,
                    ),
                    SizedBox(width: 4),
                    Text(
                      "${time}",
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.kanit(
                        color: ColorConstants.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.more_horiz,
                      color: ColorConstants.white,
                      size: 14,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
