import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:street_workout/constants/size_config.dart';
import 'package:street_workout/screens/authentificate/user_description_screen/component/user_name_and_following.dart';
import 'package:street_workout/screens/authentificate/user_description_screen/component/user_photos_display.dart';
import 'package:street_workout/screens/authentificate/user_description_screen/component/user_rewards_display.dart';
import 'package:street_workout/widgets/vertical_spacing.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({
    Key? key,
    required this.userName,
    required this.userSurname,
    required this.userBio,
    required this.userPhotos,
    required this.userRewards,
  }) : super(key: key);

  final String userName;
  final String userSurname;
  final String userBio;
  final List userPhotos;
  final List userRewards;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              25,
            ),
            topRight: Radius.circular(
              25,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              UserNameAndFollowing(
                  userName: userName, userSurname: userSurname),
              const VerticalSpacing(of: 1),
              Text(
                userBio,
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const VerticalSpacing(of: 1),
              Text(
                'Photos',
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              UserPhotosDisplay(userPhotos: userPhotos),
              Text(
                'Rewards',
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              UserRewardsDisplay(userRewards: userRewards),
            ],
          ),
        ),
      ),
    );
  }
}
