import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:street_workout/constants/size_config.dart';
import 'package:street_workout/constants/style.dart';
import 'package:street_workout/data/parcs_spots.dart';
import 'package:street_workout/widgets/vertical_spacing.dart';

class MachineAvailableWidget extends StatelessWidget {
  const MachineAvailableWidget({
    Key? key,
    required this.i,
  }) : super(key: key);
  final int i;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ...List.generate(
          parcsSpotsList[i].machineAvailable.length,
          (index) => buildMachineAvailableIcon(index),
        ),
      ],
    );
  }

  Container buildMachineAvailableIcon(index) {
    return Container(
      height: SizeConfig.heightMultiplier * 15,
      width: SizeConfig.widthMultiplier * 30,
      margin: EdgeInsets.symmetric(
        horizontal: SizeConfig.heightMultiplier * 1,
      ),
      decoration: BoxDecoration(
        color: backgroundColorShade2,
        borderRadius: BorderRadius.circular(SizeConfig.widthMultiplier * 5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: SizeConfig.heightMultiplier * 10,
            child: Center(
              child: Image.asset(
                parcsSpotsList[i].machineAvailable[index].image,
              ),
            ),
          ),
          const VerticalSpacing(of: 1),
          Text(
            parcsSpotsList[i].machineAvailable[index].name,
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: SizeConfig.textMultiplier * 2,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
