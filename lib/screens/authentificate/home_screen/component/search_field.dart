import 'package:flutter/material.dart';
import 'package:street_workout/constants/size_config.dart';
import 'package:street_workout/constants/style.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Trouve ton parc",
        hintStyle: TextStyle(
          fontSize: SizeConfig.textMultiplier * 2,
          color: backgroundColor,
        ),
        contentPadding: EdgeInsets.symmetric(
            horizontal: SizeConfig.widthMultiplier * 3,
            vertical: SizeConfig.heightMultiplier * 2),
        suffixIcon: const Icon(Icons.search),
      ),
    );
  }
}
