import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/src/provider.dart';
import 'package:street_workout/constants/size_config.dart';
import 'package:street_workout/constants/style.dart';
import 'package:street_workout/data/current_user.dart';
import 'package:street_workout/firebase/authentication_service.dart';
import 'package:street_workout/routes/routes.dart';
import 'package:street_workout/routes/screen_to_display.dart';
import 'package:street_workout/screens/authentificate/drawer_screen/component/drawer_item.dart';
import 'package:street_workout/widgets/vertical_spacing.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: SizedBox(
            height: SizeConfig.heightMultiplier * 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const VerticalSpacing(of: 8),
                Padding(
                  padding:
                      EdgeInsets.only(left: SizeConfig.widthMultiplier * 10),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(currentUserImage),
                    maxRadius: SizeConfig.heightMultiplier * 3,
                  ),
                ),
                const VerticalSpacing(of: 3),
                DrawerItem(
                  iconData: FontAwesomeIcons.home,
                  text: 'Home',
                  press: () {
                    setState(
                      () {
                        selectedTab = SelectedTab.home;
                      },
                    );
                    Navigator.pushNamed(context, mainScreen);
                  },
                ),
                DrawerItem(
                  iconData: FontAwesomeIcons.map,
                  text: 'Map',
                  press: () {
                    setState(
                      () {
                        selectedTab = SelectedTab.map;
                      },
                    );
                    Navigator.pushNamed(context, mainScreen);
                  },
                ),
                DrawerItem(
                  iconData: FontAwesomeIcons.trophy,
                  text: 'Rank',
                  press: () {
                    setState(
                      () {
                        selectedTab = SelectedTab.leaderboard;
                      },
                    );
                    Navigator.pushNamed(context, mainScreen);
                  },
                ),
                DrawerItem(
                  iconData: FontAwesomeIcons.cog,
                  text: 'Setting',
                  press: () {
                    setState(
                      () {
                        selectedTab = SelectedTab.setting;
                      },
                    );
                    Navigator.pushNamed(context, mainScreen);
                  },
                ),
                const VerticalSpacing(of: 10),
                GestureDetector(
                  onTap: () async {
                    context.read<AuthenticationService>().signOut();
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: SizeConfig.widthMultiplier * 10),
                    child: Text(
                      'Se déconnecter',
                      style: TextStyle(
                        fontSize: SizeConfig.textMultiplier * 2,
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
