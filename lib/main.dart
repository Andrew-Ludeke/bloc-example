import 'package:bloctest/subject/subject_bloc.dart';
import 'package:bloctest/subject/subject_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'controller/controller_bloc.dart';
import 'controller/controller_repo.dart';
import 'controller/controller_ui.dart';
import 'event.dart';

void main() {
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ControllerRepo>(create: (context) => ControllerRepo()),
        RepositoryProvider<SubjectRepo>(create: (context) => SubjectRepo()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ControllerBloc(context.read<ControllerRepo>())),
          BlocProvider(create: (context) => SubjectBloc(context.read<SubjectRepo>())),
        ],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ButtonStyle _buttonStyle =  ElevatedButton.styleFrom(
    shape: const CircleBorder(),
    fixedSize: const Size(50, 50),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        body: const ControllerPage(),

        floatingActionButton: ElevatedButton(
          style: _buttonStyle,
          child: const Icon(Icons.add),
          onPressed: () => _userPressedButton(context),
        ),
      ),
    );
  }

  void _userPressedButton(BuildContext context) {
    print('\n================================================================================');
    print('User pressed button');
    context.read<ControllerBloc>().add(UserPressedButton());
  }
}