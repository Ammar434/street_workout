import 'package:flutter/material.dart';
import 'package:street_workout/constants/size_config.dart';
import 'package:street_workout/constants/style.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);
  final String text;
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(
        SizeConfig.heightMultiplier * 2,
      ),
      child: Container(
        width: SizeConfig.widthMultiplier * 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            SizeConfig.heightMultiplier * 2,
          ),
          color: backgroundColorShade2,
        ),
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding:
            EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier * 2),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: primaryColor,
            fontSize: SizeConfig.textMultiplier * 2,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
