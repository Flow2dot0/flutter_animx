import 'package:flutter/material.dart';
import 'package:flutter_animx/animation_demo/hero_widget.dart';
import 'package:flutter_animx/models/greek_city.dart';

class HeroDetail extends StatelessWidget {
  final HeroWidget heroWidget;
  final GreekCity city;

  const HeroDetail({Key key, this.heroWidget, this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[heroWidget, Text(city.description)],
    );
  }
}
