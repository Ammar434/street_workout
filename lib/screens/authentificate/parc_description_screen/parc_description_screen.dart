import 'package:flutter/material.dart';
import 'package:street_workout/constants/size_config.dart';
import 'package:street_workout/constants/style.dart';
import 'package:street_workout/constants/text_example_parc_description.dart';
import 'package:street_workout/data/parcs_spots.dart';
import 'package:street_workout/widgets/vertical_spacing.dart';

import 'component/machine_available.dart';

class ParcDescriptionScreen extends StatefulWidget {
  const ParcDescriptionScreen({Key? key}) : super(key: key);
  static const String name = "parcDescription";
  @override
  State<ParcDescriptionScreen> createState() => _ParcDescriptionScreenState();
}

class _ParcDescriptionScreenState extends State<ParcDescriptionScreen> {
  String _currentImage = parcsSpotsList[0].image[0];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: backgroundColorShade2,
          icon: Icon(
            Icons.assistant_navigation,
            color: primaryColor,
          ),
          label: Text(
            'Se rendre',
            style: TextStyle(
              color: primaryColor,
            ),
          ),
        ),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
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
                  'Jardin des Voltiges',
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: SizeConfig.textMultiplier * 3,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.1),
                ),
                Text(
                  'All. du Cercle, 75019 Paris',
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
                            itemCount: parcsSpotsList[0].image.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return AspectRatio(
                                aspectRatio: 1,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(
                                      () {
                                        _currentImage =
                                            parcsSpotsList[0].image[index];
                                      },
                                    );
                                  },
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
                                        image: AssetImage(
                                          parcsSpotsList[0].image[index],
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
                        child: Image.asset(
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
                      letterSpacing: 1.1),
                ),
                const VerticalSpacing(of: 1),
                Text(
                  parcDescription,
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
                      letterSpacing: 1.1),
                ),
                const VerticalSpacing(of: 1),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: MachineAvailableWidget(
                    i: 0,
                  ),
                ),
                const VerticalSpacing(of: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
