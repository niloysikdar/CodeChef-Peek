import 'package:codechef/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

Widget solveCard({
  @required Size size,
  @required String fullySolved,
  @required String partiallySolved,
}) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(25),
      ),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          draculaorchid,
          americanriver,
        ],
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Fully Solved",
                  style: TextStyle(
                    fontSize: 16,
                    color: klightgreen,
                  ),
                ),
                Text(
                  fullySolved,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.green[400],
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Partially Solved",
                  style: TextStyle(
                    fontSize: 16,
                    color: klightgreen,
                  ),
                ),
                Text(
                  partiallySolved,
                  style: TextStyle(
                    fontSize: 30,
                    color: Color(0xffd6ba22),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
        solvedProgress(
          size: size,
          fullySolved: fullySolved,
          partiallySolved: partiallySolved,
        ),
      ],
    ),
  );
}

Widget solvedProgress({
  @required Size size,
  @required String fullySolved,
  @required String partiallySolved,
}) {
  int fullySolvedint = int.parse(fullySolved);
  int partiallySolvedint = int.parse(partiallySolved);
  int totalSolved = fullySolvedint + partiallySolvedint;
  return CircularPercentIndicator(
    radius: size.width * 0.3,
    animation: true,
    animationDuration: 1000,
    lineWidth: 17.0,
    percent: (fullySolvedint / totalSolved),
    circularStrokeCap: CircularStrokeCap.butt,
    backgroundColor: Color(0xffd6ba22),
    progressColor: Colors.green[400],
  );
}
