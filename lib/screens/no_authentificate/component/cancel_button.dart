import 'package:flutter/material.dart';
import 'package:street_workout/constants/size_config.dart';
import 'package:street_workout/constants/style.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({
    Key? key,
    required this.isLogin,
    required this.animationDuration,
    required this.press,
  }) : super(key: key);

  final bool isLogin;
  final Duration animationDuration;
  final GestureTapCallback? press;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isLogin ? 0.0 : 1.0,
      duration: animationDuration,
      child: Align(
        alignment: Alignment.topCenter,
        child: IconButton(
          onPressed: press,
          icon: const Icon(
            Icons.close,
          ),
          color: primaryColor,
          iconSize: SizeConfig.heightMultiplier * 4,
        ),
      ),
    );
  }
}
