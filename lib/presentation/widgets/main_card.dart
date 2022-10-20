import 'package:flutter/material.dart';
import 'package:netfix_clone/core/constants.dart';
import 'package:netfix_clone/presentation/search/widgets/search_idle.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Container(
        width: 120,
        height: 170,
        decoration: BoxDecoration(
            image: const DecorationImage(
                image: NetworkImage(imageurl), fit: BoxFit.cover),
            borderRadius: kradious),
      ),
    );
  }
}
