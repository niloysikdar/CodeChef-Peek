import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:codechef/constants/colors.dart';
import 'package:codechef/services/starscolor.dart';
import 'package:flutter/material.dart';

Widget ratingCard({
  @required int stars,
  @required String rating,
  @required String highestRating,
}) {
  return Row(
    children: [
      Expanded(
        child: Container(
          padding: EdgeInsets.only(top: 5, bottom: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Current Rating",
                style: TextStyle(
                  fontSize: 16,
                  color: klightgreen,
                ),
              ),
              SizedBox(height: 5),
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    rating,
                    textStyle: TextStyle(
                      fontSize: 30,
                      color: kwhite,
                      fontWeight: FontWeight.w600,
                    ),
                    cursor: "|",
                    speed: Duration(milliseconds: 200),
                  ),
                ],
                isRepeatingAnimation: true,
                pause: Duration(milliseconds: 2500),
                repeatForever: false,
                totalRepeatCount: 2,
              ),
            ],
          ),
        ),
      ),
      Container(
        height: 30,
        width: 2,
        color: starcolor(stars: stars),
      ),
      Expanded(
        child: Container(
          padding: EdgeInsets.only(left: 25, top: 5, bottom: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Highest Rating",
                style: TextStyle(
                  fontSize: 16,
                  color: klightgreen,
                ),
              ),
              SizedBox(height: 5),
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    highestRating,
                    textStyle: TextStyle(
                      fontSize: 30,
                      color: kwhite,
                      fontWeight: FontWeight.w600,
                    ),
                    cursor: "|",
                    speed: Duration(milliseconds: 200),
                  ),
                ],
                isRepeatingAnimation: true,
                pause: Duration(milliseconds: 2500),
                repeatForever: false,
                totalRepeatCount: 2,
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
