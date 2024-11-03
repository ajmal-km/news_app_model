import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_model/utils/color_constants.dart';

class PopularNewsContainer extends StatelessWidget {
  const PopularNewsContainer({
    super.key,
    this.title,
    this.source,
    this.time,
    this.image, this.onTapped,
  });
  final String? title;
  final String? source;
  final String? time;
  final String? image;
  final void Function()? onTapped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: CachedNetworkImage(
              imageUrl: "${image.toString()}",
              height: 190,
              width: 317,
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
                  size: 100,
                ),
              ),
            ),
          ),
          Container(
            width: 317,
            padding: EdgeInsets.all(18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: LinearGradient(
                colors: ColorConstants.carouselGradient,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "${title}",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.kanit(
                    height: 1.2,
                    color: ColorConstants.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 4),
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
                      Icons.more_vert,
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
