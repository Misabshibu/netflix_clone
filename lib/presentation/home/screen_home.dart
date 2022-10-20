import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netfix_clone/core/constants.dart';
import 'package:netfix_clone/presentation/home/widgets/background_card.dart';
import 'package:netfix_clone/presentation/home/widgets/number_title_card.dart';
import 'package:netfix_clone/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: ValueListenableBuilder(
                valueListenable: scrollNotifier,
                builder: (BuildContext context, index, _) {
                  return NotificationListener<UserScrollNotification>(
                    onNotification: (notification) {
                      final ScrollDirection direction = notification.direction;
                      if (direction == ScrollDirection.reverse) {
                        scrollNotifier.value = false;
                      } else if (direction == ScrollDirection.forward) {
                        scrollNotifier.value = true;
                      }
                      return true;
                    },
                    child: Stack(
                      children: [
                        ListView(
                          children: const [
                            BackgrounCard(),
                            MainTitleAndCard(
                              title: 'Released in past year',
                            ),
                            MainTitleAndCard(title: 'Trending Now'),
                            NumberTitleCard(),
                            MainTitleAndCard(title: 'Tense Dramas'),
                            MainTitleAndCard(title: 'South Indian Cinima')
                          ],
                        ),
                        scrollNotifier.value
                            ? AnimatedContainer(
                                duration: const Duration(milliseconds: 1500),
                                width: double.infinity,
                                height: 80,
                                color: Colors.black.withOpacity(0.3),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Image.network(
                                          'https://www.freepnglogos.com/uploads/netflix-logo-circle-png-5.png',
                                          width: 50,
                                          height: 50,
                                        ),
                                        const Spacer(),
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
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: const [
                                        Text(
                                          'TV Shows',
                                          style: khomeTitleText,
                                        ),
                                        Text(
                                          'Movies',
                                          style: khomeTitleText,
                                        ),
                                        Text(
                                          'Categories',
                                          style: khomeTitleText,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            : const SizedBox()
                      ],
                    ),
                  );
                })));
  }
}
