import 'package:flutter/material.dart';
import 'package:street_workout/constants/size_config.dart';
import 'package:street_workout/constants/style.dart';

class RoundedInput extends StatefulWidget {
  const RoundedInput({
    Key? key,
    required this.text,
    this.iconData,
    this.iconData2,
    required this.isObscure,
    required this.press,
    this.onIconTap,
    required this.validator,
  }) : super(key: key);
  final String text;
  final IconData? iconData;
  final IconData? iconData2;
  final bool isObscure;
  final Function(String)? press;
  final Function()? onIconTap;
  final String? Function(String?)? validator;

  @override
  State<RoundedInput> createState() => _RoundedInputState();
}

class _RoundedInputState extends State<RoundedInput> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier * 1),
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.heightMultiplier * 1,
        horizontal: SizeConfig.widthMultiplier * 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeConfig.heightMultiplier * 3),
        color: backgroundColorShade,
      ),
      child: TextFormField(
        cursorColor: primaryColor,
        obscureText: widget.iconData2!= null?_obscureText:false,
        style: TextStyle(
          color: primaryColor,
        ),
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: () {
              setState(
                () {
                  _obscureText = !_obscureText;
                  debugPrint(_obscureText.toString());
                },
              );
            },
            child: Icon(
              _obscureText ? widget.iconData : widget.iconData2,
              color: primaryColor,
            ),
          ),
          hintText: widget.text,
          hintStyle: TextStyle(
            color: Theme.of(context).disabledColor,
          ),
          border: InputBorder.none,
        ),
        onChanged: widget.press,
        validator: widget.validator,
      ),
    );
  }
}
