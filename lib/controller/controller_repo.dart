import 'dart:async';

class ControllerRepo {
  final StreamController<int> _data = StreamController<int>()..add(0);
  Stream<int> get dataStream => _data.stream.asBroadcastStream();

  void updateData(int newValue) {
    print('Repository value updated');
    _data.sink.add(newValue);
  }

  Future<void> add1(int newValue) async {
    updateData(newValue);
  }
}
