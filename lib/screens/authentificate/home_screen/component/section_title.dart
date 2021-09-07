import 'package:flutter/material.dart';
import 'package:street_workout/constants/size_config.dart';
import 'package:street_workout/constants/style.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.text,
    required this.gestureTapCallback,
  }) : super(key: key);
  final String text;
  final GestureTapCallback gestureTapCallback;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
              color: primaryColor,
              fontSize: SizeConfig.textMultiplier * 2,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: gestureTapCallback,
            child: Text(
              'Voir tout',
              style: TextStyle(
                color: primaryColor,
                fontSize: SizeConfig.textMultiplier * 2,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
