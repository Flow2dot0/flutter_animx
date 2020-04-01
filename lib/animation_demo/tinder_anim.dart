import 'package:flutter/material.dart';
import 'package:flutter_animx/models/datas.dart';
import 'package:flutter_animx/models/greek_city.dart';

class TinderAnimDemo extends StatefulWidget {
  @override
  _TinderAnimDemoState createState() => _TinderAnimDemoState();
}

class _TinderAnimDemoState extends State<TinderAnimDemo>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Duration duration = Duration(seconds: 1);
  List<GreekCity> cities = Datas().cities;
  Animation<double> turn;
  CurvedAnimation animation;
  Animation<Offset> move;

  bool isDetail = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(vsync: this, duration: duration);
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.linear);
    setupRotation(0.2);
    setupMove(-1);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: cards(),
    );
  }

  List<Widget> cards() {
    List<Widget> c = [];
    for (int x = 0; x < cities.length; x++) {
      double bottom = 10.0 * x + 20.0;
      double top = (5.0 - x) * 10;
      Card newTinderCard = tinderCard(cities[x]);
      if (x == 0) {
        RelativeRect rect = RelativeRect.fromLTRB(10, top, 10, bottom);
        RotationTransition transition = RotationTransition(
          turns: turn,
          child: newTinderCard,
        );
        SlideTransition slideTransition = SlideTransition(
          position: move,
          child: transition,
        );

        AnimatedPositioned pos = AnimatedPositioned(
          child: slideTransition,
          duration: duration,
          left: isDetail ? 0 : rect.left,
          right: isDetail ? 0 : rect.right,
          top: isDetail ? 0 : rect.top,
          bottom: isDetail ? 0 : rect.bottom,
        );

        c.add(pos);
      } else {
        Positioned positioned = Positioned(
          child: newTinderCard,
          top: top,
          bottom: bottom,
          left: 10,
          right: 10,
        );
        c.add(positioned);
      }
    }
    return c.reversed.toList();
  }

  Card tinderCard(GreekCity city) {
    return Card(
      color: Colors.transparent,
      elevation: 8.0,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(30)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              child: Text(city.name),
              padding: EdgeInsets.all(10),
            ),
            Image.asset(city.image),
            Padding(
                padding: const EdgeInsets.all(10),
                child: AnimatedCrossFade(
                    firstChild: btns(city.name),
                    secondChild: InkWell(
                        onTap: () {
                          setState(() {
                            isDetail = !isDetail;
                          });
                        },
                        child: Text(city.description)),
                    crossFadeState: isDetail
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    duration: duration)),
          ],
        ),
      ),
    );
  }

  Row btns(String name) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FloatingActionButton(
          heroTag: name + 'Like',
          child: Icon(Icons.thumb_up),
          backgroundColor: Colors.greenAccent,
          onPressed: () {
            setState(() {
              setupRotation(-0.2);
              setupMove(-2);
              animationController.forward();
            });
          },
        ),
        FloatingActionButton(
          heroTag: name + 'Detail',
          child: Icon(Icons.search),
          backgroundColor: Colors.blue,
          onPressed: () {
            setState(() {
              isDetail = !isDetail;
            });
          },
        ),
        FloatingActionButton(
          heroTag: name + 'Dislike',
          child: Icon(Icons.thumb_down),
          backgroundColor: Colors.redAccent,
          onPressed: () {
            setState(() {
              setupRotation(0.2);
              setupMove(2);
              animationController.forward();
            });
          },
        ),
      ],
    );
  }

  setupRotation(double value) {
    turn = Tween<double>(begin: 0, end: value).animate(animation);
  }

  setupMove(double value) {
    move = Tween<Offset>(begin: Offset(0, 0), end: Offset(value, 0))
        .animate(animation)
          ..addListener(() {
            if (move.isCompleted) {
              animationController.reset();
              setState(() {
                GreekCity firstCity = cities[0];
                cities.removeAt(0);
                cities.add(firstCity);
              });
            }
          });
  }
}
