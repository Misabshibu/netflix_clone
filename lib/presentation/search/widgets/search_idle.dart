import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netfix_clone/core/colors/colors.dart';
import 'package:netfix_clone/core/constants.dart';
import 'package:netfix_clone/presentation/search/widgets/search_title.dart';

const imageurl =
    'https://www.themoviedb.org/t/p/w1066_and_h600_bestv2/84XPpjGvxNyExjSuLQe0SzioErt.jpg';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Search_Title(title: 'Top Searches'),
        kheigh,
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (ctx, index) => const TopSearchItemTitle(),
              separatorBuilder: (ctx, index) => kheigh20,
              itemCount: 10),
        )
      ],
    );
  }
}

class TopSearchItemTitle extends StatelessWidget {
  const TopSearchItemTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 65,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imageurl), fit: BoxFit.cover)),
        ),
        const Expanded(
            child: Text(
          'Movie Name',
          style: TextStyle(
              color: kwhitecolor, fontWeight: FontWeight.bold, fontSize: 16),
        )),
        const CircleAvatar(
          backgroundColor: kwhitecolor,
          radius: 25,
          child: CircleAvatar(
            backgroundColor: kBlackColor,
            radius: 23,
            child: Icon(
              CupertinoIcons.play_fill,
              color: kwhitecolor,
            ),
          ),
        )
      ],
    );
  }
}
