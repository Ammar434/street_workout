import 'package:flutter/material.dart';
import 'package:street_workout/constants/size_config.dart';
import 'package:street_workout/data/parcs_spots.dart';

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
      height: SizeConfig.heightMultiplier * 5,
      width: SizeConfig.widthMultiplier * 5,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage(
            parcsSpotsList[i].machineAvailable[index].image,
          ),
        ),
      ),
    );
  }
}
