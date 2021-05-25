import 'dart:convert';
import 'package:codechef/constants/colors.dart';
import 'package:codechef/models/favouriteuser_model.dart';
import 'package:codechef/models/usermodel.dart';
import 'package:codechef/services/shared_preferences.dart';
import 'package:codechef/widgets/addressCard.dart';
import 'package:codechef/widgets/circularprogress.dart';
import 'package:codechef/widgets/institutionCard.dart';
import 'package:codechef/widgets/namecard.dart';
import 'package:codechef/widgets/rankcard.dart';
import 'package:codechef/widgets/ratingcard.dart';
import 'package:codechef/widgets/solveCard.dart';
import 'package:codechef/widgets/spacerline.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class UserScreen extends StatefulWidget {
  final UserModel userModel;

  const UserScreen({Key key, this.userModel}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  bool isFav = false;
  List favusers = [];

  @override
  void initState() {
    super.initState();
    String favstring = FavouritePreferences.getFav();
    if (favstring != null) {
      favusers = json.decode(favstring);
    }
    for (var i = 0; i < favusers.length; i++) {
      if (favusers[i]["username"] == widget.userModel.userDetails.username) {
        setState(() {
          isFav = true;
        });
        break;
      }
    }
  }

  removeFromFab() {
    Alert(
      context: context,
      type: AlertType.info,
      style: AlertStyle(
        animationDuration: Duration(milliseconds: 350),
        animationType: AnimationType.fromBottom,
        isCloseButton: false,
        alertBorder: RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        titleStyle: TextStyle(color: Colors.white70),
        descStyle: TextStyle(color: Colors.white70),
      ),
      title: "Sorry",
      desc: "Kindly Remove from Favourite Section",
      buttons: [
        DialogButton(
          child: Text(
            "OK",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () => Navigator.pop(context),
          color: klightgreen,
        ),
      ],
    ).show();
  }

  addToFab() {
    FavouriteUser favouriteUser = FavouriteUser(
      name: widget.userModel.userDetails.name,
      username: widget.userModel.userDetails.username,
    );
    favusers.add(FavouriteUser.toMap(favouriteUser));
    FavouritePreferences.setFav(json.encode(favusers));
    isFav = true;
    setState(() {});
    Alert(
      context: context,
      type: AlertType.success,
      style: AlertStyle(
        animationDuration: Duration(milliseconds: 350),
        animationType: AnimationType.fromTop,
        isCloseButton: false,
        alertBorder: RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        titleStyle: TextStyle(color: Colors.white70),
        descStyle: TextStyle(color: Colors.white70),
      ),
      title: "Success",
      desc: "User has been added to Favourites",
      buttons: [
        DialogButton(
          child: Text(
            "OK",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () => Navigator.pop(context),
          color: klightgreen,
        ),
      ],
    ).show();
  }

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
          title: Text(
            "User Profile",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_rounded,
              color: kwhite,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: IconButton(
                icon: Icon(
                  (isFav) ? Icons.favorite : Icons.favorite_border_rounded,
                  color: (isFav) ? Colors.red : Colors.white,
                  size: 40,
                ),
                onPressed: () {
                  (isFav) ? removeFromFab() : addToFab();
                },
              ),
            ),
          ],
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
                SizedBox(height: 20),
                institutionCard(
                  type: (type != null) ? type : "NA",
                  institution: (institution != null) ? institution : "NA",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
