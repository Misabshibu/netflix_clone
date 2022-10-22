import 'package:flutter/material.dart';
import 'package:netfix_clone/core/colors.dart';
import 'package:netfix_clone/core/constants.dart';
import 'package:netfix_clone/presentation/home/widgets/custom_button_widget.dart';
import 'package:netfix_clone/presentation/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String movieDescriptioin;

  const ComingSoonWidget({
    Key? key,
    required this.id,
    required this.month,
    required this.day,
    required this.posterPath,
    required this.movieName,
    required this.movieDescriptioin,
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
            children: [
              Text(
                month,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: kgreycolor),
              ),
              Text(
                day,
                style: const TextStyle(
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
              VideoWidget(
                url: posterPath,
              ),
              Row(
                children: [
                  Text(
                    movieName,
                    style: const TextStyle(
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
              Text(
                movieName,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              kheigh,
              Text(
                movieDescriptioin,
                overflow: TextOverflow.ellipsis,
                maxLines: 6,
                style: const TextStyle(color: kgreycolor),
              )
            ],
          ),
        ),
      ],
    );
  }
}
