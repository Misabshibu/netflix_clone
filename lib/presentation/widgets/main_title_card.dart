import 'package:flutter/material.dart';
import 'package:netfix_clone/core/constants.dart';
import 'package:netfix_clone/presentation/widgets/main_card.dart';
import 'package:netfix_clone/presentation/widgets/main_title.dart';

class MainTitleAndCard extends StatelessWidget {
  final String title;
  final List movieList;
  const MainTitleAndCard(
      {Key? key, required this.title, required this.movieList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: title),
        LimitedBox(
            maxHeight: 170,
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                    10,
                    (index) => MainCard(
                          posterUrl:
                              '$imageAppendUrl${movieList[index].posterPath}',
                        ))))
      ],
    );
  }
}
