import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:street_workout/constants/size_config.dart';
import 'package:street_workout/firebase/user_model.dart';
import 'package:street_workout/widgets/vertical_spacing.dart';

class ChangeBio extends StatelessWidget {
  const ChangeBio({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const VerticalSpacing(of: 2),
        Padding(
          padding: EdgeInsets.only(
            left: SizeConfig.widthMultiplier * 5,
            bottom: SizeConfig.heightMultiplier * 1,
          ),
          child: Text(
            "Description",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: SizeConfig.textMultiplier * 2,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(SizeConfig.heightMultiplier * 2),
          decoration: BoxDecoration(
            color: Theme.of(context).shadowColor,
            borderRadius: BorderRadius.circular(
              SizeConfig.borderRadiusMultiplier * 2,
            ),
          ),
          child: SizedBox(
            height: SizeConfig.heightMultiplier * 15,
            child: TextFormField(
              initialValue: tmpUser.name,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
