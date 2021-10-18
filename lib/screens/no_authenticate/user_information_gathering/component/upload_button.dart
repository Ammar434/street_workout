import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:street_workout/constants/size_config.dart';
import 'package:street_workout/constants/style.dart';
import 'package:street_workout/widgets/vertical_spacing.dart';

class UploadButton extends StatelessWidget {
  const UploadButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: SizeConfig.heightMultiplier * 20,
        width: SizeConfig.heightMultiplier * 20,
        decoration: BoxDecoration(
          color: backgroundColorShade2,
          borderRadius: BorderRadius.circular(
            SizeConfig.heightMultiplier * 5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              FontAwesomeIcons.camera,
              size: SizeConfig.heightMultiplier * 5,
              color: primaryColor,
            ),
            const VerticalSpacing(of: 2),
            Text(
              "Upload Your Image",
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
