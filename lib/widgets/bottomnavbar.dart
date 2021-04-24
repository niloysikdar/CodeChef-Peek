import 'package:codechef/constants/colors.dart';
import 'package:flutter/material.dart';

Widget bottomNavbar({
  @required Size size,
  @required isHomeActive,
  @required isFavourite,
}) {
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
          navbarItems(
            size: size,
            icon: Icons.home_rounded,
            isActive: isHomeActive,
          ),
          navbarItems(
            size: size,
            icon: Icons.favorite_rounded,
            isActive: isFavourite,
          ),
          navbarItems(
            size: size,
            icon: Icons.share_rounded,
            isActive: false,
          ),
        ],
      ),
    ),
  );
}

Widget navbarItems({
  @required Size size,
  @required IconData icon,
  @required bool isActive,
}) {
  return Container(
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
            color: isActive ? klightgreen : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Expanded(
            child: Center(
          child: Icon(
            icon,
            size: 35,
            color: klightgreen,
          ),
        )),
      ],
    ),
  );
}
