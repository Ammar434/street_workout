import 'package:flutter/material.dart';
import 'package:street_workout/constants/size_config.dart';
import 'package:street_workout/constants/style.dart';

class RegisterContainer extends StatelessWidget {
  const RegisterContainer({
    Key? key,
    required this.animationController,
    required this.containerSize,
    required this.isLogin,
  }) : super(key: key);

  final AnimationController animationController;
  final double containerSize;
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onTap: () {
          animationController.forward();
          // isLogin = !isLogin;
        },
        child: Container(
          width: double.infinity,
          height: containerSize,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: backgroundColorShade2,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                SizeConfig.heightMultiplier * 10,
              ),
              topRight: Radius.circular(
                SizeConfig.heightMultiplier * 10,
              ),
            ),
          ),
          child: isLogin
              ? Text(
                  "Don't have an account? Sign up",
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: SizeConfig.textMultiplier * 1.8,
                    fontWeight: FontWeight.w600,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
