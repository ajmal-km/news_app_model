import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_model/utils/color_constants.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    super.key, required this.title, required this.icon, this.onListTileTap,
  });

  final String title;
  final IconData icon;
  final void Function()? onListTileTap;


  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 18),
      onTap: onListTileTap,
      leading: FaIcon(
        icon,
        color: ColorConstants.bodyFont,
      ),
      title: Text(
        title,
        style: GoogleFonts.kanit(
          color: ColorConstants.bodyFont,
          fontSize: 18.6,
          fontWeight: FontWeight.w300,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 20,
        color: ColorConstants.red,
      ),
    );
  }
}
