import 'package:flutter/material.dart';
import 'package:street_workout/constants/size_config.dart';
import 'package:street_workout/constants/style.dart';
import 'package:street_workout/firebase/user_model.dart';
import 'package:street_workout/firebase/user_registration.dart';
import 'package:street_workout/routes/routes.dart';
import 'package:street_workout/screens/no_authenticate/user_information_gathering/shared/globals.dart';
import 'package:street_workout/widgets/vertical_spacing.dart';

import 'component/user_information_gathering_list.dart';

//TODO: erreur lors du comptage sur cercle
class UserInformationGathering extends StatefulWidget {
  const UserInformationGathering({Key? key}) : super(key: key);
  static const String name = "userInformationGatheringScreen";
  @override
  _UserInformationGatheringState createState() =>
      _UserInformationGatheringState();
}

class _UserInformationGatheringState extends State<UserInformationGathering>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this);
    pageController = PageController();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool showProgress = false;
    int index = 0;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: showProgress == true
              ? Container(
                  color: backgroundColor,
                  child: Center(
                    child: CircularProgressIndicator(
                      backgroundColor: primaryColor,
                      color: accentColor,
                    ),
                  ),
                )
              : SingleChildScrollView(
                  child: SizedBox(
                    height: SizeConfig.heightMultiplier * 100,
                    width: SizeConfig.widthMultiplier * 100,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: PageView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            controller: pageController,
                            itemCount: userInformationGatheringList.length,
                            itemBuilder: (context, index) {
                              return userInformationGatheringList[index];
                            },
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            index++;
                            if (index >
                                userInformationGatheringList.length - 1) {
                              setState(
                                () {
                                  showProgress = true;
                                },
                              );
                              await UserRegistration()
                                  .registerNewUser(tmpUser: tmpUser);
                              setState(
                                () {
                                  showProgress = false;
                                },
                              );
                              Navigator.pushNamed(context, mainScreen);
                            }

                            pageController.animateToPage(
                              index,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOutQuad,
                            );
                          },
                          child: Container(
                            width: Global.radius,
                            height: Global.radius,
                            decoration: BoxDecoration(
                              color: Global.palette[1],
                              borderRadius: BorderRadius.circular(
                                Global.radius,
                              ),
                            ),
                            child: Icon(
                              Icons.keyboard_arrow_right,
                              color: primaryColor,
                            ),
                          ),
                        ),
                        const VerticalSpacing(of: 5),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
