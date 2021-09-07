import 'package:flutter/material.dart';
import 'package:street_workout/constants/size_config.dart';

class VerticalSpacing extends StatelessWidget {
  const VerticalSpacing({
    Key? key,
    required this.of,
  }) : super(key: key);
  final int of;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.heightMultiplier * of,
    );
  }
}
