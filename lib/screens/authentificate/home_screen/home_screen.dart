import 'package:flutter/material.dart';
import 'package:street_workout/screens/authentificate/home_screen/component/home_header.dart';
import 'package:street_workout/screens/authentificate/home_screen/component/nearby_parcs.dart';
import 'package:street_workout/screens/authentificate/home_screen/component/top_street_workers.dart';
import 'package:street_workout/widgets/vertical_spacing.dart';

import 'component/section_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const HomeHeader(),
          const VerticalSpacing(of: 5),
          SectionTitle(
            text: 'Parcs à proximité',
            gestureTapCallback: () {},
          ),
          const VerticalSpacing(of: 1),
          const NearbyParcs(),
          const VerticalSpacing(of: 1),
          SectionTitle(
            text: 'Top StreetWorkers',
            gestureTapCallback: () {},
          ),
          const VerticalSpacing(of: 1),
          const TopStreetWorkers(),
          const VerticalSpacing(of: 5),
        ],
      ),
    );
  }
}
