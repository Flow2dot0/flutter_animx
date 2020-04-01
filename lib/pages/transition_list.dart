import 'package:flutter/material.dart';
import 'package:flutter_animx/animation_demo/animation_controller.dart';
import 'package:flutter_animx/models/material_design.dart';
import 'package:flutter_animx/models/section.dart';
import 'package:flutter_animx/models/transition_type.dart';
import 'package:flutter_animx/widgets/tile.dart';

class TransitionList extends StatelessWidget {
  final List<Section> sections = [
    Section(
      name: 'DecoratedBox',
      icon: Icons.compare_arrows,
      destination: AnimationControllerDemo(
        type: TransitionType.decoratedBox,
      ),
    ),
    Section(
      name: 'Fade',
      icon: Icons.compare_arrows,
      destination: AnimationControllerDemo(
        type: TransitionType.fade,
      ),
    ),
    Section(
      name: 'Position',
      icon: Icons.compare_arrows,
      destination: AnimationControllerDemo(
        type: TransitionType.position,
      ),
    ),
    Section(
      name: 'Rotation',
      icon: Icons.compare_arrows,
      destination: AnimationControllerDemo(
        type: TransitionType.rotation,
      ),
    ),
    Section(
      name: 'Scale',
      icon: Icons.compare_arrows,
      destination: AnimationControllerDemo(
        type: TransitionType.scale,
      ),
    ),
    Section(
      name: 'Size',
      icon: Icons.compare_arrows,
      destination: AnimationControllerDemo(
        type: TransitionType.size,
      ),
    ),
    Section(
      name: 'Slide',
      icon: Icons.compare_arrows,
      destination: AnimationControllerDemo(
        type: TransitionType.slide,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_, i) => Tile(
        section: sections[i],
      ),
      separatorBuilder: (_, __) => MyDivider(),
      itemCount: sections.length,
    );
  }
}
