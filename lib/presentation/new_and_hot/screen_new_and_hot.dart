import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netfix_clone/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netfix_clone/core/colors.dart';
import 'package:netfix_clone/core/constants.dart';
import 'package:netfix_clone/presentation/new_and_hot/widgets/coming_soon_widget.dart';
import 'package:netfix_clone/presentation/new_and_hot/widgets/everyone_watching_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataInComingsopm());
    });
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
        body: const TabBarView(
          children: [
            ComingSoonList(
              key: Key('coming_soon'),
            ),
            EveryoneIsWatching(key: Key('everyone_is_watching')),
          ],
        ),
      ),
    );
  }

//   _bulidComigSoon() {
//     return ListView.builder(
//       itemBuilder: (BuildContext context, index) => const ComingSoonWidget(),
//       itemCount: 5,
//     );
//   }
// }

  // _bulidEveryonesWatching(String name) {
  //   return ListView.builder(
  //     itemBuilder: (BuildContext context, index) =>
  //         // const EveryoneWatchingWidget(),
  //         SizedBox(),
  //     itemCount: 5,
  //   );
  // }
}

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotAndNewBloc, HotAndNewState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(strokeWidth: 2),
          );
        }
        if (state.hasError) {
          return const Center(
            child: Text('Error while loading coming soon widget'),
          );
        } else if (state.comingSoonList.isEmpty) {
          return const Center(
            child: Text('Coming soon list is empty'),
          );
        } else {
          return ListView.builder(
              itemCount: state.comingSoonList.length,
              itemBuilder: (BuildContext context, index) {
                final movie = state.comingSoonList[index];
                if (movie.id == null) {
                  return const SizedBox();
                }

                // print(_date);
                return ComingSoonWidget(
                    id: movie.id.toString(),
                    month: 'Mar',
                    //  formatedDate
                    //     .split(' ')
                    //     .first
                    //     .substring(0, 3)
                    //     .toUpperCase(),
                    day: '11',
                    posterPath: '$imageAppendUrl${movie.posterPath}',
                    movieName: movie.originalTitle ?? 'No Title',
                    movieDescriptioin: movie.overview ?? 'No overview');
              });
        }
      },
    );
  }
}

//************ */

class EveryoneIsWatching extends StatelessWidget {
  const EveryoneIsWatching({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HotAndNewBloc>(context)
        .add(const LoadDataInEveryoneWatching());
    return BlocBuilder<HotAndNewBloc, HotAndNewState>(
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
            child: Text('Error while loading ComingSoon list'),
          );
        } else if (state.everyoneWatchingList.isEmpty) {
          return const Center(
            child: Text('everyone Is Watching List list is empty'),
          );
        } else {
          return ListView.builder(
              itemCount: state.everyoneWatchingList.length - 1,
              itemBuilder: (BuildContext context, index) {
                final movie = state.everyoneWatchingList[index];

                if (movie.id == null) {
                  // final a = state.everyoneWatchingList.shuffle;
                  return const SizedBox();
                }

                return EveryoneWatchingWidget(
                    posterPath: '$imageAppendUrl${movie.backdropPath}',
                    movieName: movie.title ?? 'No Title',
                    movieDescriptioin: movie.overview ?? 'No Overview');
              });
        }
      },
    );
  }
}
