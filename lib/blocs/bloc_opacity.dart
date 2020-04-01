import 'package:flutter_animx/blocs/bloc_base.dart';
import 'package:flutter_animx/models/b_other_animated.dart';
import 'package:rxdart/rxdart.dart';

class BlocOpacity extends BlocBase {
  final BOtherAnimated _bOtherAnimated = BOtherAnimated();

  BehaviorSubject<BOtherAnimated> _subject = BehaviorSubject<BOtherAnimated>();
  Stream<BOtherAnimated> get stream => _subject.stream;
  Sink<BOtherAnimated> get sink => _subject.sink;

  sync() {
    sink.add(_bOtherAnimated);
  }

  updateIsOpacity() {
    _bOtherAnimated.isOpacity = !_bOtherAnimated.isOpacity;
    sync();
  }

  BlocOpacity() {
    sync();
  }

  @override
  void dispose() {
    _subject.close();
  }
}
