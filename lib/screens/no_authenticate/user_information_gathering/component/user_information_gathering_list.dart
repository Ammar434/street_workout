import 'package:flutter/material.dart';
import 'package:street_workout/firebase/user_model.dart';
import 'package:street_workout/screens/no_authenticate/user_information_gathering/component/user_information_gathering_page.dart';
import 'package:street_workout/screens/no_authenticate/user_information_gathering/component/user_information_gathering_page2.dart';
import 'package:street_workout/screens/no_authenticate/user_information_gathering/component/user_information_gathering_page3.dart';

List<Widget> userInformationGatheringList = [
  UserInformationGatheringPage(
    image: "assets/images/authentication/image1_authentication.png",
    hintText: "Enter your username",
    onChanged: (value) {
      tmpUser.name = value;
    },
  ),
  UserInformationGatheringPage(
    image: "assets/images/authentication/image2_authentication.png.png",
    hintText: "Enter your bio",
    onChanged: (value) {
      tmpUser.bio = value;
    },
  ),
  const UserInformationGatheringPage2(
    image: "assets/images/authentication/image3_authentication.png.png",
  ),
  const UserInformationGatheringPage3(
    image: "assets/images/authentication/image3_authentication.png.png",
  ),
];
