import 'package:flutter/material.dart';
import 'package:flutter_animx/animation_demo/animated_cross_fade.dart';
import 'package:flutter_animx/animation_demo/animated_opacity.dart';
import 'package:flutter_animx/animation_demo/animated_position.dart';
import 'package:flutter_animx/animation_demo/animated_size.dart';
import 'package:flutter_animx/animation_demo/animated_text.dart';
import 'package:flutter_animx/animation_demo/fade_in.dart';
import 'package:flutter_animx/blocs/bloc_other_animated.dart';
import 'package:flutter_animx/blocs/bloc_provider.dart';
import 'package:flutter_animx/models/material_design.dart';
import 'package:flutter_animx/models/section.dart';
import 'package:flutter_animx/widgets/tile.dart';

class OtherAnimatedPage extends StatelessWidget {
  List<Section> sections = [
    Section(
      name: 'Fade In',
      icon: Icons.menu,
      destination: FadeInDemo(),
    ),
    Section(
      name: 'Opacity',
      icon: Icons.menu,
      destination: BlocProvider<BlocOtherAnimated>(
        bloc: BlocOtherAnimated(),
        child: AnimatedOpacityDemo(),
      ),
    ),
    Section(
      name: 'Cross Fade',
      icon: Icons.menu,
      destination: BlocProvider<BlocOtherAnimated>(
        bloc: BlocOtherAnimated(),
        child: AnimatedCrossFadeDemo(),
      ),
    ),
    Section(
      name: 'TextStyle',
      icon: Icons.menu,
      destination: BlocProvider<BlocOtherAnimated>(
        bloc: BlocOtherAnimated(),
        child: AnimatedTextStyleDemo(),
      ),
    ),
    Section(
      name: 'Size',
      icon: Icons.menu,
      destination: BlocProvider<BlocOtherAnimated>(
        bloc: BlocOtherAnimated(),
        child: AnimatedSizeDemo(),
      ),
    ),
    Section(
      name: 'Positionning',
      icon: Icons.menu,
      destination: BlocProvider<BlocOtherAnimated>(
        bloc: BlocOtherAnimated(),
        child: AnimatedPositionningDemo(),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (ctx, i) => Tile(
        section: sections[i],
      ),
      separatorBuilder: (ctx, i) => MyDivider(),
      itemCount: sections.length,
    );
  }
}
