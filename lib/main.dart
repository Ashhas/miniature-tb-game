import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniature_tb_game/bloc/battle_system/battle_system_bloc.dart';
import 'package:miniature_tb_game/bloc/simple_bloc_observer.dart';
import 'package:miniature_tb_game/bloc/unit/unit_bloc.dart';
import 'package:miniature_tb_game/data/model/player_unit.dart';
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
    //Create Units
    PlayerUnit player = PlayerUnit(
        unitName: "player",
        unitLevel: 10,
        damageAmount: 1.5,
        maxHp: 10,
        currentHp: 10);

    PlayerUnit enemy = PlayerUnit(
        unitName: "enemy",
        unitLevel: 10,
        damageAmount: 1,
        maxHp: 10,
        currentHp: 10);

    //Setup Battle System
    BattleSystemBloc battleSystemBloc =
        BattleSystemBloc(playerUnit: player, enemyUnit: enemy);

    return MultiBlocProvider(
      providers: [
        BlocProvider<BattleSystemBloc>(
          create: (context) => battleSystemBloc,
        ),
        BlocProvider<UnitBloc>(
          create: (_) => UnitBloc(blocB: battleSystemBloc),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BattleScreen(),
      ),
    );
  }
}
