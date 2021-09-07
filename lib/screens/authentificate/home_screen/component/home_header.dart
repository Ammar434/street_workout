import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:street_workout/constants/size_config.dart';
import 'package:street_workout/constants/style.dart';
import 'package:street_workout/screens/authentificate/home_screen/component/search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Center(
          child: Image.asset(
            'assets/images/image1.png',
            height: SizeConfig.heightMultiplier * 30,
            fit: BoxFit.contain,
          ),
        ),
        DefaultTextStyle(
          style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.w900,
              fontSize: SizeConfig.textMultiplier * 3),
          child: AnimatedTextKit(
            animatedTexts: [
              WavyAnimatedText(
                'It all started',
              ),
              WavyAnimatedText('with a pull up'),
            ],
            isRepeatingAnimation: true,
            onTap: () {},
          ),
        ),
        Positioned(
          bottom: -25,
          child: Container(
            height: SizeConfig.heightMultiplier * 6,
            width: SizeConfig.widthMultiplier * 80,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.circular(SizeConfig.widthMultiplier * 2),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: const SearchField(),
          ),
        ),
      ],
    );
  }
}
