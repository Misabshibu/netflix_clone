import 'package:flutter/material.dart';
import 'package:netfix_clone/core/colors/colors.dart';
import 'package:netfix_clone/core/constants.dart';
import 'package:netfix_clone/presentation/home/widgets/custom_button_widget.dart';
import 'package:netfix_clone/presentation/widgets/video_widget.dart';

class EveryoneWatchingWidget extends StatelessWidget {
  const EveryoneWatchingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheigh,
        const Text(
          'Friends',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        kheigh,
        const Text(
          'this hit sitcon follos the merry misadvantages of six 20-something pals as they navigate the pitfalls of work, life and love in 1990s Manhattan ',
          style: TextStyle(color: kgreycolor),
        ),
        kheigh50,
        const VideoWidget(),
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
