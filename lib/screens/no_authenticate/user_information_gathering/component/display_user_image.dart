import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:street_workout/constants/size_config.dart';
import 'package:street_workout/constants/style.dart';

class DisplayUserImage extends StatelessWidget {
  const DisplayUserImage({
    Key? key,
    required this.imageUrl,
    required this.onTap,
  }) : super(key: key);

  final String imageUrl;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
          maxRadius: SizeConfig.heightMultiplier * 10,
        ),
        Positioned(
          right: -5,
          top: 0,
          child: GestureDetector(
            onTap: onTap,
            child: CircleAvatar(
              backgroundColor: primaryColor,
              maxRadius: SizeConfig.heightMultiplier * 4,
              child: Center(
                child: Icon(
                  Icons.edit,
                  color: backgroundColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
