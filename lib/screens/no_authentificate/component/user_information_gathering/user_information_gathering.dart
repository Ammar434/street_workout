import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:street_workout/constants/size_config.dart';
import 'package:street_workout/screens/no_authentificate/component/user_information_gathering/shared/globals.dart';

import 'animation_model.dart';

class UserInformationGathering extends StatefulWidget {
  const UserInformationGathering({Key? key}) : super(key: key);

  @override
  _UserInformationGatheringState createState() =>
      _UserInformationGatheringState();
}

class _UserInformationGatheringState extends State<UserInformationGathering>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation startAnimation;
  late Animation endAnimation;
  late Animation horizontalAnimation;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 750,
      ),
    );
    startAnimation = CurvedAnimation(
      parent: animationController,
      curve: const Interval(
        0.000,
        .500,
        curve: Curves.easeInExpo,
      ),
    );
    endAnimation = CurvedAnimation(
      parent: animationController,
      curve: const Interval(
        0.500,
        1.000,
        curve: Curves.easeOutExpo,
      ),
    );
    horizontalAnimation = CurvedAnimation(
      parent: animationController,
      curve: const Interval(
        0.750,
        1.000,
        curve: Curves.easeInOutQuad,
      ),
    );
    animationController
      ..addStatusListener((status) {
        final model = Provider.of<AnimationModel>(context);
        if (status == AnimationStatus.completed) {
          model.swapColors;
          animationController.reset();
        }
      })
      ..addListener(
        () {
          final model = Provider.of<AnimationModel>(context);
          if (animationController.value > 0.5) {
            model.isHalfWay = true;
          } else {
            model.isHalfWay = false;
          }
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AnimationModel>(context, listen: false);
    return Scaffold(
      backgroundColor:
          model.isHalfWay ? model.foreGroundColor : model.backGroundColor,
      body: Stack(
        children: [
          Container(
            color:
                model.isHalfWay ? model.foreGroundColor : model.backGroundColor,
            width: SizeConfig.widthMultiplier * 50 - Global.radius / 2,
            height: double.infinity,
          ),
          Transform(
            transform: Matrix4.identity()
              ..translate(
                SizeConfig.widthMultiplier * 50 - Global.radius / 2,
                SizeConfig.heightMultiplier * 100 -
                    Global.radius -
                    Global.bottomPadding,
              ),
            child: GestureDetector(
              onTap: () {
                if (animationController.status != AnimationStatus.forward) {
                  model.isToggled = !model.isToggled;
                  model.index++;
                  if (model.index > 3) {
                    model.index = 0;
                  }
                  pageController.animateToPage(
                    model.index,
                    duration: const Duration(milliseconds: 50 0),
                    curve: Curves.easeInOutQuad,
                  );
                }
              },
              child: Stack(),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
