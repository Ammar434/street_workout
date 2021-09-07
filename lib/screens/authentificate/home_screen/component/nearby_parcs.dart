import 'package:flutter/material.dart';
import 'package:street_workout/data/parcs_spots.dart';
import 'package:street_workout/routes/routes.dart';
import 'package:street_workout/screens/authentificate/home_screen/component/parc_display_card.dart';

class NearbyParcs extends StatelessWidget {
  const NearbyParcs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(
            parcsSpotsList.length,
            (index) => ParcDisplayCard(
              index: index,
              press: () => Navigator.pushNamed(context, parcsDescription),
            ),
          ),
        ],
      ),
    );
  }
}
