import 'package:flutter/material.dart';
import 'package:street_workout/constants/size_config.dart';
import 'package:street_workout/constants/style.dart';

class DateWidget extends StatelessWidget {
  const DateWidget({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);
  final String text;
  final bool isSelected;
  final GestureTapCallback onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.widthMultiplier * 20,
      height: SizeConfig.heightMultiplier * 5,
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
              isSelected ? backgroundColorShade2 : backgroundColor),
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(
            color: primaryColor,
            fontSize: SizeConfig.textMultiplier * 2,
          ),
        ),
      ),
    );
  }
}
