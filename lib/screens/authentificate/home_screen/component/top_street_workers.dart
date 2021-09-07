import 'package:flutter/material.dart';

import 'package:street_workout/constants/size_config.dart';
import 'package:street_workout/constants/style.dart';
import 'package:street_workout/data/top_street_workers.dart';
import 'package:street_workout/routes/routes.dart';
import 'package:street_workout/screens/authentificate/home_screen/component/top_street_workers_card.dart';
import 'package:street_workout/screens/authentificate/user_description_screen/user_description_screen.dart';

class TopStreetWorkers extends StatelessWidget {
  const TopStreetWorkers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: SizeConfig.widthMultiplier * 1,
      ),
      padding: EdgeInsets.all(SizeConfig.widthMultiplier * 1),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(SizeConfig.heightMultiplier * 1),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...List.generate(
              topStreetWorkersList.length,
              (index) => TopStreetWorkersCard(
                index: index,
                press: () =>  Navigator.pushNamed(context, userDescription),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
