import 'package:flutter/material.dart';
import 'package:street_workout/constants/size_config.dart';
import 'package:street_workout/constants/style.dart';
import 'package:street_workout/widgets/vertical_spacing.dart';

import 'component/custom_floatting_action_button.dart';
import 'component/machine_available_widget.dart';

class ParcDescriptionScreen extends StatefulWidget {
  const ParcDescriptionScreen({
    Key? key,
    required this.parcName,
    required this.parcAddress,
    required this.parcImageList,
    required this.parcDescription,
    required this.parcMachineAvailable,
  }) : super(key: key);
  static const String name = "parcDescription";
  final String parcName;
  final String parcAddress;
  final String parcDescription;
  final List parcImageList;
  final List parcMachineAvailable;
  @override
  State<ParcDescriptionScreen> createState() => _ParcDescriptionScreenState();
}

class _ParcDescriptionScreenState extends State<ParcDescriptionScreen> {
  String _currentImage =
      "https://firebasestorage.googleapis.com/v0/b/streetworkoutapp-321919.appspot.com/o/defaultImage%2Fimage1.png?alt=media&token=217541fb-833b-4600-ae7d-57404ab4c5bf";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: CustomFloattingActionButton(
          onTap: () {},
        ),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: backgroundColor,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: iconColor,
              size: SizeConfig.textMultiplier * 2,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.widthMultiplier * 3,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  widget.parcName,
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: SizeConfig.textMultiplier * 3,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.1),
                ),
                Text(
                  widget.parcAddress,
                  style: TextStyle(
                    color: iconColor,
                    fontSize: SizeConfig.textMultiplier * 2,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.1,
                  ),
                ),
                const VerticalSpacing(of: 2),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 40,
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: ListView.builder(
                            itemCount: widget.parcImageList.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return AspectRatio(
                                aspectRatio: 1,
                                child: GestureDetector(
                                  child: Container(
                                    margin: EdgeInsets.all(
                                      SizeConfig.widthMultiplier * 1,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        SizeConfig.widthMultiplier * 5,
                                      ),
                                      color: backgroundColorShade2,
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          widget.parcImageList[index],
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Image.network(
                          _currentImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                const VerticalSpacing(of: 2),
                Text(
                  'Description',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: SizeConfig.textMultiplier * 3,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.1,
                  ),
                ),
                const VerticalSpacing(of: 1),
                Text(
                  widget.parcDescription,
                  style: TextStyle(
                    color: iconColor,
                    fontSize: SizeConfig.textMultiplier * 1.8,
                    letterSpacing: 1,
                  ),
                ),
                const VerticalSpacing(of: 1),
                Text(
                  'Matériel disponible',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: SizeConfig.textMultiplier * 2.5,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.1,
                  ),
                ),
                const VerticalSpacing(of: 1),
                MachineAvailableWidget(
                  parcMachineAvailable: widget.parcMachineAvailable,
                ),
                const VerticalSpacing(of: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
