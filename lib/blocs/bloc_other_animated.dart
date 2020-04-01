import 'package:flutter_animx/blocs/bloc_base.dart';
import 'package:flutter_animx/models/b_other_animated.dart';
import 'package:rxdart/rxdart.dart';

class BlocOtherAnimated extends BlocBase {
  BOtherAnimated _bOtherAnimated = BOtherAnimated();

  BehaviorSubject<BOtherAnimated> _subject = BehaviorSubject<BOtherAnimated>();
  Stream<BOtherAnimated> get stream => _subject.stream;
  Sink<BOtherAnimated> get sink => _subject.sink;

  sync() {
    sink.add(_bOtherAnimated);
  }

  updateIsFirst() {
    _bOtherAnimated.isFirst = !_bOtherAnimated.isFirst;
    sync();
  }

  updateIsOpacity() {
    _bOtherAnimated.isOpacity = !_bOtherAnimated.isOpacity;
    sync();
  }

  updateIsBig() {
    _bOtherAnimated.isBig = !_bOtherAnimated.isBig;
    sync();
  }

  updateCross() {
    _bOtherAnimated.cross = !_bOtherAnimated.cross;
    sync();
  }

  updateIsConnected() {
    _bOtherAnimated.isConnected = !_bOtherAnimated.isConnected;
    sync();
  }

  BlocOtherAnimated() {
    sink.add(_bOtherAnimated);
  }

  @override
  void dispose() {
    print('Dispose of BlocOtherAnimated');
  }
}
