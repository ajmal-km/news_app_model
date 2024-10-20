import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_model/utils/color_constants.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.black,
      appBar: AppBar(
        backgroundColor: ColorConstants.black,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.close,
            color: ColorConstants.red,
            size: 26,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Edit profile",
          style: GoogleFonts.kanit(
            color: ColorConstants.red,
            fontWeight: FontWeight.w300,
            fontSize: 22,
            letterSpacing: -0.3,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.check,
              color: ColorConstants.red,
              size: 26,
            ),
          ),
          SizedBox(width: 4),
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 28, 15, 15),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  CircleAvatar(
                    radius: 80,
                    backgroundColor: ColorConstants.transparent,
                  ),
                  Positioned(
                    bottom: 11.5,
                    right: 11.5,
                    child: GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                        radius: 13,
                        backgroundColor: ColorConstants.red,
                        child: Icon(
                          Icons.edit,
                          color: ColorConstants.bodyFont,
                          size: 19,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 37),
              Column(
                children: <Widget>[
                  TextField(
                    // controller: dataController,
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus!.unfocus();
                    },
                    style: GoogleFonts.kanit(
                      color: ColorConstants.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      letterSpacing: -0.1,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: ColorConstants.transparent,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(style: BorderStyle.none),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(style: BorderStyle.none),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      hintText: "Username",
                      hintStyle: GoogleFonts.kanit(
                        color: ColorConstants.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        letterSpacing: -0.1,
                      ),
                    ),
                  ),
                  SizedBox(height: 29),
                  TextField(
                    // controller: dataController,
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus!.unfocus();
                    },
                    style: GoogleFonts.kanit(
                      color: ColorConstants.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      letterSpacing: -0.1,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: ColorConstants.transparent,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(style: BorderStyle.none),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(style: BorderStyle.none),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      hintText: "Name",
                      hintStyle: GoogleFonts.kanit(
                        color: ColorConstants.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        letterSpacing: -0.1,
                      ),
                    ),
                  ),
                  SizedBox(height: 29),
                  TextField(
                    // controller: dataController,
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus!.unfocus();
                    },
                    style: GoogleFonts.kanit(
                      color: ColorConstants.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      letterSpacing: -0.1,
                    ),
                    maxLines: 6,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: ColorConstants.transparent,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(style: BorderStyle.none),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(style: BorderStyle.none),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      hintText: "Bio",
                      hintStyle: GoogleFonts.kanit(
                        color: ColorConstants.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        letterSpacing: -0.1,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
