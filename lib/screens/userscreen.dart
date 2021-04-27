import 'package:codechef/constants/colors.dart';
import 'package:codechef/models/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class UserScreen extends StatefulWidget {
  final UserModel userModel;

  const UserScreen({Key key, this.userModel}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String name = widget.userModel.userDetails.name;
    String username = widget.userModel.userDetails.username;
    String rating = widget.userModel.rating;
    String highestRating = widget.userModel.highestRating;
    String starsString = widget.userModel.stars.toString().split("")[0];
    int stars = (starsString != "n") ? int.parse(starsString) : 0;
    String globalRank = widget.userModel.globalRank;
    String countryRank = widget.userModel.countryRank;
    String fullySolved = widget.userModel.fullySolved.count;
    String partiallySolved = widget.userModel.partiallySolved.count;
    String country = widget.userModel.userDetails.country;
    String state = widget.userModel.userDetails.state;
    String city = widget.userModel.userDetails.city;
    String type = widget.userModel.userDetails.studentProfessional;
    String institution = widget.userModel.userDetails.institution;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.close,
              color: kwhite,
            ),
          ),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                Container(
                  height: size.height * 0.335,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        child: nameCard(
                          size: size,
                          name: name,
                          username: username,
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        child: circularProgress(
                          size: size,
                          stars: stars,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                ratingCard(
                  stars: stars,
                  rating: rating,
                  highestRating: highestRating,
                ),
                SizedBox(height: 20),
                spacerLine(stars: stars),
                SizedBox(height: 20),
                rankCard(
                  stars: stars,
                  globalRank: globalRank,
                  countryRank: countryRank,
                ),
                SizedBox(height: 20),
                spacerLine(stars: stars),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget spacerLine({@required int stars}) {
    return Container(
      height: 2,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 80),
      color: starcolor(stars: stars),
    );
  }

  Widget rankCard({
    @required int stars,
    @required String globalRank,
    @required String countryRank,
  }) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   "User Ranks",
          //   style: TextStyle(
          //     color: klightgreen,
          //     fontSize: 25,
          //     fontWeight: FontWeight.w600,
          //   ),
          // ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: kwhite,
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.emoji_events_rounded,
                      size: 40,
                      color: starcolor(stars: stars),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Global Rank",
                      style: TextStyle(
                        fontSize: 20,
                        color: klightgreen,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      globalRank,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: klightwhite,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Country Rank",
                      style: TextStyle(
                        fontSize: 20,
                        color: klightgreen,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      countryRank,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: klightwhite,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 20),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: kwhite,
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.emoji_events_rounded,
                      size: 40,
                      color: starcolor(stars: stars),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget ratingCard({
    @required int stars,
    @required String rating,
    @required String highestRating,
  }) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.only(top: 5, bottom: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Current Rating",
                  style: TextStyle(
                    fontSize: 16,
                    color: klightgreen,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  rating,
                  style: TextStyle(
                    fontSize: 30,
                    color: kwhite,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 30,
          width: 2,
          color: starcolor(stars: stars),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(left: 25, top: 5, bottom: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Highest Rating",
                  style: TextStyle(
                    fontSize: 16,
                    color: klightgreen,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  highestRating,
                  style: TextStyle(
                    fontSize: 30,
                    color: kwhite,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

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

  Color starcolorback({@required int stars}) {
    if (stars == 0 || stars == 1)
      return Colors.grey[200];
    else if (stars == 2)
      return Colors.green[200];
    else if (stars == 3)
      return Colors.blue[200];
    else if (stars == 4)
      return Colors.purple[200];
    else if (stars == 5)
      return Colors.yellow[200];
    else if (stars == 6)
      return Colors.orange[200];
    else
      return Colors.red[200];
  }

  Color starcolor({@required int stars}) {
    if (stars == 0 || stars == 1)
      return Colors.grey;
    else if (stars == 2)
      return Colors.green;
    else if (stars == 3)
      return Colors.blue;
    else if (stars == 4)
      return Colors.purple;
    else if (stars == 5)
      return Colors.yellow[700];
    else if (stars == 6)
      return Colors.orange;
    else
      return Colors.red;
  }

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
}
