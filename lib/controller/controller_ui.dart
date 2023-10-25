import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'controller_bloc.dart';
import '../state.dart';

class ControllerPage extends StatelessWidget {
  const ControllerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<ControllerBloc, AppState>(
        builder: (context, state) {
          print('Text widget refresh');
          return Text(
            '${state.value}',
            style: const TextStyle(fontSize: 36),
          );
        },
      ),
    );
  }
}
