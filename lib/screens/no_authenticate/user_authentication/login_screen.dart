import 'package:flutter/material.dart';
import 'package:street_workout/constants/size_config.dart';

import 'component/login_screen/log_in_footer.dart';
import 'component/login_screen/log_in_form.dart';
import 'component/login_screen/log_in_header.dart';

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
          height: SizeConfig.heightMultiplier * 80,
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
