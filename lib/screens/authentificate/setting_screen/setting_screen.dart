import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:street_workout/constants/size_config.dart';
import 'package:street_workout/constants/style.dart';
import 'package:street_workout/data/current_user.dart';
import 'package:street_workout/screens/authentificate/setting_screen/component/settings_group.dart';
import 'package:street_workout/widgets/vertical_spacing.dart';

import 'component/settings_tile.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 2),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const VerticalSpacing(of: 5),
            SizedBox(
              height: SizeConfig.heightMultiplier * 20,
              child: Row(
                children: [
                  Expanded(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(currentUserImage),
                          maxRadius: SizeConfig.heightMultiplier * 6,
                        ),
                        Positioned(
                          right: -5,
                          top: 0,
                          child: CircleAvatar(
                            backgroundColor: primaryColor,
                            maxRadius: SizeConfig.heightMultiplier * 2,
                            child: Center(
                              child: Icon(
                                Icons.edit,
                                color: backgroundColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      currentUserName,
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.textMultiplier * 3,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            SettingsGroup(
              textSettingGroup: "General",
              widgetList: [
                SettingsTile(
                  icon: Icons.person,
                  iconBackgroundColor: Colors.green,
                  text1: "Account Settings",
                  text2: "Privacy, Security, Language",
                  isArrow: true,
                  press: () {},
                ),
                SettingsTile(
                  icon: Icons.notifications,
                  iconBackgroundColor: Colors.orange,
                  text1: "Notifications",
                  text2: "Newsletter, App Updates",
                  isArrow: true,
                  press: () {},
                ),
                SettingsTile(
                  icon: Icons.logout,
                  iconBackgroundColor: Colors.teal,
                  text1: "Logout",
                  text2: "",
                  isArrow: false,
                  press: () {},
                ),
                SettingsTile(
                  icon: Icons.delete,
                  iconBackgroundColor: Colors.red,
                  text1: "Delete Account",
                  text2: "",
                  isArrow: false,
                  press: () {},
                ),
              ],
            ),
            const VerticalSpacing(of: 2),
            SettingsGroup(
              textSettingGroup: 'Feedback',
              widgetList: [
                SettingsTile(
                  icon: Icons.bug_report,
                  iconBackgroundColor: Colors.purple,
                  text1: "Report a bug",
                  text2: "",
                  isArrow: false,
                  press: () {},
                ),
                SettingsTile(
                  icon: Icons.thumb_up,
                  iconBackgroundColor: Colors.pink,
                  text1: "Sent a feedback",
                  text2: "",
                  isArrow: false,
                  press: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
