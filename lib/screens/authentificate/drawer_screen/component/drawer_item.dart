import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:street_workout/constants/size_config.dart';
import 'package:street_workout/constants/style.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    Key? key,
    required this.text,
    required this.iconData,
    required this.press,
  }) : super(key: key);
  final String text;
  final IconData iconData;
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(SizeConfig.heightMultiplier * 2),
      child: GestureDetector(
        onTap: press,
        child: Row(
          children: [
            FaIcon(
              iconData,
              color: primaryColor,
            ),
            SizedBox(
              width: SizeConfig.widthMultiplier * 2,
            ),
            Text(
              text,
              style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 3,
                  color: primaryColor,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
