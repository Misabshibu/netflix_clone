import 'package:flutter/material.dart';
import 'package:netfix_clone/core/colors.dart';

class CustomButtonWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final double iconsize;
  final double textSize;

  const CustomButtonWidget(
      {Key? key,
      required this.icon,
      required this.title,
      this.iconsize = 30,
      this.textSize = 18})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kwhitecolor,
          size: iconsize,
        ),
        Text(
          title,
          style: TextStyle(fontSize: textSize),
        )
      ],
    );
  }
}
