import 'package:flutter/material.dart';
import 'package:codechef/services/starscolor.dart';

Widget spacerLine({@required int stars}) {
  return Container(
    height: 2,
    width: double.infinity,
    margin: EdgeInsets.symmetric(horizontal: 80),
    color: starcolor(stars: stars),
  );
}
