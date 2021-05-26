import 'package:codechef/screens/favusers_screen.dart';
import 'package:codechef/services/transitions.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'dart:math';
import 'package:vector_math/vector_math.dart' show radians;

class RadialMenubar extends StatefulWidget {
  @override
  _RadialMenubarState createState() => _RadialMenubarState();
}

class _RadialMenubarState extends State<RadialMenubar>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: 900),
      vsync: this,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RadialAnimation(controller: controller);
  }
}

class RadialAnimation extends StatelessWidget {
  RadialAnimation({Key key, this.controller})
      : scale = Tween<double>(
          begin: 1.0,
          end: 0.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Curves.fastOutSlowIn,
          ),
        ),
        translation = Tween<double>(
          begin: 0.0,
          end: 100.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Curves.easeInOutExpo,
          ),
        ),
        rotation = Tween<double>(
          begin: 0.0,
          end: 360.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.3,
              0.9,
              curve: Curves.decelerate,
            ),
          ),
        ),
        super(key: key);

  final AnimationController controller;
  final Animation<double> scale;
  final Animation<double> translation;
  final Animation<double> rotation;

  final String shareLink =
      "View Codechef Users' stats anonymously with just one click. Download now: https://play.google.com/store/apps/details?id=com.codechef.peek.android";

  build(context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, builder) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              buildButton(
                angle: 200,
                icon: Icons.home_rounded,
                onPressed: _close,
              ),
              buildButton(
                angle: 270,
                icon: Icons.favorite_rounded,
                onPressed: () {
                  Navigator.push(
                    context,
                    SlideLeftRoute(
                      page: FavouriteScreen(),
                    ),
                  );
                },
              ),
              buildButton(
                  angle: 340,
                  icon: Icons.share_rounded,
                  onPressed: () {
                    Share.share(
                      shareLink,
                    );
                  }),
              Transform.scale(
                scale: scale.value - 1.0,
                child: FloatingActionButton(
                  child: Icon(
                    Icons.close_rounded,
                    size: 30,
                  ),
                  onPressed: _close,
                ),
              ),
              Transform.scale(
                scale: scale.value,
                child: FloatingActionButton(
                  child: Icon(
                    Icons.settings_rounded,
                    size: 30,
                  ),
                  onPressed: _open,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildButton(
      {@required double angle,
      @required IconData icon,
      @required Function onPressed}) {
    final double rad = radians(angle);
    return Transform(
      transform: Matrix4.identity()
        ..translate(
          (translation.value) * cos(rad),
          (translation.value) * sin(rad),
        ),
      child: FloatingActionButton(
        child: Icon(icon),
        onPressed: onPressed,
      ),
    );
  }

  _open() {
    controller.forward();
  }

  _close() {
    controller.reverse();
  }
}
