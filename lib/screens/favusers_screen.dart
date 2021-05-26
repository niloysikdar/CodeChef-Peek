import 'dart:convert';
import 'package:codechef/constants/colors.dart';
import 'package:codechef/models/favouriteuser_model.dart';
import 'package:codechef/screens/homepage.dart';
import 'package:codechef/services/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FavouriteScreen extends StatefulWidget {
  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  String fav;
  List favusers = [];
  final listKey = GlobalKey<AnimatedListState>();
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    fav = FavouritePreferences.getFav();
    if (fav != null) {
      favusers = json.decode(fav).reversed.toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "Favourite Users",
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
              String finalUsers = json.encode(favusers.reversed.toList());
              FavouritePreferences.setFav(finalUsers);
              Navigator.pop(context);
            },
          ),
          elevation: 0,
        ),
        body: Stack(
          children: [
            AnimatedList(
              key: listKey,
              initialItemCount: favusers.length,
              shrinkWrap: true,
              itemBuilder: (context, index, animation) {
                FavouriteUser favouriteUser = FavouriteUser(
                  name: favusers[index]["name"],
                  username: favusers[index]["username"],
                );
                return favCard(
                  favouriteUser: favouriteUser,
                  animation: animation,
                  onDelete: () {
                    removeItem(index);
                    String finalUsers = json.encode(favusers.reversed.toList());
                    FavouritePreferences.setFav(finalUsers);
                  },
                );
              },
            ),
            (isSearching)
                ? searching(size: size)
                : Container(height: 0, width: 0),
          ],
        ),
      ),
    );
  }

  Widget favCard({
    @required FavouriteUser favouriteUser,
    @required Animation<double> animation,
    @required Function onDelete,
  }) {
    return SlideTransition(
      key: ValueKey(favouriteUser.username),
      position: Tween<Offset>(
        begin: Offset(-1, 0),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: animation,
          curve: Curves.linear,
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              draculaorchid,
              americanriver,
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  serchUser(favouriteUser.username);
                },
                child: Container(
                  color: Colors.transparent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        favouriteUser.name,
                        style: TextStyle(
                          fontSize: 24,
                          color: kwhite,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        favouriteUser.username,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey[350],
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "View  ➜",
                        style: TextStyle(
                          fontSize: 20,
                          color: kwhite,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: 5),
            IconButton(
              icon: Icon(
                Icons.delete_rounded,
                color: Colors.red[700],
                size: 40,
              ),
              onPressed: onDelete,
            )
          ],
        ),
      ),
    );
  }

  void removeItem(int index) {
    final favouriteUser = FavouriteUser(
      name: favusers[index]["name"],
      username: favusers[index]["username"],
    );
    favusers.removeAt(index);
    listKey.currentState.removeItem(
      index,
      (context, animation) => favCard(
        favouriteUser: favouriteUser,
        animation: animation,
        onDelete: () {},
      ),
      duration: Duration(milliseconds: 500),
    );
  }

  void serchUser(String username) async {
    setState(() {
      isSearching = true;
    });
    await getUser(
      context: context,
      username: username,
    );
    setState(() {
      isSearching = false;
    });
  }

  Widget searching({@required Size size}) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.7,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.grey[700],
          ),
        ),
        Center(
          child: SpinKitFadingCircle(
            size: size.width * 0.3,
            color: klightgreen,
          ),
        ),
      ],
    );
  }
}
