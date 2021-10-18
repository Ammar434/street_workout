import 'package:flutter/material.dart';
import 'package:street_workout/constants/size_config.dart';
import 'package:street_workout/data/machine_available.dart';

class MachineAvailableWidget extends StatelessWidget {
  const MachineAvailableWidget({
    Key? key,
    required this.machineList,
  }) : super(key: key);
  final List machineList;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ...List.generate(
          machineList.length,
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
            machineAvailable[machineList[index]]!.image,
          ),
        ),
      ),
    );
  }
}
