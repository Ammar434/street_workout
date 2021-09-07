import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:street_workout/constants/size_config.dart';
import 'package:street_workout/constants/style.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    Key? key,
    required this.isArrow,
    required this.icon,
    required this.iconBackgroundColor,
    required this.text1,
    required this.text2,
    required this.press,
  }) : super(key: key);
  final IconData icon;
  final Color iconBackgroundColor;
  final String text1;
  final String text2;
  final bool isArrow;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding:
            EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier * 1.5),
        child: Row(
          children: [
            CircleAvatar(
              child: Icon(
                icon,
                color: primaryColor,
              ),
              backgroundColor: iconBackgroundColor,
            ),
            SizedBox(
              width: SizeConfig.widthMultiplier * 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text1,
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: SizeConfig.textMultiplier * 2,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Visibility(
                  visible: text2.isNotEmpty ? true : false,
                  child: Text(
                    text2,
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: SizeConfig.textMultiplier * 2,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Icon(
              isArrow ? Icons.arrow_forward_ios_rounded : null,
              color: primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
