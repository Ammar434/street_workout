import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:street_workout/screens/authentificate/main_screen.dart';

import 'no_authentificate/component/user_information_gathering/user_information_gathering.dart';

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    if (firebaseUser == null) {
      return const UserInformationGathering();
    }
    return const MainScreen();
  }
}
