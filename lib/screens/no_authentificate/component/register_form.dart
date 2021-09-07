import 'package:flutter/material.dart';
import 'package:street_workout/constants/size_config.dart';
import 'package:street_workout/constants/style.dart';
import 'package:street_workout/data/current_user.dart';
import 'package:street_workout/screens/no_authentificate/component/rounded_button.dart';
import 'package:street_workout/screens/no_authentificate/component/rounded_input.dart';
import 'package:street_workout/screens/no_authentificate/component/teddy_animation.dart';
import 'package:street_workout/widgets/vertical_spacing.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    Key? key,
    required this.animationDuration,
    required this.isLogin,
    required this.onTap,
  }) : super(key: key);

  final Duration animationDuration;
  final bool isLogin;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: !isLogin ? 1.0 : 0.0,
      duration: animationDuration * 5,
      child: Visibility(
        visible: !isLogin,
        child: Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: double.infinity,
            height: SizeConfig.heightMultiplier * 80,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Welcome",
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
                    text: "Name",
                    iconData: Icons.person,
                    isObscure: false,
                    press: (value) {
                      currentUserName = value;
                    },
                  ),
                  RoundedInput(
                    text: "E-mail",
                    iconData: Icons.mail,
                    isObscure: false,
                    press: (value) {
                      currentUserEmail = value;
                    },
                  ),
                  RoundedInput(
                    text: "Password",
                    iconData: Icons.lock,
                    isObscure: true,
                    press: (value) {
                      currentUserPassword = value;
                    },
                  ),
                  RoundedButton(
                    text: 'Sign Up',
                    press: onTap,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
