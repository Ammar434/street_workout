import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:street_workout/constants/size_config.dart';
import 'package:street_workout/constants/style.dart';

class UserRewardsDisplay extends StatelessWidget {
  const UserRewardsDisplay({
    Key? key,
    required this.userRewards,
  }) : super(key: key);

  final List userRewards;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: userRewards.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          if (userRewards.isNotEmpty) {
            return Container(
              margin: EdgeInsets.only(right: SizeConfig.widthMultiplier * 5),
              height: SizeConfig.heightMultiplier * 20,
              width: SizeConfig.widthMultiplier * 35,
              child: Image.network(userRewards[index]),
            );
          }
          return Center(
            child: Text(
              "No rewards yet",
              style: TextStyle(
                color: backgroundColorShade2,
                fontSize: SizeConfig.textMultiplier * 2,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
}
