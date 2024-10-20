import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app_model/view/profile_screen/widgets/settings_tile.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(top: 10),
      children: <Widget>[
        SettingsTile(
          title: "Manage accounts",
          icon: FontAwesomeIcons.solidCircleUser,
          onListTileTap: () {
            //
          },
        ),
        SettingsTile(
          title: "General",
          icon: FontAwesomeIcons.gear,
          onListTileTap: () {
            //
          },
        ),
        SettingsTile(
          title: "Privacy and Security",
          icon: FontAwesomeIcons.shield,
          onListTileTap: () {
            //
          },
        ),
        SettingsTile(
          title: "Help",
          icon: FontAwesomeIcons.circleInfo,
          onListTileTap: () {
            //
          },
        ),
        SettingsTile(
          title: "Logout",
          icon: FontAwesomeIcons.arrowRightFromBracket,
          onListTileTap: () {
            //
          },
        ),
      ],
    );
  }
}
