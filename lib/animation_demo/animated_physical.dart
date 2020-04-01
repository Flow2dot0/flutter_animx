import 'package:flutter/material.dart';

class AnimatedPhysicalDemo extends StatefulWidget {
  @override
  _AnimatedPhysicalDemoState createState() => _AnimatedPhysicalDemoState();
}

class _AnimatedPhysicalDemoState extends State<AnimatedPhysicalDemo> {
  bool anim = false;

  @override
  Widget build(BuildContext context) {
    double max = MediaQuery.of(context).size.width * 0.75;

    return Center(
      child: InkWell(
        child: AnimatedPhysicalModel(
          child: Container(
            height: max,
            width: max,
          ),
          shape: BoxShape.rectangle,
          elevation: anim ? 8 : 0,
          color: anim ? Colors.lightGreenAccent : Colors.deepOrangeAccent,
          shadowColor: anim ? Colors.grey : Colors.white,
          duration: Duration(seconds: 2),
        ),
        onTap: () {
          setState(() {
            anim = !anim;
          });
        },
      ),
    );
  }
}
