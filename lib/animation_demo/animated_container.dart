import 'package:flutter/material.dart';
import 'package:flutter_animx/blocs/bloc_animated_container.dart';
import 'package:flutter_animx/blocs/bloc_provider.dart';
import 'package:flutter_animx/models/b_animated_container.dart';

class AnimatedContainerDemo extends StatelessWidget {
  FloatingActionButton colorButton(String name, Color color, bloc) {
    return FloatingActionButton(
      backgroundColor: color,
      heroTag: name,
      onPressed: () {
        bloc.updateColor(color: color);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<BlocAnimatedContainer>(context);

    return StreamBuilder<BAnimatedContainer>(
      stream: bloc.stream,
      builder: (ctx, snap) {
        if (snap == null || !snap.hasData || snap.hasError) {
          return Container();
        } else {
          var model = snap.data;
          return Column(
            children: <Widget>[
              SizedBox(height: 15.0),
              AnimatedContainer(
                duration: model.duration,
                height: model.heightValue,
                width: model.widthValue,
                decoration: BoxDecoration(
                  color: model.color,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        offset: (model.shadow) ? Offset(3, 0) : Offset(0, 0),
                        spreadRadius: (model.shadow) ? 2.5 : 0.0,
                        blurRadius: (model.shadow) ? 3.0 : 0),
                  ],
                  borderRadius:
                      BorderRadius.circular((model.radius) ? 25.0 : 0.0),
                ),
                curve: Curves.linear,
              ),
              SizedBox(height: 15.0),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        colorButton("Blue", Colors.blue, bloc),
                        colorButton("Red", Colors.red, bloc),
                        colorButton("Green", Colors.green, bloc),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text("Height : ${model.heightValue.round()}"),
                        Slider(
                          max: model.max,
                          min: model.min,
                          value: model.heightValue,
                          onChanged: (newValue) {
                            bloc.updateHeight(value: newValue);
                          },
                        ),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                    Column(
                      children: <Widget>[
                        Text("Width : ${model.widthValue.round()}"),
                        Slider(
                          max: model.max,
                          min: model.min,
                          value: model.widthValue,
                          onChanged: (newValue) {
                            bloc.updateWidth(value: newValue);
                          },
                        ),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Shadow : ${model.shadow}'),
                        Switch(
                            value: model.shadow,
                            onChanged: (newValue) {
                              bloc.isShadow(b: newValue);
                            })
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Radius : ${model.radius}'),
                        Switch(
                            value: model.radius,
                            onChanged: (newValue) {
                              bloc.isRadius(b: newValue);
                            })
                      ],
                    )
                  ],
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
