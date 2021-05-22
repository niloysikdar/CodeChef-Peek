import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:codechef/constants/colors.dart';
import 'package:flutter/material.dart';

Widget nameCard({
  @required Size size,
  @required String name,
  @required String username,
}) {
  return Container(
    height: size.height * 0.25,
    width: double.infinity,
    padding: EdgeInsets.all(22),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(25),
      ),
      gradient: LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [
          draculaorchid,
          americanriver,
        ],
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedTextKit(
          animatedTexts: [
            TyperAnimatedText(
              name,
              textStyle: TextStyle(
                fontSize: 25,
                color: kwhite,
                fontWeight: FontWeight.w600,
              ),
              speed: Duration(milliseconds: 120),
              curve: Curves.easeInExpo,
            ),
          ],
          isRepeatingAnimation: true,
          pause: Duration(milliseconds: 1000),
          repeatForever: false,
          totalRepeatCount: 2,
        ),
        SizedBox(height: 8),
        AnimatedTextKit(
          animatedTexts: [
            TyperAnimatedText(
              username,
              textStyle: TextStyle(
                fontSize: 20,
                color: Colors.grey[350],
              ),
              speed: Duration(milliseconds: 150),
              curve: Curves.easeInExpo,
            ),
          ],
          isRepeatingAnimation: true,
          pause: Duration(milliseconds: 1000),
          repeatForever: false,
          totalRepeatCount: 2,
        ),
      ],
    ),
  );
}
