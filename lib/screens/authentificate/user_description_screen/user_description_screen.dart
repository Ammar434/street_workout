import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:street_workout/constants/size_config.dart';
import 'package:street_workout/constants/style.dart';

import 'component/stats_widget.dart';
import 'component/user_profile.dart';

class UserDescriptionScreen extends StatelessWidget {
  static const String name = "userDescription";

  final String image;
  final int numberFollowers;
  final int numberParcs;
  final int numberFollowing;
  final String userName;
  final String userSurname;
  final String userBio;
  final List userPhotos;
  final List userRewards;

  const UserDescriptionScreen({
    Key? key,
    required this.image,
    required this.numberFollowers,
    required this.numberParcs,
    required this.numberFollowing,
    required this.userName,
    required this.userSurname,
    required this.userBio,
    required this.userPhotos,
    required this.userRewards,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: primaryColor,
          ),
        ),
      ),
      body: SlidingUpPanel(
        maxHeight: SizeConfig.heightMultiplier * 80,
        color: Colors.transparent,
        body: Image.network(
          image,
          fit: BoxFit.cover,
        ),
        panel: Column(
          children: [
            StatsWidget(
              numberFolowers: numberFollowers,
              numberParcs: numberParcs,
              numberFolowings: numberFollowing,
            ),
            UserProfile(
              userName: userName,
              userSurname: userSurname,
              userBio: userBio,
              userPhotos: userPhotos,
              userRewards: userRewards,
            ),
          ],
        ),
      ),
    );
  }
}
