import 'package:flutter/material.dart';
import 'package:flutter_animx/blocs/bloc_other_animated.dart';
import 'package:flutter_animx/blocs/bloc_provider.dart';
import 'package:flutter_animx/models/b_other_animated.dart';
import 'package:flutter_animx/models/datas.dart';

class AnimatedCrossFadeDemo extends StatelessWidget {
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
          return Center(
            child: InkWell(
              onTap: () {
                bloc.updateCross();
              },
              child: AnimatedCrossFade(
                firstChild: Image.asset(Datas().flutter),
                secondChild: Text(
                  'back to image',
                  style: TextStyle(fontSize: 30.0),
                ),
                crossFadeState: model.cross
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: Duration(seconds: 1),
              ),
            ),
          );
        }
      },
    );
  }
}
