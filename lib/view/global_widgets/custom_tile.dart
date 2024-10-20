import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_model/utils/color_constants.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({
    super.key,
    this.image,
    this.author,
    this.title,
    this.channelName,
    this.time,
    this.onTapped,
  });

  final String? image;
  final String? author;
  final String? title;
  final String? channelName;
  final String? time;
  final void Function()? onTapped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Row(
        children: <Widget>[
          Container(
            height: 96,
            width: 96,
            decoration: BoxDecoration(
              color: ColorConstants.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: "${image?.toString()}",
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
                    size: 50,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Container(
              height: 96,
              color: ColorConstants.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    author!.isEmpty || author.toString().toLowerCase() == "null"
                        ? "UNKNOWN AUTHOR"
                        : "${author.toString()}",
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.kanit(
                      color: ColorConstants.bodyFont,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "${title?.toString()}",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.kanit(
                      color: ColorConstants.white,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 2.5),
                  Text(
                    "${channelName?.toString()}",
                    maxLines: 2,
                    style: GoogleFonts.kanit(
                      color: ColorConstants.bodyFont,
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: <Widget>[
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
                          fontSize: 11,
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
          )
        ],
      ),
    );
  }
}
