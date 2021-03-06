import 'dart:ui';
import 'package:codechef/constants/colors.dart';
import 'package:codechef/models/usermodel.dart';
import 'package:codechef/screens/userscreen.dart';
import 'package:codechef/services/getuser.dart';
import 'package:codechef/services/transitions.dart';
import 'package:codechef/services/validation.dart';
import 'package:codechef/widgets/headerlogo.dart';
import 'package:codechef/widgets/radial_menubar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:in_app_update/in_app_update.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController usernamecontroller;
  bool isSearching = false;
  final _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  String appurl =
      "https://play.google.com/store/apps/details?id=com.codechef.peek.android";

  AppUpdateInfo _updateInfo;

  Future<void> checkForUpdate() async {
    InAppUpdate.checkForUpdate().then((info) {
      setState(() {
        _updateInfo = info;
      });
    }).catchError((e) {
      showSnack(e.toString());
    });
  }

  void showSnack(String text) {
    if (_scaffoldKey.currentContext != null) {
      ScaffoldMessenger.of(_scaffoldKey.currentContext)
          .showSnackBar(SnackBar(content: Text(text)));
    }
  }

  checkUpdate() async {
    await checkForUpdate();
    if (_updateInfo != null &&
        _updateInfo.updateAvailability == UpdateAvailability.updateAvailable) {
      InAppUpdate.performImmediateUpdate().catchError(
        (e) => showSnack(e.toString()),
      );
    }
  }

  RateMyApp _rateMyApp = RateMyApp(
    preferencesPrefix: 'rateMyApp_',
    minDays: 0,
    minLaunches: 2,
    remindDays: 2,
    remindLaunches: 3,
  );

  _launchPlayStore() async {
    if (await canLaunch(appurl)) {
      final bool launchSeccess = await launch(
        appurl,
        forceSafariVC: false,
        universalLinksOnly: true,
      );
      if (!launchSeccess) {
        await launch(appurl, forceSafariVC: true);
      }
    }
  }

  openRating() {
    _rateMyApp.init().then((_) {
      if (_rateMyApp.shouldOpenDialog) {
        _rateMyApp.showStarRateDialog(
          context,
          title: "Enjoying CodeChef Peek !",
          message: "Please leave a rating and review :)",
          actionsBuilder: (context, stars) {
            return [
              TextButton(
                child: Text(
                  "OK",
                  style: TextStyle(
                    color: klightgreen,
                    fontSize: 20,
                  ),
                ),
                onPressed: () async {
                  if (stars >= 3.0) {
                    _rateMyApp.save();
                    await _rateMyApp
                        .callEvent(RateMyAppEventType.rateButtonPressed);
                    Navigator.pop<RateMyAppDialogButton>(
                        context, RateMyAppDialogButton.rate);
                    _launchPlayStore();
                  } else {
                    Navigator.pop(context);
                  }
                },
              )
            ];
          },
          ignoreNativeDialog: true,
          dialogStyle: DialogStyle(
            titleAlign: TextAlign.center,
            messageAlign: TextAlign.center,
            messagePadding: EdgeInsets.only(bottom: 20.0),
          ),
          starRatingOptions: StarRatingOptions(),
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    usernamecontroller = TextEditingController();
    try {
      checkUpdate();
    } catch (e) {
      // print(e.toString());
    }
    openRating();
  }

  @override
  void dispose() {
    usernamecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: (!isSearching)
            ? Container(
                constraints: BoxConstraints(
                  minHeight: 170,
                ),
                color: Colors.transparent,
                child: RadialMenubar(),
              )
            : null,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  headerLogo(
                    size: size,
                    context: context,
                  ),
                  SizedBox(height: size.height * 0.1),
                  TweenAnimationBuilder<double>(
                    tween: Tween(begin: 1.0, end: 0.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: inputField(
                        controller: usernamecontroller,
                      ),
                    ),
                    duration: Duration(milliseconds: 1200),
                    curve: Curves.easeInToLinear,
                    builder: (context, value, child) {
                      return Transform.translate(
                        offset: Offset(-(size.width / 2) * value, 0.0),
                        child: child,
                      );
                    },
                  ),
                  SizedBox(height: size.height * 0.1),
                  TweenAnimationBuilder<double>(
                    tween: Tween(begin: 1.0, end: 0.0),
                    child: getButton(size: size),
                    duration: Duration(milliseconds: 1200),
                    curve: Curves.easeInToLinear,
                    builder: (context, value, child) {
                      return Transform.translate(
                        offset: Offset((size.width / 2) * value, 0.0),
                        child: child,
                      );
                    },
                  ),
                ],
              ),
            ),
            (isSearching)
                ? searching(size: size)
                : Container(height: 0, width: 0),
          ],
        ),
      ),
    );
  }

  void serchUser() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        isSearching = true;
      });
      await getUser(
        context: context,
        username: usernamecontroller.text,
      );
      setState(() {
        isSearching = false;
      });
    }
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

  Widget getButton({@required Size size}) {
    return InkWell(
      onTap: () {
        serchUser();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 6),
        width: size.width * 0.45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              klightbackground,
              klightgreen,
              Colors.white60,
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: klightgreen.withOpacity(0.6),
              blurRadius: 0.0,
              spreadRadius: 1.0,
              offset: Offset(-1, 1),
            ),
          ],
        ),
        child: Center(
          child: Text(
            "Get Details",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget inputField({@required TextEditingController controller}) {
    return Form(
      key: _formKey,
      child: TextFormField(
        controller: controller,
        style: TextStyle(
          fontSize: 22,
          color: klightwhite,
        ),
        cursorColor: klightgreen,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          hintText: 'Codechef Username',
          hintStyle: TextStyle(
            color: Colors.white60,
          ),
          errorStyle: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: klightgreen,
              width: 1.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: klightgreen,
              width: 1.0,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: klightgreen,
              width: 1.0,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: klightgreen,
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: klightgreen,
              width: 1.5,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: klightgreen,
              width: 1.0,
            ),
          ),
        ),
        validator: nameValidate,
      ),
    );
  }
}

getUser({
  @required BuildContext context,
  @required String username,
}) async {
  try {
    http.Response response = await getResponse(username);
    if (response.statusCode != 404) {
      try {
        UserModel userModel = await getValidUser(response);
        Navigator.push(
          context,
          SlideLeftRoute(
            page: UserScreen(userModel: userModel),
          ),
        );
      } catch (e) {
        String res = await getInvalidUser(response);
        showalertFunc(context: context, title: res);
      }
    } else {
      showalertFunc(context: context, title: "Error, try again later !");
    }
  } catch (e) {
    showalertFunc(context: context, title: "Check your Internet Connection");
  }
}

showalertFunc({
  @required BuildContext context,
  @required String title,
}) {
  Alert(
    context: context,
    type: AlertType.error,
    style: AlertStyle(
      animationDuration: Duration(milliseconds: 350),
      animationType: AnimationType.grow,
      isCloseButton: false,
      alertBorder: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(10),
      ),
      titleStyle: TextStyle(color: Colors.white70),
      descStyle: TextStyle(color: Colors.white70),
    ),
    title: "Error !",
    desc: title,
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
