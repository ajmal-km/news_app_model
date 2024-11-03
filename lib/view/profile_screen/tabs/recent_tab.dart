import 'package:flutter/material.dart';
import 'package:news_app_model/utils/color_constants.dart';
import 'package:news_app_model/view/global_widgets/custom_tile.dart';
import 'package:news_app_model/view/news_detail_screen/news_detail_screen.dart';

class RecentTab extends StatelessWidget {
  const RecentTab({super.key});
  

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 6,
      padding: EdgeInsets.symmetric(vertical: 14),
      separatorBuilder: (context, index) => Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Divider(
          height: 3,
          thickness: 2,
          color: ColorConstants.transparent,
        ),
      ),
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: CustomTile(
          onTapped: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewsDetailScreen(),
              ),
            );
          },
          image:
              "https://images.pexels.com/photos/27723986/pexels-photo-27723986/free-photo-of-medieval-gate.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load",
          author: "AUTHOR",
          title: "NEWS TITLE",
          channelName: "SOURCE",
          time: "PUBLISHED AT",
        ),
      ),
    );
  }
}
