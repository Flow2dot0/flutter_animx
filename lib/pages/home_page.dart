import 'package:flutter/material.dart';
import 'package:flutter_animx/animation_demo/animated_container.dart';
import 'package:flutter_animx/blocs/bloc_animated_container.dart';
import 'package:flutter_animx/blocs/bloc_provider.dart';
import 'package:flutter_animx/models/b_animated_container.dart';
import 'package:flutter_animx/models/datas.dart';
import 'package:flutter_animx/models/material_design.dart';
import 'package:flutter_animx/models/section.dart';

class HomePage extends StatelessWidget {
  List<Section> _sections = [
    Section(
      name: 'Animated Container',
      icon: Icons.score,
      destination: BlocProvider<BlocAnimatedContainer>(
        bloc: BlocAnimatedContainer(
          bAnimatedContainer: BAnimatedContainer(
            duration: Duration(seconds: 2),
            min: 0,
            max: 300.0,
            heightValue: 150.0,
            widthValue: 150.0,
            color: Colors.blue,
            shadow: true,
            radius: true,
          ),
        ),
        child: AnimatedContainerDemo(),
      ),
    )
  ];

  ListTile tile(BuildContext context, Section section) {
    return ListTile(
      leading: Icon(section.icon),
      title: Text(section.name),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () => Datas().pusher(context, section.name, section.destination),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50.0),
          ),
          margin: EdgeInsets.all(5.0),
          child: Image.asset(Datas().flutter),
        ),
        title: Text("Flutter Animations"),
      ),
      body: ListView.separated(
        itemBuilder: (ctx, i) => tile(context, _sections[i]),
        separatorBuilder: (ctx, i) => MyDivider(),
        itemCount: _sections.length,
      ),
    );
  }
}
