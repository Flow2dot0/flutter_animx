import 'package:flutter/material.dart';
import 'package:flutter_animx/models/datas.dart';
import 'dart:math' as math;

class AnimatedBuilderDemo extends StatefulWidget {
  @override
  _AnimatedBuilderDemoState createState() => _AnimatedBuilderDemoState();
}

class _AnimatedBuilderDemoState extends State<AnimatedBuilderDemo>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Image _image = Image.asset(Datas().flutter);
  Animation<double> scale;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3))
          ..repeat();
    scale = Tween<double>(begin: 0.1, end: 10).animate(
        CurvedAnimation(parent: animationController, curve: Curves.linear));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animationController,
        child: _image,
        builder: (_, child) {
//          return Transform.rotate(
//            angle: animationController.value * 2 * math.pi,
//            child: child,
//          );
          return Transform.scale(
            scale: scale.value,
            child: child,
          );
        },
      ),
    );
  }
}
