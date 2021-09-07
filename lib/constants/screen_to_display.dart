import 'package:street_workout/screens/authentificate/home_screen/home_screen.dart';
import 'package:street_workout/screens/authentificate/leaderboard_screen/leaderboard_screen.dart';
import 'package:street_workout/screens/authentificate/map_screen/map_screen.dart';
import 'package:street_workout/screens/authentificate/setting_screen/setting_screen.dart';

enum SelectedTab { home, map, leaderboard, setting }
var selectedTab = SelectedTab.home;

screenToDisplay(int i) {
  if (SelectedTab.values[i] == SelectedTab.home) {
    return const HomeScreen();
  } else if (SelectedTab.values[i] == SelectedTab.map) {
    return const MapScreen();
  } else if (SelectedTab.values[i] == SelectedTab.setting) {
    return const SettingScreen();
  } else if (SelectedTab.values[i] == SelectedTab.leaderboard) {
    return const LeaderboardScreen();
  }
}
