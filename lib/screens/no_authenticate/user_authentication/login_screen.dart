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

import 'component/rounded_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String name = "loginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: SizeConfig.heightMultiplier * 90,
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: SizeConfig.heightMultiplier * 2,
                horizontal: SizeConfig.widthMultiplier * 5),
            child: Column(
              children: [
                const LogInHeader(),
                LogInForm(formKey: _formKey),
                LogInFooter(formKey: _formKey),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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

class LogInHeader extends StatelessWidget {
  const LogInHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Let's sign you in",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: SizeConfig.textMultiplier * 4,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.2,
          ),
        ),
        Text(
          "Welcome back",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: SizeConfig.textMultiplier * 3.8,
          ),
        ),
        Text(
          "You've been missed!",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: SizeConfig.textMultiplier * 3.8,
          ),
        ),
        const VerticalSpacing(of: 10)
      ],
    );
  }
}
