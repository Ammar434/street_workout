import 'package:flutter/material.dart';
import 'package:street_workout/constants/size_config.dart';
import 'package:street_workout/constants/style.dart';

class RoundedInput extends StatelessWidget {
  const RoundedInput({
    Key? key,
    required this.text,
    required this.iconData,
    required this.isObscure,
    required this.press,
  }) : super(key: key);
  final String text;
  final IconData iconData;
  final bool isObscure;
  final Function(String)? press;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier * 1),
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.heightMultiplier * 1,
        horizontal: SizeConfig.widthMultiplier * 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeConfig.heightMultiplier * 3),
        color: backgroundColorShade,
      ),
      child: Form(
        child: TextFormField(
          cursorColor: primaryColor,
          obscureText: isObscure,
          style: TextStyle(
            color: primaryColor,
          ),
          decoration: InputDecoration(
            icon: Icon(
              iconData,
              color: primaryColor,
            ),
            hintText: text,
            hintStyle: TextStyle(
              color: primaryColor,
            ),
            border: InputBorder.none,
          ),
          onChanged: press,
        ),
      ),
    );
  }
}
