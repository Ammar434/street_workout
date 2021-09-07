import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:street_workout/constants/style.dart';

class RankTile extends StatelessWidget {
  const RankTile({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color:
                  Colors.primaries[Random().nextInt(Colors.primaries.length)],
              shape: BoxShape.circle,
            ),
            child: Center(child: Text("${index + 4}")),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            String.fromCharCodes(
              List.generate(20, (index) => Random().nextInt(33) + 89),
            ),
            style: TextStyle(color: primaryColor),
          ),
          const Spacer(),
          Text(
            "${index + 4}",
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}
