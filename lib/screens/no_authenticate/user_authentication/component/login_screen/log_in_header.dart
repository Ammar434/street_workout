import 'package:flutter/material.dart';
import 'package:street_workout/constants/size_config.dart';
import 'package:street_workout/widgets/vertical_spacing.dart';

class LogInHeader extends StatelessWidget {
  const LogInHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Let's sign you in",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: SizeConfig.textMultiplier * 4,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.2,
          ),
        ),
        Text(
          "Welcome back",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: SizeConfig.textMultiplier * 3.8,
          ),
        ),
        Text(
          "You've been missed!",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: SizeConfig.textMultiplier * 3.8,
          ),
        ),
        const VerticalSpacing(of: 10)
      ],
    );
  }
}
