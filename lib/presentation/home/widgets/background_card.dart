import 'package:flutter/material.dart';
import 'package:netfix_clone/core/colors.dart';
import 'package:netfix_clone/presentation/home/widgets/custom_button_widget.dart';

class BackgrounCard extends StatelessWidget {
  final imageUrl;
  const BackgrounCard({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 520,
          child: Stack(children: [
            Image(
              width: double.infinity,
              height: double.infinity,
              image: NetworkImage(
                imageUrl,
              ),
              fit: BoxFit.cover,
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color.fromARGB(0, 118, 86, 86),
                  Colors.black
                ])),
              ),
            ),
          ]),
          // decoration: BoxDecoration(
          //     image: DecorationImage(
          //         image: NetworkImage(
          //           imageUrl,
          //         ),
          //         fit: BoxFit.cover)),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                CustomButtonWidget(
                  icon: Icons.add,
                  title: 'My List',
                ),
                _PlayButton(),
                CustomButtonWidget(icon: Icons.info, title: 'Info')
              ],
            ),
          ),
        )
      ],
    );
  }
}

class _PlayButton extends StatelessWidget {
  const _PlayButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kwhitecolor)),
        onPressed: () {},
        icon: const Icon(
          Icons.play_arrow,
          size: 25,
          color: kBlackColor,
        ),
        label: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Play',
            style: TextStyle(fontSize: 20, color: kBlackColor),
          ),
        ));
  }
}
