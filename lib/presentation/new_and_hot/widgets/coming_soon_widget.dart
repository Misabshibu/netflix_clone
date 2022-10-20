import 'package:flutter/material.dart';
import 'package:netfix_clone/core/colors/colors.dart';
import 'package:netfix_clone/core/constants.dart';
import 'package:netfix_clone/presentation/home/widgets/custom_button_widget.dart';
import 'package:netfix_clone/presentation/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 450,
          width: 50,
          child: Column(
            children: const [
              Text(
                'FEB',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: kgreycolor),
              ),
              Text(
                '11',
                style: TextStyle(
                    letterSpacing: 4,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VideoWidget(),
              Row(
                children: [
                  const Text(
                    'Tall Girl2',
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -2),
                  ),
                  const Spacer(),
                  Row(
                    children: const [
                      CustomButtonWidget(
                          iconsize: 20,
                          textSize: 10,
                          icon: Icons.notifications_none_outlined,
                          title: 'Remaind Me'),
                      kwidth,
                      CustomButtonWidget(
                          iconsize: 20,
                          textSize: 10,
                          icon: Icons.info,
                          title: 'info'),
                      kwidth
                    ],
                  )
                ],
              ),
              kheigh,
              const Text('Coming on Friday',
                  style: TextStyle(
                    fontSize: 16,
                  )),
              kheigh,
              const Text(
                'Tall Girl 2',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              kheigh,
              const Text(
                'Leading the lead in the school musical is a dream come true for Jodi,Until the pressure sends her confidence - and her relationship - into a tailspain.',
                style: TextStyle(color: kgreycolor),
              )
            ],
          ),
        ),
      ],
    );
  }
}
