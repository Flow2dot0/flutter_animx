import 'package:flutter/material.dart';
import 'package:flutter_animx/models/datas.dart';
import 'package:flutter_animx/models/material_design.dart';
import 'package:flutter_animx/models/transition_type.dart';

class AnimationControllerDemo extends StatefulWidget {
  final TransitionType type;

  const AnimationControllerDemo({Key key, this.type}) : super(key: key);

  @override
  _AnimationControllerDemoState createState() =>
      _AnimationControllerDemoState();
}

class _AnimationControllerDemoState extends State<AnimationControllerDemo>
    with SingleTickerProviderStateMixin {
  Image _image = Image.asset(Datas().flutter);
  AnimationController _animationController;
  Duration _duration = Duration(seconds: 1);
  DecorationTween decorationTween;
  Animation<Decoration> animationDecoration;
  CurvedAnimation curvedAnimation;

  bool isAnim = false;
  double max;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: _duration,
    );
    curvedAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear);
    setupDecoration();
  }

  setupDecoration() {
    BoxDecoration begin = BoxDecoration(
        color: Colors.lightBlue, borderRadius: BorderRadius.circular(15));
    BoxDecoration end = BoxDecoration(
        color: Colors.orange, borderRadius: BorderRadius.circular(500));
    decorationTween = DecorationTween(begin: begin, end: end);
    animationDecoration = decorationTween.animate(curvedAnimation);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget transition() {
    switch (widget.type) {
      case TransitionType.decoratedBox:
        return decoreatedBox();
      case TransitionType.fade:
        return fade();
      case TransitionType.position:
        return position();
      case TransitionType.rotation:
        return rotation();
      case TransitionType.scale:
        return scale();
      case TransitionType.size:
        return size();
      case TransitionType.slide:
        return slide();
      default:
        return EmptyWidget();
    }
  }

  DecoratedBoxTransition decoreatedBox() {
    return DecoratedBoxTransition(
      decoration: animationDecoration,
      child: _image,
    );
  }

  FadeTransition fade() {
    return FadeTransition(
      opacity: Tween<double>(begin: 1, end: 0.33).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Curves.easeOut,
        ),
      ),
      child: _image,
    );
  }

  Widget position() {
    return Stack(
      children: <Widget>[
        PositionedTransition(
          rect: RelativeRectTween(
                  begin: RelativeRect.fromLTRB(0, 0, 0, 0),
                  end: RelativeRect.fromLTRB(max, max, max, max))
              .animate(CurvedAnimation(
                  parent: _animationController, curve: Curves.linear)),
          child: Container(
            color: Colors.orange,
          ),
        ),
        PositionedTransition(
          rect: RelativeRectTween(
            begin: RelativeRect.fromLTRB(0, 0, 0, 0),
            end: RelativeRect.fromLTRB(200, 250, 0, 0),
          ).animate(curvedAnimation),
          child: _image,
        ),
      ],
    );
  }

  RotationTransition rotation() {
    Tween<double> t = Tween<double>(begin: 0, end: 0.75);
    return RotationTransition(
      turns: t.animate(curvedAnimation),
      child: _image,
    );
  }

  ScaleTransition scale() {
    return ScaleTransition(
      scale: Tween<double>(begin: 1, end: 0.15).animate(curvedAnimation),
      child: _image,
    );
  }

  SizeTransition size() {
    return SizeTransition(
      sizeFactor: Tween<double>(begin: 1, end: 0.2).animate(curvedAnimation),
      child: _image,
      axis: Axis.horizontal,
    );
  }

  SlideTransition slide() {
    return SlideTransition(
      position: Tween<Offset>(begin: Offset(1, 1), end: Offset(0, 0))
          .animate(curvedAnimation),
      child: _image,
    );
  }

  performTransition() {
    if (isAnim) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
    isAnim = !isAnim;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    max = size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          height: max,
          width: max,
          child: Center(
            child: transition(),
          ),
        ),
        FlatButton(
          onPressed: performTransition,
          child: Text(
            'Do transition',
          ),
        ),
      ],
    );
  }
}
