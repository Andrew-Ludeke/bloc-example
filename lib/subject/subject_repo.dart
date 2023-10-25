import 'dart:async';

import 'package:rxdart/rxdart.dart';

class SubjectRepo {
  final BehaviorSubject<int> _data = BehaviorSubject<int>()..add(0);
  int get dataValue => _data.value;
  Stream<int> get dataStream => _data.stream.asBroadcastStream();

  void updateData(int newValue) {
    print('Repository value updated');
    _data.sink.add(newValue);
  }

  Future<void> add1() async {
    int oldValue =  dataValue;
    int newValue = oldValue + 1;

    updateData(newValue);
  }
}