import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animx/blocs/bloc_other_animated.dart';
import 'package:flutter_animx/blocs/bloc_provider.dart';
import 'package:flutter_animx/models/b_other_animated.dart';

class AnimatedSizeDemo extends StatelessWidget {
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
                bloc.updateIsBig();
              },
              child: AnimatedSize(
                vsync: model.myTickerProvider,
                duration: Duration(seconds: 1),
                child: Container(
                  height: model.isBig ? 300 : 150,
                  width: model.isBig ? 300 : 150,
                  color: Colors.lightBlueAccent,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

class MyTickerProvider extends TickerProvider {
  @override
  Ticker createTicker(onTick) =>
      Ticker(onTick, debugLabel: kDebugMode ? 'created by $this' : null);
}
