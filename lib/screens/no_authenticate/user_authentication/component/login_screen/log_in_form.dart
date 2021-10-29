import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/src/provider.dart';
import 'package:street_workout/constants/size_config.dart';
import 'package:street_workout/data/current_user.dart';
import 'package:street_workout/firebase/authentication_service.dart';
import 'package:street_workout/routes/routes.dart';
import 'package:street_workout/screens/no_authenticate/user_authentication/component/rounded_button.dart';
import 'package:street_workout/widgets/vertical_spacing.dart';

import '../rounded_input.dart';

class LogInForm extends StatelessWidget {
  const LogInForm({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Expanded(
        flex: 2,
        child: Column(
          children: [
            RoundedInput(
              press: (pwd) {
                currentUserPassword = pwd;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your mail';
                }
                if (!EmailValidator.validate(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
              isObscure: false,
              text: 'Enter email',
              iconData: null,
            ),
            RoundedInput(
              press: (pwd) {
                currentUserPassword = pwd;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password';
                }
                if (value.length < 7) {
                  return 'Please enter a longer password';
                }
                return null;
              },
              isObscure: true,
              iconData: FontAwesomeIcons.eyeSlash,
              iconData2: FontAwesomeIcons.eye,
              text: 'Enter password',
            ),
          ],
        ),
      ),
    );
  }
}
