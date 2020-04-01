import 'package:flutter/material.dart';
import 'package:flutter_animx/animation_demo/hero_widget.dart';
import 'package:flutter_animx/models/datas.dart';
import 'package:flutter_animx/models/greek_city.dart';
import 'package:flutter_animx/models/material_design.dart';
import 'package:flutter_animx/pages/hero_detail.dart';

class HeroList extends StatelessWidget {
  List<GreekCity> cities = Datas().cities;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, i) {
        GreekCity city = cities[i];
        HeroWidget heroWidget = HeroWidget(url: city.image);
        return InkWell(
          onTap: () {
            Datas().pusher(
                context,
                city.name,
                HeroDetail(
                  city: city,
                  heroWidget: heroWidget,
                ));
          },
          child: Container(
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5),
                    height: 100.0,
                    width: 125,
                    child: heroWidget,
                  ),
                  Text(city.name),
                ],
              ),
            ),
          ),
        );
      },
      itemCount: cities.length,
    );
  }
}
