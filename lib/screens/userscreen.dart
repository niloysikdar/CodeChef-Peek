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
    int stars = int.parse(starsString);
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
          leading: Icon(
            Icons.close,
            color: kwhite,
          ),
          elevation: 0,
        ),
        body: Padding(
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
            ],
          ),
        ),
      ),
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
    if (stars == 1)
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
    if (stars == 1)
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
