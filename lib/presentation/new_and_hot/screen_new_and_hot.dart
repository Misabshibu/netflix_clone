import 'package:flutter/material.dart';
import 'package:netfix_clone/core/colors/colors.dart';
import 'package:netfix_clone/core/constants.dart';
import 'package:netfix_clone/presentation/new_and_hot/widgets/coming_soon_widget.dart';
import 'package:netfix_clone/presentation/new_and_hot/widgets/everyone_watching_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size(double.infinity, 90),
              child: AppBar(
                title: const Text(
                  'New  & Hot',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                ),
                actions: [
                  const Icon(
                    Icons.cast,
                    color: Colors.white,
                    size: 30,
                  ),
                  kwidth,
                  Container(
                    width: 30,
                    height: 30,
                    color: Colors.red,
                  ),
                  kwidth
                ],
                bottom: TabBar(
                    isScrollable: true,
                    labelColor: kBlackColor,
                    unselectedLabelColor: kwhitecolor,
                    labelStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                    indicator: BoxDecoration(
                        color: kwhitecolor, borderRadius: kradious30),
                    tabs: const [
                      Tab(
                        text: '🍿 Coming soon',
                      ),
                      Tab(text: "👀 Everyone's watching")
                    ]),
              )),
          body: TabBarView(children: [
            _bulidComigSoon(),
            _bulidEveryonesWatching('Everyone is watching')
          ])),
    );
  }

  _bulidComigSoon() {
    return ListView.builder(
      itemBuilder: (BuildContext context, index) => const ComingSoonWidget(),
      itemCount: 5,
    );
  }
}

_bulidEveryonesWatching(String name) {
  return ListView.builder(
    itemBuilder: (BuildContext context, index) =>
        const EveryoneWatchingWidget(),
    itemCount: 5,
  );
}
