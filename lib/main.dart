import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:street_workout/constants/size_config.dart';
import 'package:street_workout/constants/style.dart';
import 'package:street_workout/firebase/authentication_service.dart';
import 'package:street_workout/routes/routes.dart';
import 'package:street_workout/screens/authentication_wrapper.dart';
import 'package:street_workout/screens/no_authentificate/component/user_information_gathering/animation_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MultiProvider(
              providers: [
                Provider<AuthenticationService>(
                  create: (context) => AuthenticationService(
                    FirebaseAuth.instance,
                  ),
                ),
                StreamProvider(
                  create: (context) =>
                      context.read<AuthenticationService>().authStateChanged,
                  initialData: null,
                ),
                ChangeNotifierProvider<AnimationModel>(
                  create: (context) => AnimationModel(),
                ),
              ],
              child: MaterialApp(
                title: 'Street Workout',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  primaryColor: accentColor,
                  scaffoldBackgroundColor: backgroundColor,
                  textTheme: GoogleFonts.montserratTextTheme(
                    Theme.of(context).textTheme,
                  ),
                ),
                onGenerateRoute: routeController,
                home:
                    const AuthenticationWrapper(), //ProductDescriptionScreen(),
              ),
            );
          },
        );
      },
    );
  }
}
