import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:street_workout/constants/size_config.dart';
import 'package:street_workout/firebase/get_data.dart';
import 'package:street_workout/screens/authentificate/home_screen/component/parc_display_card.dart';
import 'package:street_workout/screens/authentificate/parc_description_screen/parc_description_screen.dart';
import 'package:street_workout/widgets/custom_circular_progress_indicator.dart';

class NearbyParcs extends StatelessWidget {
  const NearbyParcs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.heightMultiplier * 30,
      child: FutureBuilder<List<QueryDocumentSnapshot<Map<String, dynamic>>>>(
        future: GetData().getParcsData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Text('Error');
            } else if (snapshot.hasData) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.heightMultiplier * 1),
                    child: ParcDisplayCard(
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ParcDescriptionScreen(
                              parcName: snapshot.data![index]['name'],
                              parcAddress: snapshot.data![index]['address'],
                              parcImageList: snapshot.data![index]['images'],
                              parcDescription: snapshot.data![index]
                                  ['description'],
                              parcMachineAvailable: snapshot.data![index]
                                  ['machineAvailable'],
                            ),
                          ),
                        );
                      },
                      name: snapshot.data![index]['name'],
                      image: snapshot.data![index]['images'][0],
                      machineAvailableList: snapshot.data![index]
                          ['machineAvailable'],
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
