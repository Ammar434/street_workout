import 'package:flutter/material.dart';
import 'package:street_workout/constants/size_config.dart';
import 'package:street_workout/constants/style.dart';
import 'package:street_workout/data/parcs_spots.dart';

import 'machine_available_widget.dart';

class ParcDisplayCard extends StatelessWidget {
  const ParcDisplayCard({
    Key? key,
    required this.index,
    required this.press,
  }) : super(key: key);
  final int index;
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.all(SizeConfig.widthMultiplier * 2),
        width: SizeConfig.widthMultiplier * 40,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1.3,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(SizeConfig.widthMultiplier * 3),
                    topRight: Radius.circular(SizeConfig.widthMultiplier * 3),
                  ),
                  image: DecorationImage(
                    image: AssetImage(parcsSpotsList[index].image[0]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              width: SizeConfig.widthMultiplier * 40,
              padding: EdgeInsets.all(SizeConfig.widthMultiplier * 3),
              decoration: BoxDecoration(
                color: backgroundColorShade,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(SizeConfig.widthMultiplier * 3),
                  bottomRight: Radius.circular(SizeConfig.widthMultiplier * 3),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    parcsSpotsList[index].name,
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: SizeConfig.textMultiplier * 1.8,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  MachineAvailableWidget(
                    i: index,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
