import 'package:flutter/material.dart';
import 'package:street_workout/constants/size_config.dart';
import 'package:street_workout/widgets/vertical_spacing.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Hey Welcome",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: SizeConfig.textMultiplier * 4,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.2,
          ),
        ),
        Text(
          "Let's create your ",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: SizeConfig.textMultiplier * 3.8,
          ),
        ),
        Text(
          "account!",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: SizeConfig.textMultiplier * 3.8,
          ),
        ),
        const VerticalSpacing(of: 10),
      ],
    );
  }
}
