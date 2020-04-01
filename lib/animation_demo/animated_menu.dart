import 'package:flutter/material.dart';
import 'package:flutter_animx/models/datas.dart';
import 'package:vector_math/vector_math.dart' show radians;
import 'dart:math' as math;

class AnimatedMenu extends StatefulWidget {
  @override
  _AnimatedMenuState createState() => _AnimatedMenuState();
}

class _AnimatedMenuState extends State<AnimatedMenu>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Duration duration = Duration(seconds: 1);
  CurvedAnimation curvedAnimation;
  Animation<double> _scale;
  Animation<double> move;
  Animation<double> rotation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: duration,
    );
    curvedAnimation =
        CurvedAnimation(parent: animationController, curve: Curves.linear);
    _scale = Tween<double>(begin: 1, end: 0).animate(curvedAnimation);
    move = Tween<double>(begin: 0, end: 75).animate(curvedAnimation);
    rotation =
        Tween<double>(begin: 0, end: math.pi * 4).animate(curvedAnimation);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  Stack stack() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        menuChoice(Icons.hearing, Colors.teal, '0', closeMenu, 0),
        menuChoice(Icons.hearing, Colors.deepOrangeAccent, '1', closeMenu, 90),
        menuChoice(Icons.hearing, Colors.white, '2', closeMenu, 180),
        menuChoice(Icons.hearing, Colors.green, '3', closeMenu, 270),
        Transform.scale(
          scale: _scale.value - 1,
          child: fab(Icons.close, Colors.red, 'Close', closeMenu),
        ),
        Transform.scale(
          scale: _scale.value,
          child: fab(Icons.menu, Colors.blue, 'Open', openMenu),
        ),
      ],
    );
  }

  FloatingActionButton fab(
      IconData icon, Color color, String tag, VoidCallback onPressed) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(icon),
      backgroundColor: color,
      heroTag: tag,
    );
  }

  FloatingActionButton menFab(IconData icon, Color color, String tag) {
    return FloatingActionButton(
      onPressed: () {
        menuSelected(color);
      },
      child: Icon(icon),
      backgroundColor: color,
      heroTag: tag,
    );
  }

  menuChoice(IconData icon, Color color, String tag, VoidCallback onPressed,
      double angle) {
    double radian = radians(angle);
    double x = move.value * math.cos(radian);
    double y = move.value * math.sin(radian);

    return Transform(
      transform: Matrix4.identity()..translate(x, y),
      child: menFab(icon, color, tag),
    );
  }

  menuSelected(Color color) {
    closeMenu();
    Datas().pusher(
        context,
        color.toString(),
        Container(
          color: color,
        ));
  }

  openMenu() {
    animationController.forward();
  }

  closeMenu() {
    animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (ctx, builder) {
        return Transform.rotate(
          angle: rotation.value,
          child: stack(),
        );
      },
    );
  }
}
