import 'package:flutter/material.dart';
import 'package:netfix_clone/core/colors.dart';
import 'package:netfix_clone/core/constants.dart';
import 'package:netfix_clone/presentation/home/widgets/custom_button_widget.dart';
import 'package:netfix_clone/presentation/widgets/video_widget.dart';

class EveryoneWatchingWidget extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String movieDescriptioin;
  const EveryoneWatchingWidget({
    Key? key,
    required this.posterPath,
    required this.movieName,
    required this.movieDescriptioin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheigh,
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            movieName,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        kheigh,
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            movieDescriptioin,
            overflow: TextOverflow.ellipsis,
            maxLines: 6,
            style: const TextStyle(color: kgreycolor),
          ),
        ),
        kheigh50,
        VideoWidget(
          url: posterPath,
        ),
        kheigh,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            CustomButtonWidget(
                iconsize: 25, textSize: 16, icon: Icons.share, title: 'Share'),
            kwidth,
            CustomButtonWidget(
                iconsize: 25, textSize: 16, icon: Icons.add, title: 'My Listd'),
            kwidth,
            CustomButtonWidget(
                iconsize: 25,
                textSize: 16,
                icon: Icons.play_arrow,
                title: 'Play'),
            kwidth
          ],
        )
      ],
    );
  }
}
