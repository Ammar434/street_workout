import 'package:flutter/material.dart';
import 'package:street_workout/constants/size_config.dart';
import 'package:street_workout/constants/style.dart';
import 'package:street_workout/data/top_street_workers.dart';

class TopStreetWorkersCard extends StatelessWidget {
  const TopStreetWorkersCard({
    Key? key,
    required this.index,
    required this.press,
  }) : super(key: key);
  final int index;
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(SizeConfig.widthMultiplier * 3),
      child: GestureDetector(
        onTap: press,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.network(
                topStreetWorkersList[index].image,
                height: SizeConfig.heightMultiplier * 8,
                width: SizeConfig.heightMultiplier * 8,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 1,
            ),
            Text(
              topStreetWorkersList[index].name,
              style: TextStyle(color: primaryColor),
            )
          ],
        ),
      ),
    );
  }
}
