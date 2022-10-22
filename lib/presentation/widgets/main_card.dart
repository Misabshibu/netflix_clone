import 'package:flutter/material.dart';
import 'package:netfix_clone/core/constants.dart';

class MainCard extends StatelessWidget {
  final String posterUrl;
  const MainCard({
    Key? key,
    required this.posterUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Container(
        width: 120,
        height: 170,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(posterUrl), fit: BoxFit.cover),
            borderRadius: kradious),
      ),
    );
  }
}
