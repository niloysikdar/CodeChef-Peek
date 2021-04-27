import 'package:codechef/constants/colors.dart';
import 'package:flutter/material.dart';

Widget addressCrad({
  @required String city,
  @required String state,
  @required String country,
}) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: draculaorchid,
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.all(
            //   Radius.circular(100),
            // ),
            // border: Border.all(
            //   color: klightgreen,
            //   width: 1,
            //   style: BorderStyle.solid,
            // ),
            border: Border(
              bottom: BorderSide(
                color: klightgreen,
                width: 2,
              ),
            ),
          ),
          child: Center(
            child: Icon(
              Icons.location_on_rounded,
              size: 30,
              color: klightwhite,
            ),
          ),
        ),
        SizedBox(width: 25),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "City",
              style: TextStyle(
                fontSize: 16,
                color: klightgreen,
              ),
            ),
            SizedBox(height: 3),
            Text(
              city,
              style: TextStyle(
                fontSize: 20,
                color: klightwhite,
              ),
            ),
            SizedBox(height: 7),
            Text(
              "State",
              style: TextStyle(
                fontSize: 16,
                color: klightgreen,
              ),
            ),
            SizedBox(height: 3),
            Text(
              state,
              style: TextStyle(
                fontSize: 20,
                color: klightwhite,
              ),
            ),
            SizedBox(height: 7),
            Text(
              "Country",
              style: TextStyle(
                fontSize: 16,
                color: klightgreen,
              ),
            ),
            SizedBox(height: 3),
            Text(
              country,
              style: TextStyle(
                fontSize: 20,
                color: klightwhite,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
