import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:street_workout/constants/size_config.dart';
import 'package:street_workout/constants/style.dart';

class TeddyAnimation extends StatelessWidget {
  const TeddyAnimation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.heightMultiplier * 30,
      width: SizeConfig.heightMultiplier * 30,
      margin: EdgeInsets.only(
        top: SizeConfig.heightMultiplier * 1,
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: primaryColor,
      ),
      child: const ClipOval(
        child: RiveAnimation.asset(
          'assets/rive/teddy.riv',
          fit: BoxFit.fill,
          animations: ['idle'],
        ),
      ),
    );
  }
}
