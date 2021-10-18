import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:street_workout/constants/size_config.dart';
import 'package:street_workout/firebase/get_data.dart';
import 'package:street_workout/screens/authentificate/home_screen/component/top_street_workers_card.dart';
import 'package:street_workout/screens/authentificate/user_description_screen/user_description_screen.dart';
import 'package:street_workout/widgets/custom_circular_progress_indicator.dart';

class TopStreetWorkers extends StatelessWidget {
  const TopStreetWorkers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.heightMultiplier * 40,
      child: FutureBuilder<List<QueryDocumentSnapshot<Map<String, dynamic>>>>(
        future: GetData().getUsersData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Text('Error');
            } else if (snapshot.hasData) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.heightMultiplier * 1),
                    child: TopStreetWorkersCard(
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserDescriptionScreen(
                              userName: snapshot.data![index]['name'],
                              userSurname: snapshot.data![index]['surname'],
                              userBio: snapshot.data![index]['bio'],
                              userPhotos: snapshot.data![index]['images'],
                              userRewards: snapshot.data![index]['rewards'],
                              numberFollowers: snapshot.data![index]
                                  ['numberFollowers'],
                              numberParcs: snapshot.data![index]['numberParcs'],
                              numberFollowing: snapshot.data![index]
                                  ['numberFollowing'],
                              image: snapshot.data![index]['profileImage'],
                            ),
                          ),
                        );
                      },
                      image: snapshot.data![index]['profileImage'],
                      name: snapshot.data![index]['name'],
                    ),
                  );
                },
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
}
