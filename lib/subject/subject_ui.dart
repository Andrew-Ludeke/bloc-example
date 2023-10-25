import 'package:bloctest/subject/subject_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state.dart';

class SubjectPage extends StatelessWidget {
  const SubjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<SubjectBloc, AppState>(
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
