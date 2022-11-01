import 'package:flutter/material.dart';
import 'package:netfix_clone/core/constants.dart';
import 'package:netfix_clone/presentation/widgets/main_card.dart';
import 'package:netfix_clone/presentation/widgets/main_title.dart';

class MainTitleAndCard extends StatelessWidget {
  final int limitindex;
  final String title;
  final List movieList;
  const MainTitleAndCard(
      {Key? key,
      required this.title,
      required this.movieList,
      required this.limitindex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheigh5,
        MainTitle(title: title),
        kheigh5,
        LimitedBox(
            maxHeight: 170,
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                    10,
                    (index) => Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: MainCard(
                            posterUrl:
                                '$imageAppendUrl${movieList[index + limitindex].posterPath}',
                          ),
                        ))))
      ],
    );
  }
}
