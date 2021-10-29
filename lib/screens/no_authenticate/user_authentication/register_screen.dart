import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:street_workout/constants/size_config.dart';
import 'package:street_workout/data/current_user.dart';
import 'package:street_workout/firebase/authentication_service.dart';
import 'package:street_workout/screens/no_authenticate/user_authentication/component/rounded_button.dart';

import 'component/register_screen/register_form.dart';
import 'component/register_screen/register_header.dart';

//TODO: erreur message à affiché si compte existe deja
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
          height: SizeConfig.heightMultiplier * 80,
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
                            email: currentUserEmail,
                            password: currentUserPassword,
                          );
                      Navigator.pop(context);
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
