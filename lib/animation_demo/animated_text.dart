import 'package:flutter/material.dart';
import 'package:flutter_animx/blocs/bloc_other_animated.dart';
import 'package:flutter_animx/blocs/bloc_provider.dart';
import 'package:flutter_animx/models/b_other_animated.dart';

class AnimatedTextStyleDemo extends StatelessWidget {
  TextStyle firstStyle() {
    return TextStyle(
      color: Colors.orange,
      fontSize: 40.0,
//      fontWeight: FontWeight.w100,
//      fontStyle: FontStyle.italic,
    );
  }

  TextStyle secondStyle() {
    return TextStyle(
      color: Colors.teal,
      fontSize: 20.0,
//      fontWeight: FontWeight.w700,
//      fontStyle: FontStyle.normal,
    );
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
          return Center(
            child: InkWell(
              onTap: () {
                bloc.updateIsFirst();
              },
              child: AnimatedDefaultTextStyle(
                child: Text('tap to change'),
                style: model.isFirst ? firstStyle() : secondStyle(),
                duration: Duration(seconds: 1),
              ),
            ),
          );
        }
      },
    );
  }
}
