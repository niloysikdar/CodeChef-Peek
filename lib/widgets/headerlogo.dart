import 'package:codechef/constants/colors.dart';
import 'package:flutter/material.dart';

Widget headerLogo({@required Size size}) {
  return Container(
    height: size.height * 0.2,
    child: Stack(
      children: [
        ClipPath(
          clipper: MyClipper(),
          child: Container(
            color: klightgreen,
          ),
        ),
        Positioned(
          bottom: 0,
          left: (size.width * 0.7) / 2,
          child: Container(
            height: size.width * 0.30,
            width: size.width * 0.30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(500),
              image: DecorationImage(
                image: AssetImage("assets/codechef.jpg"),
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
              boxShadow: [
                BoxShadow(
                  color: klightgreen,
                  blurRadius: 0.0,
                  spreadRadius: 8.0,
                  offset: Offset(0, 0),
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
