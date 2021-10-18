import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:street_workout/firebase/user_registration.dart';
import 'package:street_workout/widgets/custom_circular_progress_indicator.dart';

import 'authentificate/main_screen.dart';
import 'no_authenticate/user_authentication/auth_screen.dart';
import 'no_authenticate/user_information_gathering/user_information_gathering.dart';

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    if (firebaseUser != null) {
      // return const MainScreen();

      return FutureBuilder(
        future: UserRegistration()
            .checkIfUserAlreadyPresent(userId: firebaseUser.uid),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  '${snapshot.error} occurred',
                  style: const TextStyle(fontSize: 18),
                ),
              );
            } else if (snapshot.hasData) {
              if (snapshot.data == false) {
                return const UserInformationGathering();
              }
              return const MainScreen();
            }
          }
          return const CustomCircularProgressIndicator(isVisible: true);
        },
      );
    }
    return const AuthScreen();
  }
}
