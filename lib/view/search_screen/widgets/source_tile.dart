import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_model/utils/color_constants.dart';

class SourceTile extends StatelessWidget {
  const SourceTile({
    super.key,
    this.name,
    this.description,
    this.category,
    this.onTapped,
  });

  final String? name;
  final String? description;
  final String? category;
  final void Function()? onTapped;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTapped,
      leading: CircleAvatar(
        radius: 23,
        backgroundColor: ColorConstants.transparent,
        child: FaIcon(
          FontAwesomeIcons.globe,
          color: ColorConstants.bodyFont,
          size: 29,
        ),
      ),
      title: Text(
        "${name}",
        style: GoogleFonts.kanit(
          color: ColorConstants.white,
          fontSize: 18,
          letterSpacing: -0.4,
        ),
      ),
      subtitle: Text(
        "${description}",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.kanit(
          color: ColorConstants.bodyFont,
          fontSize: 15,
          letterSpacing: -0.4,
        ),
      ),
      trailing: Text(
        "${category}",
        style: GoogleFonts.kanit(
          color: ColorConstants.red,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.4,
        ),
      ),
    );
  }
}
