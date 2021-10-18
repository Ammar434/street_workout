import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:street_workout/firebase/user_model.dart';
import 'package:street_workout/screens/no_authenticate/user_information_gathering/component/display_user_image.dart';
import 'package:street_workout/screens/no_authenticate/user_information_gathering/component/upload_button.dart';
import 'package:street_workout/widgets/vertical_spacing.dart';

class UserInformationGatheringPage3 extends StatefulWidget {
  const UserInformationGatheringPage3({Key? key, required this.image})
      : super(key: key);
  final String image;

  @override
  _UserInformationGatheringPage3State createState() =>
      _UserInformationGatheringPage3State();
}

class _UserInformationGatheringPage3State
    extends State<UserInformationGatheringPage3> {
  String _imageUrl = "";
  void uploadImage() async {
    final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
    final _picker = ImagePicker();

    XFile? _image;
    await Permission.photos.request();
    var permissionStatus = await Permission.photos.status;
    if (permissionStatus.isGranted) {
      _image = await _picker.pickImage(source: ImageSource.gallery);
      var file = File(_image!.path);
      var snapshot = await _firebaseStorage
          .ref()
          .child('${FirebaseAuth.instance.currentUser?.uid}/profileImage')
          .putFile(file);
      var downloadUrl = await snapshot.ref.getDownloadURL();
      setState(() {
        tmpUser.image = downloadUrl;
        _imageUrl = downloadUrl;
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const VerticalSpacing(of: 20),
          AspectRatio(
            aspectRatio: 3 / 2,
            child: Image.asset(
              widget.image,
            ),
          ),
          const VerticalSpacing(of: 2),
          (_imageUrl != "")
              ? DisplayUserImage(
                  imageUrl: _imageUrl,
                  onTap: uploadImage,
                )
              : UploadButton(onTap: uploadImage),
        ],
      ),
    );
  }
}
