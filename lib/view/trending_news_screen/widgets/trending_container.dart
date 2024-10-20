import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_model/utils/color_constants.dart';

class TrendingContainer extends StatelessWidget {
  const TrendingContainer({
    super.key,
    this.image,
    this.title,
    this.author,
    this.channelName,
    this.time,
    this.onTapped,
  });

  final String? image;
  final String? title;
  final String? author;
  final String? channelName;
  final String? time;
  final void Function()? onTapped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 183,
            decoration: BoxDecoration(
              color: ColorConstants.grey,
              borderRadius: BorderRadius.circular(13),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(13),
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
          ),
          SizedBox(height: 8),
          Text(
            author!.isEmpty || author.toString().toLowerCase() == "null"
                ? "UNKNOWN AUTHOR"
                : "${author.toString()}",
            style: GoogleFonts.kanit(
              color: ColorConstants.bodyFont,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 6),
          Text(
            "${title?.toString()}",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.kanit(
              color: ColorConstants.white,
              fontSize: 17.6,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 6),
          Row(
            children: <Widget>[
              Text(
                "${channelName?.toString()}",
                style: GoogleFonts.kanit(
                  color: ColorConstants.bodyFont,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(width: 15),
              FaIcon(
                FontAwesomeIcons.clock,
                size: 11,
                color: ColorConstants.bodyFont,
              ),
              SizedBox(width: 4),
              Text(
                "${time?.toString()}",
                style: GoogleFonts.kanit(
                  color: ColorConstants.bodyFont,
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
    );
  }
}
