import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:street_workout/constants/size_config.dart';
import 'package:street_workout/constants/style.dart';
import 'package:street_workout/firebase/get_data.dart';
import 'package:street_workout/widgets/custom_circular_progress_indicator.dart';
import 'package:street_workout/widgets/vertical_spacing.dart';

class UserInformationGatheringPage2 extends StatefulWidget {
  const UserInformationGatheringPage2({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  State<UserInformationGatheringPage2> createState() =>
      _UserInformationGatheringPage2State();
}

class _UserInformationGatheringPage2State
    extends State<UserInformationGatheringPage2> {
  final List<int> _selectedItems = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const VerticalSpacing(of: 20),
        AspectRatio(
          aspectRatio: 3 / 2,
          child: Image.asset(
            widget.image,
          ),
        ),
        buildListOfParcsListView(),
      ],
    );
  }

  Expanded buildListOfParcsListView() {
    return Expanded(
      child: FutureBuilder<List<QueryDocumentSnapshot<Map<String, dynamic>>>>(
        future: GetData().getParcsData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Text('Error');
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.heightMultiplier * 1),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          SizeConfig.heightMultiplier * 6,
                        ),
                        color: backgroundColorShade2,
                      ),
                      child: ListTile(
                        title: Text(
                          snapshot.data![index]['name'],
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: SizeConfig.textMultiplier * 2.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        onTap: () {
                          if (!_selectedItems.contains(index)) {
                            setState(
                              () {
                                _selectedItems.add(index);
                              },
                            );
                          }
                        },
                        onLongPress: () {
                          if (_selectedItems.contains(index)) {
                            setState(
                              () {
                                _selectedItems
                                    .removeWhere((val) => val == index);
                              },
                            );
                          }
                        },
                        trailing: _selectedItems.contains(index)
                            ? Icon(
                                Icons.check,
                                color: primaryColor,
                              )
                            : null,
                      ),
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
