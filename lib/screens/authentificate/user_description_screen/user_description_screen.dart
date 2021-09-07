import 'package:animated_button/animated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:street_workout/constants/size_config.dart';
import 'package:street_workout/constants/style.dart';
import 'package:street_workout/data/top_street_workers.dart';
import 'package:street_workout/widgets/vertical_spacing.dart';

import 'component/stats_widget.dart';

class UserDescriptionScreen extends StatelessWidget {
  static const String name = "userDescription";

  const UserDescriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: primaryColor,
          ),
        ),
      ),
      body: SlidingUpPanel(
        maxHeight: SizeConfig.heightMultiplier * 80,
        color: Colors.transparent,
        body: Image.network(
          topStreetWorkersList[0].image,
          fit: BoxFit.cover,
        ),
        panel: Column(
          children: [
            const StatsWidget(
              numberFolowers: 1400,
              numberParcs: 35,
              numberFolowings: 100,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      25,
                    ),
                    topRight: Radius.circular(
                      25,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Text(
                            '${topStreetWorkersList[0].name} ${topStreetWorkersList[0].surname}',
                            style: TextStyle(
                              fontSize: SizeConfig.textMultiplier * 2.5,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const Spacer(),
                          AnimatedButton(
                            child: const Text(
                              'Follow',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            onPressed: () {},
                            height: 40,
                            shadowDegree: ShadowDegree.dark,
                            color: backgroundColorShade2,
                          ),
                        ],
                      ),
                      const VerticalSpacing(of: 1),
                      Text(
                        topStreetWorkersList[0].bio,
                        style: TextStyle(
                          fontSize: SizeConfig.textMultiplier * 2,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const VerticalSpacing(of: 1),
                      Text(
                        'Photos',
                        style: TextStyle(
                          fontSize: SizeConfig.textMultiplier * 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(
                                  right: SizeConfig.widthMultiplier * 5),
                              height: SizeConfig.heightMultiplier * 20,
                              width: SizeConfig.widthMultiplier * 35,
                              color: Colors.red,
                            );
                          },
                        ),
                      ),
                      Text(
                        'Rewards',
                        style: TextStyle(
                          fontSize: SizeConfig.textMultiplier * 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(
                                  right: SizeConfig.widthMultiplier * 5),
                              height: SizeConfig.heightMultiplier * 20,
                              width: SizeConfig.widthMultiplier * 35,
                              color: Colors.red,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
