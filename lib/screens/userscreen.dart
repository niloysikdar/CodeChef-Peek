import 'package:auto_size_text/auto_size_text.dart';
import 'package:codechef/constants/colors.dart';
import 'package:codechef/models/usermodel.dart';
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
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              Container(
                height: size.height * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
