import 'package:auto_size_text/auto_size_text.dart';
import 'package:codechef/constants/colors.dart';
import 'package:codechef/models/usermodel.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  final UserModel userModel;

  const UserScreen({Key key, this.userModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kdarkbackground,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kdarkbackground,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              color: kdarkbackground,
              child: Icon(
                Icons.close,
                color: Colors.white,
                size: 33.0,
              ),
            ),
          ),
          title: Text(
            "User Details",
            style: TextStyle(
              color: Colors.white,
              fontSize: 23.0,
            ),
          ),
          actions: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              color: kdarkbackground,
              child: Icon(
                Icons.star_rounded,
                size: 35.0,
                color: klightpurple,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(bottom: 25.0, top: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DoubleCard(
                  title1: "Name",
                  value1: userModel.userDetails.name,
                  title2: "Username",
                  value2: userModel.userDetails.username,
                ),
                DoubleCard(
                  title1: "Rating",
                  value1: userModel.rating,
                  title2: "Stars",
                  value2: userModel.stars,
                ),
                DoubleCard(
                  title1: "Global Rank",
                  value1: userModel.globalRank,
                  title2: "Country Rank",
                  value2: userModel.countryRank,
                ),
                SingleCard(
                  title1: "Highest Rating",
                  value1: userModel.highestRating,
                ),
                DoubleCard(
                  title1: "Fully Solved",
                  value1: userModel.fullySolved.count,
                  title2: "Partially Solved",
                  value2: userModel.partiallySolved.count,
                ),
                DoubleCard(
                  title1: "Country",
                  value1: userModel.userDetails.country,
                  title2: "State",
                  value2: userModel.userDetails.state,
                ),
                DoubleCard(
                  title1: "City",
                  value1: userModel.userDetails.city,
                  title2: "Type",
                  value2: userModel.userDetails.studentProfessional,
                ),
                SingleCard(
                  title1: "Institution",
                  value1: userModel.userDetails.institution,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DoubleCard extends StatelessWidget {
  final String title1, value1, title2, value2;

  const DoubleCard(
      {Key key, this.title1, this.value1, this.title2, this.value2})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            margin: EdgeInsets.only(
              left: 10.0,
              top: 5.0,
              right: 5.0,
              bottom: 5.0,
            ),
            padding: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: Color(0xff383838),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AutoSizeText(
                  title1,
                  maxLines: 1,
                  style: TextStyle(
                    color: klightpurple,
                    fontSize: 22.0,
                  ),
                ),
                SizedBox(height: 8.0),
                AutoSizeText(
                  (value1 != null) ? value1 : "NA",
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21.0,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            margin: EdgeInsets.only(
              left: 5.0,
              top: 5.0,
              right: 10.0,
              bottom: 5.0,
            ),
            padding: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: Color(0xff383838),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AutoSizeText(
                  title2,
                  maxLines: 1,
                  style: TextStyle(
                    color: klightpurple,
                    fontSize: 22.0,
                  ),
                ),
                SizedBox(height: 8.0),
                AutoSizeText(
                  (value2 != null) ? value2 : "NA",
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SingleCard extends StatelessWidget {
  final String title1, value1;

  const SingleCard({Key key, this.title1, this.value1}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 10.0,
      ),
      padding: EdgeInsets.all(15.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: klightgrey,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        children: [
          AutoSizeText(
            title1,
            maxLines: 1,
            style: TextStyle(
              color: klightpurple,
              fontSize: 22.0,
            ),
          ),
          SizedBox(height: 8.0),
          AutoSizeText(
            (value1 != null) ? value1 : "NA",
            textAlign: TextAlign.center,
            maxLines: 2,
            style: TextStyle(
              color: Colors.white,
              fontSize: 21.0,
            ),
          ),
        ],
      ),
    );
  }
}
