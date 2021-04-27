import 'package:codechef/constants/colors.dart';
import 'package:codechef/models/usermodel.dart';
import 'package:codechef/widgets/addressCard.dart';
import 'package:codechef/widgets/circularprogress.dart';
import 'package:codechef/widgets/namecard.dart';
import 'package:codechef/widgets/rankcard.dart';
import 'package:codechef/widgets/ratingcard.dart';
import 'package:codechef/widgets/solveCard.dart';
import 'package:codechef/widgets/spacerline.dart';
import 'package:flutter/material.dart';

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
                SizedBox(height: 20),
                solveCard(
                  size: size,
                  fullySolved: fullySolved,
                  partiallySolved: partiallySolved,
                ),
                SizedBox(height: 20),
                spacerLine(stars: stars),
                SizedBox(height: 20),
                addressCrad(
                  city: (city != null) ? city : "NA",
                  state: (state != null) ? state : "NA",
                  country: (country != null) ? country : "NA",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
