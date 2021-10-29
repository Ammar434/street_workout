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
import 'package:theme_provider/theme_provider.dart';

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
            return ThemeProvider(
              saveThemesOnChange: true,
              loadThemeOnInit: true,
              defaultThemeId: "first_theme",
              themes: [
                AppTheme.light(),
                AppTheme.dark(),
                AppTheme(
                  id: "first_theme", // Id(or name) of the theme(Has to be unique)
                  description: "My Custom Theme", // Description of theme
                  data: ThemeData(
                    appBarTheme: const AppBarTheme(
                      color: Colors.transparent,
                      iconTheme: IconThemeData(
                        color: Colors.white,
                      ),
                    ),
                    primaryColor: primaryColor,
                    disabledColor: Colors.grey,
                    scaffoldBackgroundColor: backgroundColor,
                    shadowColor: backgroundColorShade2,
                    cardColor: backgroundColorShade2,
                    hintColor: accentColor,
                    textTheme: GoogleFonts.montserratTextTheme(
                      Theme.of(context).textTheme,
                    ),
                  ),
                ),
              ],
              child: ThemeConsumer(
                child: Builder(
                  builder: (themeContext) {
                    return MultiProvider(
                      providers: [
                        Provider<AuthenticationService>(
                          create: (_) => AuthenticationService(
                            firebaseAuth: FirebaseAuth.instance,
                          ),
                        ),
                        StreamProvider(
                          create: (context) => context
                              .read<AuthenticationService>()
                              .authStateChanged,
                          initialData: null,
                        ),
                      ],
                      child: MaterialApp(
                        title: 'Street Workout',
                        debugShowCheckedModeBanner: false,
                        theme: ThemeProvider.themeOf(themeContext).data,
                        onGenerateRoute: routeController,
                        home:
                            const AuthenticationWrapper(), //ProductDescriptionScreen(),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
