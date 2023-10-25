import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../event.dart';
import '../state.dart';
import 'controller_repo.dart';

class ControllerBloc extends Bloc<Event, AppState>{

  final ControllerRepo _repo;

  ControllerBloc(this._repo): super(AppState(value: _repo.dataStream.hashCode)) {
    on<UserPressedButton>(_userPressedButtonHandler);
    on<RepositoryStreamUpdated>(_repositoryStreamUpdatedHandler);

    _repo.dataStream.listen(
      _repositoryStreamHandler,
    );
    print('Bloc registered repository stream listener');
  }

  void _repositoryStreamHandler(int value) {
    print('Bloc listened to repository stream update');
    add(RepositoryStreamUpdated(value: value));
  }

  FutureOr<void> _userPressedButtonHandler(UserPressedButton event, Emitter<AppState> emit) async {
    print('Bloc listened to button press');
    await _repo.add1(state.value + 1);
  }

  FutureOr<void> _repositoryStreamUpdatedHandler(RepositoryStreamUpdated event, Emitter<AppState> emit) {
    print('Bloc updated state: ${event.value}');
    emit(AppState(value: event.value));
  }
}