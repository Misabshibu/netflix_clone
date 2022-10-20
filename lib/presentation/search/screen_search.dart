import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netfix_clone/core/constants.dart';
import 'package:netfix_clone/presentation/search/widgets/search_idle.dart';
import 'package:netfix_clone/presentation/search/widgets/search_result.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            CupertinoSearchTextField(
              backgroundColor: Colors.grey.withOpacity(0.4),
              prefixIcon: const Icon(
                CupertinoIcons.search,
                color: Colors.grey,
              ),
              suffixIcon: const Icon(
                CupertinoIcons.xmark_circle_fill,
                color: Colors.grey,
              ),
              style: const TextStyle(color: Colors.white),
            ),
            kheigh,
            // Expanded(child: const SearchIdleWidget())
            Expanded(child: const SearchResultWidget())
          ],
        ),
      )),
    );
  }
}
