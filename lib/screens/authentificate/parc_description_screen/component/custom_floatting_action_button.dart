import 'package:flutter/material.dart';
import 'package:street_workout/constants/size_config.dart';
import 'package:street_workout/constants/style.dart';

class CustomFloattingActionButton extends StatelessWidget {
  const CustomFloattingActionButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.heightMultiplier * 8,
      width: SizeConfig.heightMultiplier * 20,
      child: FloatingActionButton.extended(
        onPressed: onTap,
        backgroundColor: backgroundColorShade2,
        icon: Icon(
          Icons.assistant_navigation,
          color: primaryColor,
        ),
        label: Text(
          'Se rendre',
          style: TextStyle(
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
