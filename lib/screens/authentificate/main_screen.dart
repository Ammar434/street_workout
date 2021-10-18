import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:street_workout/firebase/get_data.dart';
import 'package:street_workout/screens/authentificate/body.dart';
import 'package:street_workout/screens/authentificate/drawer_screen/drawer_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  static const String name = "mainScreen";

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final drawerController = ZoomDrawerController();
  @override
  void initState() {
    GetData().getCurrentUserName();
    GetData().getCurrentUserProfileImage();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ZoomDrawer(
          controller: drawerController,
          style: DrawerStyle.Style1,
          menuScreen: const DrawerScreen(),
          mainScreen: Body(
            zoomDrawerController: drawerController,
          ),
          borderRadius: 24.0,
          showShadow: true,
          angle: -5.0,
          backgroundColor: Colors.grey[300]!,
          slideWidth: MediaQuery.of(context).size.width * .45,
          openCurve: Curves.fastOutSlowIn,
          closeCurve: Curves.easeInOutQuad,
        ),
      ),
    );
  }
}
