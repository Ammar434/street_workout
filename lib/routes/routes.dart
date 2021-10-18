import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:street_workout/screens/authentificate/main_screen.dart';
import 'package:street_workout/screens/authentificate/parc_description_screen/parc_description_screen.dart';
import 'package:street_workout/screens/authentificate/user_description_screen/user_description_screen.dart';
import 'package:street_workout/screens/no_authenticate/user_authentication/auth_screen.dart';
import 'package:street_workout/screens/no_authenticate/user_authentication/login_screen.dart';
import 'package:street_workout/screens/no_authenticate/user_authentication/register_screen.dart';
import 'package:street_workout/screens/no_authenticate/user_information_gathering/user_information_gathering.dart';

const String parcsDescription = ParcDescriptionScreen.name;
const String userDescription = UserDescriptionScreen.name;
const String mainScreen = MainScreen.name;
const String userInformationGathering = UserInformationGathering.name;
const String authScreen = AuthScreen.name;
const String loginScreen = LoginScreen.name;
const String registerScreen = RegisterScreen.name;
Route<dynamic> routeController(RouteSettings settings) {
  switch (settings.name) {
    case mainScreen:
      return MaterialPageRoute(
        builder: (context) => const MainScreen(),
      );
    case parcsDescription:
      return MaterialPageRoute(
        builder: (context) => const ParcDescriptionScreen(
          parcImageList: [],
          parcName: '',
          parcAddress: '',
          parcDescription: '',
          parcMachineAvailable: [],
        ),
      );
    case userDescription:
      return MaterialPageRoute(
        builder: (context) => const UserDescriptionScreen(
          image: "",
          numberFollowers: 0,
          numberParcs: 0,
          numberFollowing: 0,
          userName: "",
          userSurname: "",
          userBio: "",
          userPhotos: [],
          userRewards: [],
        ),
      );
    case userInformationGathering:
      return MaterialPageRoute(
        builder: (context) => const UserInformationGathering(),
      );
    case loginScreen:
      return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      );
    case registerScreen:
      return MaterialPageRoute(
        builder: (context) => const RegisterScreen(),
      );
    default:
      throw ("Not exist");
  }
}
