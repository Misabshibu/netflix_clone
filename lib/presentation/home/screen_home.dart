import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netfix_clone/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netfix_clone/core/constants.dart';
import 'package:netfix_clone/presentation/home/widgets/background_card.dart';
import 'package:netfix_clone/presentation/home/widgets/number_title_card.dart';
import 'package:netfix_clone/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataInComingsopm());
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
                        BlocBuilder<HotAndNewBloc, HotAndNewState>(
                          builder: (context, state) {
                            if (state.isLoading) {
                              return const Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.red,
                                ),
                              );
                            } else if (state.hasError) {
                              return const Center(
                                child:
                                    Text('Error while loading ComingSoon list'),
                              );
                            } else if (state.comingSoonList.isEmpty) {
                              return const Center(
                                child: Text('ComingSoon list is empty'),
                              );
                            } else {
                              final list = state.comingSoonList;
                              list.shuffle;
                              return ListView(
                                children: [
                                  BackgrounCard(
                                    imageUrl:
                                        '$imageAppendUrl${state.comingSoonList[4].posterPath}',
                                  ),
                                  MainTitleAndCard(
                                    title: 'Released in past year',
                                    movieList: list,
                                  ),
                                  MainTitleAndCard(
                                    title: 'Trending Now',
                                    movieList: list,
                                  ),
                                  NumberTitleCard(
                                    movieList: list,
                                  ),
                                  MainTitleAndCard(
                                    title: 'Tense Dramas',
                                    movieList: list,
                                  ),
                                  MainTitleAndCard(
                                    title: 'South Indian Cinima',
                                    movieList: list,
                                  )
                                ],
                              );
                            }
                          },
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
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      'https://upload.wikimedia.org/wikipedia/commons/0/0b/Netflix-avatar.png?20201013161117'),
                                                  fit: BoxFit.cover)),
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
