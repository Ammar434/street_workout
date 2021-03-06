import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:street_workout/component/app_bar.dart';
import 'package:street_workout/component/bottom_nav_bar.dart';
import 'package:street_workout/routes/screen_to_display.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
    required this.zoomDrawerController,
  }) : super(key: key);
  final ZoomDrawerController zoomDrawerController;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<QuerySnapshot> getData() async {
    return await FirebaseFirestore.instance.collection("allParcsData").get();
  }

  void _handleIndexChanged(int i) {
    setState(
      () {
        selectedTab = SelectedTab.values[i];
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: buildAppBar(widget.zoomDrawerController),
        extendBody: true,
        extendBodyBehindAppBar: true,
        bottomNavigationBar:
            buildDotNavigationBar(selectedTab, _handleIndexChanged),
        body: screenToDisplay(
          selectedTab.index,
        ),
      ),
    );
  }
}
