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
        Text(
          name,
          style: TextStyle(
            fontSize: 25,
            color: kwhite,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 8),
        Text(
          username,
          style: TextStyle(
            fontSize: 20,
            color: Colors.grey[350],
          ),
        ),
      ],
    ),
  );
}
