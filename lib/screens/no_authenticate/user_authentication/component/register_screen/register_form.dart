import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:street_workout/data/current_user.dart';

import '../rounded_input.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Expanded(
        child: Column(
          children: [
            RoundedInput(
              press: (pwd) {
                currentUserEmail = pwd;
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
            RoundedInput(
              press: (pwd) {
                currentUserValidationPassword = pwd;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please confirm your password';
                }
                if (currentUserPassword != value) {
                  return 'Not the same password';
                }
                return null;
              },
              isObscure: true,
              iconData: FontAwesomeIcons.eyeSlash,
              iconData2: FontAwesomeIcons.eye,
              text: 'Confirm your password',
            ),
          ],
        ),
      ),
    );
  }
}
