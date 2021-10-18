import 'package:animated_button/animated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:street_workout/constants/size_config.dart';
import 'package:street_workout/constants/style.dart';

class UserNameAndFollowing extends StatelessWidget {
  const UserNameAndFollowing({
    Key? key,
    required this.userName,
    required this.userSurname,
  }) : super(key: key);

  final String userName;
  final String userSurname;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$userName $userSurname}',
          style: TextStyle(
            fontSize: SizeConfig.textMultiplier * 2.5,
            fontWeight: FontWeight.w900,
          ),
        ),
        const Spacer(),
        AnimatedButton(
          child: const Text(
            'Follow',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          onPressed: () {},
          height: SizeConfig.heightMultiplier * 20,
          width: SizeConfig.widthMultiplier * 30,
          shadowDegree: ShadowDegree.dark,
          color: backgroundColorShade2,
        ),
      ],
    );
  }
}
