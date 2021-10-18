import 'package:flutter/material.dart';
import 'package:street_workout/constants/style.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({
    Key? key,
    required this.isVisible,
  }) : super(key: key);
  final bool isVisible;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            Visibility(
              visible: isVisible,
              child: Text(
                "Wait",
                style: TextStyle(color: primaryColor, fontSize: 24),
              ),
            )
          ],
        ),
      ),
    );
  }
}
