import 'package:flutter/material.dart';
import 'package:flutter_animx/blocs/bloc_other_animated.dart';
import 'package:flutter_animx/blocs/bloc_provider.dart';
import 'package:flutter_animx/models/b_other_animated.dart';
import 'package:flutter_animx/models/datas.dart';

class AnimatedOpacityDemo extends StatelessWidget {
  List<Widget> children(model, bloc) {
    List<Widget> l = [];
    l.add(Text('Opacity'));
    l.add(
      AnimatedOpacity(
        opacity: model.isOpacity ? 0 : 1,
        duration: Duration(seconds: 3),
        child: Image.asset(Datas().flutter),
      ),
    );
    l.add(
      FlatButton(
        onPressed: () {
          bloc.updateIsOpacity();
        },
        child: Text(model.isOpacity ? "Show" : "Hide"),
      ),
    );
    return l;
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<BlocOtherAnimated>(context);

    return StreamBuilder<BOtherAnimated>(
      stream: bloc.stream,
      builder: (ctx, snap) {
        if (snap == null || snap.hasError || !snap.hasData) {
          return Container();
        } else {
          var model = snap.data;
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: children(model, bloc),
          );
        }
      },
    );
  }
}
