import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:codechef/constants/colors.dart';
import 'package:codechef/services/starscolor.dart';
import 'package:flutter/material.dart';

Widget rankCard({
  @required int stars,
  @required String globalRank,
  @required String countryRank,
}) {
  return Container(
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: kwhite,
                  borderRadius: BorderRadius.all(
                    Radius.circular(100),
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.emoji_events_rounded,
                    size: 40,
                    color: starcolor(stars: stars),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Global Rank",
                    style: TextStyle(
                      fontSize: 20,
                      color: klightgreen,
                    ),
                  ),
                  SizedBox(height: 5),
                  AnimatedTextKit(
                    animatedTexts: [
                      WavyAnimatedText(
                        globalRank,
                        textStyle: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: klightwhite,
                        ),
                        speed: Duration(milliseconds: 250),
                      ),
                    ],
                    pause: Duration(milliseconds: 2500),
                    repeatForever: true,
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Country Rank",
                    style: TextStyle(
                      fontSize: 20,
                      color: klightgreen,
                    ),
                  ),
                  SizedBox(height: 5),
                  AnimatedTextKit(
                    animatedTexts: [
                      WavyAnimatedText(
                        countryRank,
                        textStyle: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: klightwhite,
                        ),
                        speed: Duration(milliseconds: 250),
                      ),
                    ],
                    pause: Duration(milliseconds: 2500),
                    repeatForever: true,
                  ),
                ],
              ),
              SizedBox(width: 20),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: kwhite,
                  borderRadius: BorderRadius.all(
                    Radius.circular(100),
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.emoji_events_rounded,
                    size: 40,
                    color: starcolor(stars: stars),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
