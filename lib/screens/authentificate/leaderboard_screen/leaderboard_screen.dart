import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:street_workout/constants/size_config.dart';
import 'package:street_workout/constants/style.dart';
import 'package:street_workout/data/top_street_workers.dart';
import 'package:street_workout/firebase/get_data.dart';
import 'package:street_workout/screens/authentificate/leaderboard_screen/component/date_widget.dart';
import 'package:street_workout/screens/authentificate/leaderboard_screen/component/date_widget_name.dart';
import 'package:street_workout/screens/authentificate/leaderboard_screen/component/rank_tile.dart';
import 'package:street_workout/widgets/custom_circular_progress_indicator.dart';
import 'package:street_workout/widgets/vertical_spacing.dart';

import 'component/podium_widget.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({Key? key}) : super(key: key);

  @override
  _LeaderboardScreenState createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  int periodToDisplay = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<QueryDocumentSnapshot<Map<String, dynamic>>>>(
        future: GetData().getLeaderboardData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Text('Error');
            } else if (snapshot.hasData) {
              debugPrint(snapshot.data![0]['name'].toString());
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    const VerticalSpacing(of: 6),
                    buildDateWidgetRow(),
                    const VerticalSpacing(of: 2),
                    Expanded(
                      flex: 1,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            bottom: 0,
                            child: PodiumWidget(
                              image: snapshot.data![1]['profileImage'],
                              color: const Color(0xffC0C0C0),
                              name: "${snapshot.data![1]['name']}",
                              podiumImage:
                                  "assets/images/leaderboard/second.png",
                              size: 16,
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: PodiumWidget(
                              image: snapshot.data![2]['profileImage'],
                              color: const Color(0xffCD7F32),
                              name: "${snapshot.data![2]['name']}",
                              podiumImage:
                                  "assets/images/leaderboard/third.png",
                              size: 16,
                            ),
                          ),
                          Positioned(
                            top: 0,
                            left: SizeConfig.widthMultiplier * 48 -
                                SizeConfig.imageSizeMultiplier * 20,
                            child: PodiumWidget(
                              image: snapshot.data![0]['profileImage'],
                              color: const Color(0xffFFD700),
                              name: "${snapshot.data![0]['name']}",
                              podiumImage:
                                  "assets/images/leaderboard/first.png",
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const VerticalSpacing(of: 3),
                    buildRankListView(),
                  ],
                ),
              );
            } else {
              return const Text('Empty data');
            }
          } else {
            return CustomCircularProgressIndicator(
              isVisible: !snapshot.hasData,
            );
          }
        },
      ),
    );
  }

  Row buildDateWidgetRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ...List.generate(
          dateWidgetNameList.length,
          (index) => DateWidget(
            text: dateWidgetNameList[index],
            isSelected: periodToDisplay == index ? true : false,
            onTap: () {
              setState(
                () {
                  periodToDisplay = index;
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Expanded buildPodiumStack() {
    return Expanded(
      flex: 1,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            bottom: 0,
            child: PodiumWidget(
              image: topStreetWorkersList[1].image,
              color: const Color(0xffC0C0C0),
              name:
                  "${topStreetWorkersList[1].name} ${topStreetWorkersList[1].surname}",
              podiumImage: "assets/images/leaderboard/second.png",
              size: 16,
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: PodiumWidget(
              image: topStreetWorkersList[2].image,
              color: const Color(0xffCD7F32),
              name:
                  "${topStreetWorkersList[2].name} ${topStreetWorkersList[2].surname}",
              podiumImage: "assets/images/leaderboard/third.png",
              size: 16,
            ),
          ),
          Positioned(
            top: 0,
            left: SizeConfig.widthMultiplier * 48 -
                SizeConfig.imageSizeMultiplier * 20,
            child: PodiumWidget(
              image: topStreetWorkersList[0].image,
              color: const Color(0xffFFD700),
              name:
                  "${topStreetWorkersList[0].name} ${topStreetWorkersList[0].surname}",
              podiumImage: "assets/images/leaderboard/first.png",
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  Expanded buildRankListView() {
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.heightMultiplier * 2,
            ),
            decoration: BoxDecoration(
              color: backgroundColorShade2,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "You're Current Rank",
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  "1",
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const FaIcon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.yellow,
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return RankTile(
                  index: index,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
/*child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              const VerticalSpacing(of: 6),
              //buildDateWidgetRow(),
              const VerticalSpacing(of: 2),
              //buildPodiumStack(),
              const VerticalSpacing(of: 3),
              //buildRankListView(),
            ],
          ),
        ),*/
