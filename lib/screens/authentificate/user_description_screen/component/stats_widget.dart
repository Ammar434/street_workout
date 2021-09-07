import 'package:flutter/material.dart';
import 'package:street_workout/constants/size_config.dart';
import 'package:street_workout/constants/style.dart';

class StatsWidget extends StatelessWidget {
  const StatsWidget({
    Key? key,
    required this.numberFolowers,
    required this.numberFolowings,
    required this.numberParcs,
  }) : super(key: key);
  final int numberFolowers;
  final int numberFolowings;
  final int numberParcs;
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
      color: primaryColor,
      fontWeight: FontWeight.bold,
      fontSize: SizeConfig.textMultiplier * 2,
    );
    return Padding(
      padding: EdgeInsets.all(SizeConfig.heightMultiplier * 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                numberFolowers.toString(),
                style: textStyle,
              ),
              Text(
                "Followers",
                style: textStyle,
              ),
            ],
          ),
          Column(
            children: [
              Text(
                numberParcs.toString(),
                style: textStyle,
              ),
              Text(
                "Nombre de parcs",
                style: textStyle,
              ),
            ],
          ),
          Column(
            children: [
              Text(
                numberFolowings.toString(),
                style: textStyle,
              ),
              Text(
                "Following",
                style: textStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
