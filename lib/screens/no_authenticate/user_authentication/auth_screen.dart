import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:street_workout/constants/size_config.dart';
import 'package:street_workout/routes/routes.dart';
import 'package:street_workout/widgets/vertical_spacing.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);
  static const String name = "authScreen";

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: SizeConfig.heightMultiplier * 2,
              horizontal: SizeConfig.widthMultiplier * 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AspectRatio(
                aspectRatio: 3 / 2.5,
                child: Image.asset(
                  "assets/images/authentication/image0_authentication.png",
                ),
              ),
              Column(
                children: [
                  Text(
                    "Europe’s #1 fitness app",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: SizeConfig.textMultiplier * 5,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const VerticalSpacing(of: 1),
                  Text(
                    "Whatever your fitness level, achieve your goals quickly and build healthy habits with our app",
                    style: TextStyle(
                      color: Theme.of(context).disabledColor,
                      fontSize: SizeConfig.textMultiplier * 2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, registerScreen);
                      },
                      child: Container(
                        height: SizeConfig.heightMultiplier * 5,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                              SizeConfig.borderRadiusMultiplier * 2,
                            ),
                            bottomLeft: Radius.circular(
                              SizeConfig.borderRadiusMultiplier * 2,
                            ),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            "Register",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, loginScreen);
                      },
                      child: Container(
                        height: SizeConfig.heightMultiplier * 5,
                        decoration: BoxDecoration(
                          color: Theme.of(context).shadowColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(
                              SizeConfig.borderRadiusMultiplier * 2,
                            ),
                            bottomRight: Radius.circular(
                              SizeConfig.borderRadiusMultiplier * 2,
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Log In",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
