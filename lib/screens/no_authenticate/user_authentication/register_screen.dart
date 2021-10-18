import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/src/provider.dart';
import 'package:street_workout/constants/size_config.dart';
import 'package:street_workout/data/current_user.dart';
import 'package:street_workout/firebase/authentication_service.dart';
import 'package:street_workout/screens/no_authenticate/user_authentication/component/rounded_button.dart';
import 'package:street_workout/widgets/vertical_spacing.dart';

import 'component/rounded_input.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static const String name = "registerScreen";

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
          },
        ),
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
                const RegisterHeader(),
                RegisterForm(
                  formKey: _formKey,
                ),
                RoundedButton(
                  text: "Sign Up",
                  press: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                      context.read<AuthenticationService>().register(
                            email: currentUserPassword,
                            password: currentUserPassword,
                          );
                      //currentUserPassword = "";
                      //currentUserValidationPassword = "";
                      //currentUserEmail = "";
                      // Navigator.pushNamed(context, userInformationGathering);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Hey Welcome",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: SizeConfig.textMultiplier * 4,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.2,
          ),
        ),
        Text(
          "Let's create your ",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: SizeConfig.textMultiplier * 3.8,
          ),
        ),
        Text(
          "account!",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: SizeConfig.textMultiplier * 3.8,
          ),
        ),
        const VerticalSpacing(of: 10),
      ],
    );
  }
}
