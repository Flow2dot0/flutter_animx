import 'package:flutter/material.dart';
import 'package:flutter_animx/animation_demo/animated_builder.dart';
import 'package:flutter_animx/animation_demo/animated_container.dart';
import 'package:flutter_animx/animation_demo/animated_list_demo.dart';
import 'package:flutter_animx/animation_demo/animated_physical.dart';
import 'package:flutter_animx/animation_demo/animation_listener.dart';
import 'package:flutter_animx/animation_demo/graph.dart';
import 'package:flutter_animx/animation_demo/tinder_anim.dart';
import 'package:flutter_animx/blocs/bloc_animated_container.dart';
import 'package:flutter_animx/blocs/bloc_opacity.dart';
import 'package:flutter_animx/blocs/bloc_other_animated.dart';
import 'package:flutter_animx/blocs/bloc_provider.dart';
import 'package:flutter_animx/models/b_animated_container.dart';
import 'package:flutter_animx/models/datas.dart';
import 'package:flutter_animx/models/material_design.dart';
import 'package:flutter_animx/models/section.dart';
import 'package:flutter_animx/pages/hero_list.dart';
import 'package:flutter_animx/pages/menu_page.dart';
import 'package:flutter_animx/pages/other_animated_page.dart';
import 'package:flutter_animx/pages/transition_list.dart';
import 'package:flutter_animx/widgets/tile.dart';

class HomePage extends StatelessWidget {
  List<Section> _sections = [
    Section(
      name: 'Animated Container',
      icon: Icons.score,
      destination: AnimatedContainerDemo(),
    ),
    Section(
      name: 'Other Animated',
      icon: Icons.local_movies,
      destination: OtherAnimatedPage(),
    ),
    Section(
      name: 'Hero',
      icon: Icons.flash_on,
      destination: HeroList(),
    ),
    Section(
        name: 'Animated List',
        icon: Icons.list,
        destination: AnimatedListDemo()),
    Section(
      name: 'Transitions',
      icon: Icons.compare_arrows,
      destination: TransitionList(),
    ),
    Section(
        name: 'Animated Builder',
        icon: Icons.build,
        destination: AnimatedBuilderDemo()),
    Section(
        name: 'Physical Model',
        icon: Icons.menu,
        destination: AnimatedPhysicalDemo()),
    Section(name: 'Graphic', icon: Icons.show_chart, destination: Graph()),
    Section(
        name: 'Animation Listener',
        icon: Icons.hearing,
        destination: AnimationListenerDemo()),
    Section(name: 'Animated Menu', icon: Icons.menu, destination: MenuPage()),
    Section(
        name: 'Animation Tinder',
        icon: Icons.photo_library,
        destination: TinderAnimDemo())
  ];

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
        itemBuilder: (ctx, i) => Tile(section: _sections[i]),
        separatorBuilder: (ctx, i) => MyDivider(),
        itemCount: _sections.length,
      ),
    );
  }
}
