import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniature_tb_game/bloc/battle_system/battle_system_bloc.dart';
import 'package:miniature_tb_game/bloc/simple_bloc_observer.dart';
import 'package:miniature_tb_game/ui/battle_screen.dart';

void main() {
  //Initialize Bloc Observer
  Bloc.observer = SimpleBlocObserver();

  //Start App
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BattleSystemBloc>(
          create: (_) => BattleSystemBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BattleScreen(),
      ),
    );
  }
}
