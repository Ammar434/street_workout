import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:street_workout/screens/authentificate/main_screen.dart';
import 'package:street_workout/screens/authentificate/parc_description_screen/parc_description_screen.dart';
import 'package:street_workout/screens/authentificate/user_description_screen/user_description_screen.dart';

const String parcsDescription = ParcDescriptionScreen.name;
const String userDescription = UserDescriptionScreen.name;
const String mainScreen = MainScreen.name;
Route<dynamic> routeController(RouteSettings settings) {
  switch (settings.name) {
    case mainScreen:
      return MaterialPageRoute(
        builder: (context) => const MainScreen(),
      );
    case parcsDescription:
      return MaterialPageRoute(
        builder: (context) => const ParcDescriptionScreen(),
      );
    case userDescription:
      return MaterialPageRoute(
        builder: (context) => const UserDescriptionScreen(),
      );
    default:
      throw ("Not exist");
  }
}
