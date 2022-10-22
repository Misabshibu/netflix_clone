import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netfix_clone/application/downloads/downloads_bloc.dart';
import 'package:netfix_clone/core/colors.dart';
import 'package:netfix_clone/core/constants.dart';
import 'package:netfix_clone/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});

  final _widgetList = [const _SmartDownload(), Sectioin2(), const Section3()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size(double.infinity, 50),
            child: SafeArea(
                child: AppBarWidget(
              title: 'Downloads',
            ))),
        body: ListView.separated(
            padding: const EdgeInsets.all(10),
            itemBuilder: (ctx, index) => _widgetList[index],
            separatorBuilder: (ctx, index) => const SizedBox(
                  height: 25,
                ),
            itemCount: _widgetList.length));
  }
}

////Section 2/
class Sectioin2 extends StatelessWidget {
  Sectioin2({super.key});

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   BlocProvider.of<DownloadsBloc>(context)
    //       .add(const DownloadsEvent.getDownloadsImage());
    // });
    BlocProvider.of<DownloadsBloc>(context)
        .add(const DownloadsEvent.getDownloadsImage());

    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        const Text(
          'Indroducing Downloads for you',
          style: TextStyle(
              color: kwhitecolor, fontSize: 23, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        kheigh20,
        const Text(
          "We will download a personalized selection of\nmovies and shows for you, so there's\nalways something to watch on your \ndevice",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            return SizedBox(
              height: size.width,
              width: size.width,
              child: state.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Stack(
                      alignment: Alignment.center,
                      children: [
                        Center(
                          child: CircleAvatar(
                            radius: size.width * 0.35,
                            backgroundColor: Colors.grey.withOpacity(0.5),
                          ),
                        ),
                        DowloadsImageWidget(
                          size: Size(size.width * 0.35, size.width * 0.55),
                          angle: 20,
                          imageList:
                              '$imageAppendUrl${state.downloads![0].posterPath}',
                          margin: const EdgeInsets.only(left: 170, top: 50),
                        ),
                        DowloadsImageWidget(
                          size: Size(size.width * 0.35, size.width * 0.55),
                          angle: -20,
                          imageList:
                              '$imageAppendUrl${state.downloads![1].posterPath}',
                          margin: const EdgeInsets.only(right: 170, top: 50),
                        ),
                        DowloadsImageWidget(
                          size: Size(size.width * 0.4, size.width * 0.6),
                          angle: 0,
                          radious: 10,
                          imageList:
                              '$imageAppendUrl${state.downloads![2].posterPath}',
                          margin: const EdgeInsets.only(left: 20, top: 15),
                        )
                      ],
                    ),
            );
          },
        ),
      ],
    );
  }
}

//section 3

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: kbuttonColorBlue,
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 3),
              child: Text(
                'Setup',
                style: TextStyle(
                    color: kButtonColorWhite,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
        ),
        kheigh,
        MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: kButtonColorWhite,
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'See what you can download',
              style: TextStyle(
                  color: kBlackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
        )
      ],
    );
  }
}

class _SmartDownload extends StatelessWidget {
  const _SmartDownload({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        kwidth,
        Icon(
          Icons.settings,
          color: kwhitecolor,
        ),
        kwidth,
        Text('Smart Downloads')
      ],
    );
  }
}

class DowloadsImageWidget extends StatelessWidget {
  const DowloadsImageWidget(
      {Key? key,
      required this.imageList,
      this.angle = 0,
      required this.margin,
      required this.size,
      this.radious = 10})
      : super(key: key);

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radious;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radious),
          child: Container(
            // margin: margin,
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageList),
            )),
          ),
        ),
      ),
    );
  }
}
