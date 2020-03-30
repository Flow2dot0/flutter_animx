import 'package:flutter/material.dart';
import 'package:flutter_animx/blocs/bloc_other_animated.dart';
import 'package:flutter_animx/blocs/bloc_provider.dart';
import 'package:flutter_animx/models/b_other_animated.dart';
import 'package:flutter_animx/models/datas.dart';

class AnimatedPositionningDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    num max = size.width * 0.8;
    double centerTop = max / 2 - 20;
    double centerBottom = max / 2 - 20;

    final bloc = BlocProvider.of<BlocOtherAnimated>(context);

    return StreamBuilder<BOtherAnimated>(
      stream: bloc.stream,
      builder: (ctx, snap) {
        if (snap == null || snap.hasError || !snap.hasData) {
          return Container();
        } else {
          var model = snap.data;
          return Center(
            child: Container(
              height: max,
              width: max,
              child: Card(
                elevation: 8,
                child: InkWell(
                  onTap: () {
                    bloc.updateIsConnected();
                  },
                  child: Stack(
                    children: <Widget>[
                      AnimatedPositioned(
                        duration: model.duration,
                        child: TextField(
                          decoration: InputDecoration(hintText: 'Enter mail'),
                        ),
                        left: 10,
                        right: 10,
                        bottom: centerBottom,
                        top: centerTop,
                      ),
                      AnimatedPositioned(
                        duration: model.duration,
                        child: TextField(
                          decoration:
                              InputDecoration(hintText: 'Enter password'),
                        ),
                        left: 10,
                        right: 10,
                        bottom: model.isConnected ? centerBottom : 10,
                        top: model.isConnected ? centerTop : max - 40,
                      ),
                      AnimatedPositioned(
                        duration: model.duration,
                        top: model.isConnected ? 0 : 10.0,
                        bottom: model.isConnected ? 0 : max - 100,
                        left: model.isConnected ? 0 : 10,
                        right: model.isConnected ? 0 : max - 100,
                        child: AnimatedContainer(
                          duration: model.duration,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(
                                  model.isConnected ? 0 : 50)),
                          child: Container(
                            child: Image.asset(
                              Datas().flutter,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
