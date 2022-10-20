import 'package:flutter/material.dart';
import 'package:netfix_clone/presentation/fast_laugh/widget/video_list_item.dart';

class ScreenFastlaugh extends StatelessWidget {
  const ScreenFastlaugh({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: PageView(
                scrollDirection: Axis.vertical,
                children: List.generate(
                    20, (index) => VideoListItems(index: index)))));
  }
}
