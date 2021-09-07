import 'package:flutter/material.dart';
import 'package:street_workout/constants/size_config.dart';
import 'package:street_workout/constants/style.dart';
import 'package:street_workout/data/current_user.dart';
import 'package:street_workout/screens/no_authentificate/component/rounded_button.dart';
import 'package:street_workout/screens/no_authentificate/component/rounded_input.dart';
import 'package:street_workout/screens/no_authentificate/component/teddy_animation.dart';
import 'package:street_workout/widgets/vertical_spacing.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
    required this.animationDuration,
    required this.onTap,
    required this.isLogin,
  }) : super(key: key);

  final Duration animationDuration;
  final GestureTapCallback onTap;
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    double defaultLoginSize = SizeConfig.heightMultiplier * 80;
    return AnimatedOpacity(
      opacity: isLogin ? 1.0 : 0.0,
      duration: animationDuration * 4,
      child: Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            height: defaultLoginSize,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.textMultiplier * 2,
                  ),
                ),
                const TeddyAnimation(),
                const VerticalSpacing(
                  of: 2,
                ),
                RoundedInput(
                  text: "Username",
                  iconData: Icons.mail,
                  isObscure: false,
                  press: (value) {
                    currentUserEmail = value;
                  },
                ),
                RoundedInput(
                  text: "Password",
                  iconData: Icons.lock,
                  isObscure: false,
                  press: (value) {
                    currentUserPassword = value;
                  },
                ),
                RoundedButton(
                  text: 'Login',
                  press: onTap,
                ),
                const VerticalSpacing(
                  of: 12,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
