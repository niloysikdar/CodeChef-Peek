import 'package:codechef/constants/colors.dart';
import 'package:flutter/material.dart';

Widget bottomNavbar({Size size}) {
  return Positioned(
    bottom: 0,
    left: 0,
    height: size.height * 0.1,
    width: size.width,
    child: Container(
      height: size.height * 0.1,
      width: size.width,
      decoration: BoxDecoration(
        color: kblack,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: size.height * 0.2,
            width: size.width * 0.18,
            // color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 5,
                  margin: EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                    color: klightgreen,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Icon(
                      Icons.home_rounded,
                      size: 40,
                      color: klightgreen,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: size.height * 0.2,
            width: size.width * 0.18,
            // color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 5,
                  margin: EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Expanded(
                    child: Center(
                  child: Icon(
                    Icons.favorite_rounded,
                    size: 40,
                    color: klightgreen,
                  ),
                )),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
