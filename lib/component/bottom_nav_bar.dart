import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:street_workout/constants/screen_to_display.dart';

DotNavigationBar buildDotNavigationBar(
    var selectedTab, dynamic handleIndexChanged) {
  return DotNavigationBar(
    currentIndex: SelectedTab.values.indexOf(selectedTab),
    onTap: handleIndexChanged,
    dotIndicatorColor: Colors.transparent,
    items: [
      DotNavigationBarItem(
        icon: const FaIcon(FontAwesomeIcons.home),
        selectedColor: Colors.purple,
      ),
      DotNavigationBarItem(
        icon: const FaIcon(FontAwesomeIcons.map),
        selectedColor: Colors.pink,
      ),
      DotNavigationBarItem(
        icon: const FaIcon(FontAwesomeIcons.trophy),
        selectedColor: Colors.orange,
      ),
      DotNavigationBarItem(
        icon: const Icon(Icons.settings),
        selectedColor: Colors.teal,
      ),
    ],
  );
}
