import 'package:flutter/material.dart';
import 'package:street_workout/constants/size_config.dart';
import 'package:street_workout/constants/style.dart';
import 'package:street_workout/data/machine_available.dart';

class MachineAvailableWidget extends StatelessWidget {
  final List parcMachineAvailable;

  const MachineAvailableWidget({Key? key, required this.parcMachineAvailable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.heightMultiplier * 15,
      child: ListView.builder(
        itemCount: parcMachineAvailable.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: SizeConfig.heightMultiplier * 15,
            margin: EdgeInsets.all(
              SizeConfig.widthMultiplier * 1,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                SizeConfig.heightMultiplier * 5,
              ),
              color: backgroundColorShade2,
            ),
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 3 / 2,
                  child: Image.asset(
                    machineAvailable[parcMachineAvailable[index]]!.image,
                  ),
                ),
                Text(
                  machineAvailable[parcMachineAvailable[index]]!.name,
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
