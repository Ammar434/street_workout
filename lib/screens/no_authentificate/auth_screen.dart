import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:street_workout/constants/size_config.dart';
import 'package:street_workout/constants/style.dart';
import 'package:street_workout/data/current_user.dart';
import 'package:street_workout/firebase/authentication_service.dart';
import 'package:street_workout/screens/no_authentificate/component/login_form.dart';
import 'package:street_workout/screens/no_authentificate/component/register_form.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  bool isLogin = true;
  late Animation<double> containerSize;
  late AnimationController animationController;
  late FirebaseAuth firebaseAuth;
  Duration animationDuration = const Duration(milliseconds: 270);
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: animationDuration,
    );

    firebaseAuth = FirebaseAuth.instance;
  }

  @override
  Widget build(BuildContext context) {
    double defaultRegisterSize = SizeConfig.heightMultiplier * 90;
    double viewInset = MediaQuery.of(context).viewInsets.bottom;
    containerSize = Tween<double>(
      begin: SizeConfig.heightMultiplier * 10,
      end: defaultRegisterSize,
    ).animate(
      CurvedAnimation(parent: animationController, curve: Curves.linear),
    );
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            LoginForm(
              isLogin: isLogin,
              animationDuration: animationDuration,
              onTap: () {
                AuthenticationService(firebaseAuth).signIn(
                  email: currentUserEmail,
                  password: currentUserPassword,
                );
              },
            ),
            AnimatedBuilder(
              animation: animationController,
              builder: (context, child) {
                if (viewInset == 0 && isLogin) {
                  return buildRegisterContainer();
                } else if (!isLogin) {
                  return buildRegisterContainer();
                }
                return Container();
              },
            ),
            RegisterForm(
              isLogin: isLogin,
              animationDuration: animationDuration,
              onTap: () {
                setState(
                  () {
                    isLogin = !isLogin;
                  },
                );
                AuthenticationService(firebaseAuth).signUp(
                  email: currentUserEmail,
                  password: currentUserPassword,
                );
              },
            ),
            AnimatedOpacity(
              opacity: isLogin ? 0.0 : 1.0,
              duration: animationDuration,
              child: Align(
                alignment: SizeConfig.isPortrait
                    ? Alignment.topCenter
                    : Alignment.bottomCenter,
                child: IconButton(
                  onPressed: isLogin
                      ? null
                      : () {
                          animationController.reverse();
                          setState(
                            () {
                              isLogin = !isLogin;
                            },
                          );
                        },
                  icon: const Icon(
                    Icons.close,
                  ),
                  color: primaryColor,
                  iconSize: SizeConfig.heightMultiplier * 4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Align buildRegisterContainer() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onTap: () {
          animationController.forward();
          setState(
            () {
              isLogin = !isLogin;
            },
          );
        },
        child: Container(
          width: double.infinity,
          height: containerSize.value,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: backgroundColorShade2,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                SizeConfig.heightMultiplier * 10,
              ),
              topRight: Radius.circular(
                SizeConfig.heightMultiplier * 10,
              ),
            ),
          ),
          child: isLogin
              ? Text(
                  "Don't have an account? Sign up",
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: SizeConfig.textMultiplier * 1.8,
                    fontWeight: FontWeight.w600,
                  ),
                )
              : null,
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    currentUserPassword = "";
    currentUserEmail = "";
    super.dispose();
  }
}
