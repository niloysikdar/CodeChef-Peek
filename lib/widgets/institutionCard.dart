import 'package:codechef/constants/colors.dart';
import 'package:flutter/material.dart';

Widget institutionCard({
  @required String type,
  @required String institution,
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
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Student/Professional",
                        style: TextStyle(
                          fontSize: 16,
                          color: klightgreen,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        type,
                        style: TextStyle(
                          fontSize: 20,
                          color: klightwhite,
                        ),
                      ),
                    ],
                  ),
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
                        Icons.laptop_mac_rounded,
                        size: 30,
                        color: klightwhite,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 7),
              Text(
                "Institution",
                style: TextStyle(
                  fontSize: 16,
                  color: klightgreen,
                ),
              ),
              SizedBox(height: 3),
              Text(
                institution,
                style: TextStyle(
                  fontSize: 18,
                  color: klightwhite,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
