import 'package:flutter/material.dart';
import 'package:flutter_animx/blocs/bloc_base.dart';
import 'package:flutter_animx/models/b_animated_container.dart';
import 'package:rxdart/rxdart.dart';

class BlocAnimatedContainer extends BlocBase {
  BAnimatedContainer model;

  BehaviorSubject<BAnimatedContainer> _subject =
      BehaviorSubject<BAnimatedContainer>();
  Stream<BAnimatedContainer> get stream => _subject.stream;
  Sink<BAnimatedContainer> get sink => _subject.sink;

  sync() {
    sink.add(model);
  }

  updateHeight({double value}) {
    model.heightValue = value;
    sync();
  }

  updateWidth({double value}) {
    model.widthValue = value;
    sync();
  }

  updateColor({Color color}) {
    model.color = color;
    sync();
  }

  isShadow({bool b}) {
    model.shadow = !model.shadow;
    sync();
  }

  isRadius({bool b}) {
    model.radius = !model.radius;
    sync();
  }

  BlocAnimatedContainer() {
    model = BAnimatedContainer(
      duration: Duration(milliseconds: 500),
      min: 0,
      max: 300.0,
      heightValue: 150.0,
      widthValue: 150.0,
      color: Colors.blue,
      shadow: true,
      radius: true,
    );
    sync();
  }

  @override
  void dispose() {
    print('Dispose of Bloc Animated Container');
  }
}
