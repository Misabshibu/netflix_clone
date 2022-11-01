import 'package:flutter/material.dart';
import 'package:netfix_clone/core/constants.dart';
import 'package:netfix_clone/presentation/home/widgets/number_card.dart';
import 'package:netfix_clone/presentation/widgets/main_title.dart';

class NumberTitleCard extends StatelessWidget {
  final List movieList;
  const NumberTitleCard({
    Key? key,
    required this.movieList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(title: 'Top 10 Tv Shows In India Todays'),
        LimitedBox(
            maxHeight: 170,
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                    10,
                    (index) => NumberCard(
                          index: index + 10,
                          imageUrl:
                              '$imageAppendUrl${movieList[index + 10].backdropPath}',
                        ))))
      ],
    );
  }
}
