import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:street_workout/constants/size_config.dart';
import 'package:street_workout/data/current_user.dart';

class ChangePhoto extends StatelessWidget {
  const ChangePhoto({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: SizeConfig.widthMultiplier * 5,
            bottom: SizeConfig.heightMultiplier * 1,
          ),
          child: Text(
            "Photo",
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
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(currentUserImage),
                maxRadius: SizeConfig.heightMultiplier * 6,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: SizeConfig.heightMultiplier * 5,
                    margin: EdgeInsets.symmetric(
                      horizontal: SizeConfig.widthMultiplier * 5,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).hintColor,
                      borderRadius: BorderRadius.circular(
                          SizeConfig.borderRadiusMultiplier * 2),
                    ),
                    child: Center(
                      child: Text(
                        "Modifier votre photo",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
