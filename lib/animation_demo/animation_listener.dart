import 'package:flutter/material.dart';
import 'package:flutter_animx/models/datas.dart';

class AnimationListenerDemo extends StatefulWidget {
  @override
  _AnimationListenerDemoState createState() => _AnimationListenerDemoState();
}

class _AnimationListenerDemoState extends State<AnimationListenerDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> animation;
  bool opcaity = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    animation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.linear)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              setState(() {
                opcaity = !opcaity;
              });
//              _animationController.reverse();
//              Datas().pusher(
//                  context,
//                  'After anim',
//                  Center(
//                    child: Text('New page'),
//                  ));
            } else if (status == AnimationStatus.dismissed) {
//              _animationController.forward();

            }
          })
//        ..addListener(() {
//          print(_animationController.value);
//          if (_animationController.isCompleted)
//            _animationController.reverse();
//          else if (_animationController.isDismissed)
//            _animationController.forward();
//        }),
        );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RotationTransition(
        turns: animation,
        child: AnimatedOpacity(
          opacity: opcaity ? 0.2 : 1,
          duration: Duration(seconds: 3),
          child: Image.asset(Datas().flutter),
        ),
      ),
    );
  }
}
