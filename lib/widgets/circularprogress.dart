import 'package:codechef/constants/colors.dart';
import 'package:codechef/services/starscolor.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

Widget circularProgress({
  @required Size size,
  @required int stars,
}) {
  return CircularPercentIndicator(
    radius: size.width * 0.35,
    animation: true,
    animationDuration: 1000,
    lineWidth: 17.0,
    percent: (stars / 7),
    center: Container(
      height: size.width * 0.35 - 33,
      width: size.width * 0.35 - 33,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(100),
        ),
        color: kwhite,
      ),
      child: Center(
        child: Text(
          stars.toString() + "★",
          style: TextStyle(
            fontSize: size.width * 0.085,
            color: starcolor(stars: stars),
          ),
        ),
      ),
    ),
    circularStrokeCap: CircularStrokeCap.butt,
    backgroundColor: starcolorback(stars: stars),
    progressColor: starcolor(stars: stars),
  );
}
