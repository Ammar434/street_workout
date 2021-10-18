import 'package:flutter/material.dart';
import 'package:street_workout/constants/size_config.dart';
import 'package:street_workout/constants/style.dart';
import 'package:street_workout/widgets/vertical_spacing.dart';

class UserInformationGatheringPage extends StatelessWidget {
  const UserInformationGatheringPage({
    Key? key,
    required this.image,
    required this.hintText,
    required this.onChanged,
  }) : super(key: key);

  final String image;
  final String hintText;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VerticalSpacing(of: 20),
        AspectRatio(
          aspectRatio: 3 / 2,
          child: Image.asset(
            image,
          ),
        ),
        const VerticalSpacing(of: 5),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: primaryColor,
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: SizeConfig.textMultiplier * 2,
                color: backgroundColor,
              ),
              contentPadding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.widthMultiplier * 3,
                  vertical: SizeConfig.heightMultiplier * 2),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
            },
            onChanged: onChanged,
            onEditingComplete: () {},
          ),
        ),
      ],
    );
  }
}
