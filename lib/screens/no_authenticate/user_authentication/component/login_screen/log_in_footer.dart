import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:street_workout/constants/size_config.dart';
import 'package:street_workout/data/current_user.dart';
import 'package:street_workout/firebase/authentication_service.dart';
import 'package:street_workout/routes/routes.dart';
import 'package:street_workout/screens/no_authenticate/user_authentication/component/rounded_button.dart';
import 'package:street_workout/widgets/vertical_spacing.dart';

class LogInFooter extends StatelessWidget {
  const LogInFooter({
    Key? key,
    required this.formKey,
  }) : super(key: key);
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't have an account?",
              style: TextStyle(
                color: Theme.of(context).disabledColor,
                fontSize: SizeConfig.textMultiplier * 2,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, registerScreen, (route) => true);
              },
              child: Text(
                "Register",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: SizeConfig.textMultiplier * 2,
                ),
              ),
            )
          ],
        ),
        const VerticalSpacing(of: 1),
        RoundedButton(
          text: "Sign In",
          press: () {
            if (formKey.currentState!.validate()) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Processing Data')),
              );
              context.read<AuthenticationService>().logIn(
                    email: currentUserEmail,
                    password: currentUserPassword,
                  );
              Navigator.of(context).pop();
            }
          },
        ),
      ],
    );
  }
}
