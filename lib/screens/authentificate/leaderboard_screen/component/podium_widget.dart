import 'package:flutter/material.dart';
import 'package:street_workout/constants/size_config.dart';
import 'package:street_workout/constants/style.dart';
import 'package:street_workout/widgets/vertical_spacing.dart';

class PodiumWidget extends StatelessWidget {
  const PodiumWidget({
    Key? key,
    required this.image,
    required this.color,
    required this.name,
    required this.podiumImage,
    required this.size,
  }) : super(key: key);
  final String image;
  final String podiumImage;
  final Color color;
  final String name;
  final int size;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: SizeConfig.imageSizeMultiplier * 10,
          child: Image.asset(podiumImage),
        ),
        CircleAvatar(
          radius: SizeConfig.imageSizeMultiplier * size,
          backgroundColor: color,
          child: CircleAvatar(
            radius: SizeConfig.imageSizeMultiplier * (size - 1),
            backgroundImage: NetworkImage(image),
          ),
        ),
        const VerticalSpacing(of: 1),
        Text(
          name,
          style: TextStyle(
            color: primaryColor,
            fontSize: SizeConfig.widthMultiplier * 4,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
