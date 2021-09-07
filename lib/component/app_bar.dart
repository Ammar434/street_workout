import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

AppBar buildAppBar(ZoomDrawerController zoomDrawerController) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    leading: IconButton(
      icon: const Icon(Icons.menu),
      onPressed: () {
        zoomDrawerController.toggle!();
      },
    ),
  );
}
// appBar: buildAppBar(),
