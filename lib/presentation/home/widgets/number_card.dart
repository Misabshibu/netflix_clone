import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netfix_clone/core/colors/colors.dart';
import 'package:netfix_clone/core/constants.dart';
import 'package:netfix_clone/presentation/search/widgets/search_idle.dart';

class NumberCard extends StatelessWidget {
  final int index;
  const NumberCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Stack(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 40,
              ),
              Container(
                width: 120,
                height: 170,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: NetworkImage(imageurl), fit: BoxFit.cover),
                    borderRadius: kradious),
              ),
            ],
          ),
          Positioned(
            left: 15,
            top: 55,
            child: BorderedText(
              strokeColor: Colors.white,
              strokeWidth: 3.0,
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 120,
                    decoration: TextDecoration.none,
                    color: kBlackColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
