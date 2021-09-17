import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniature_tb_game/bloc/battle_system/battle_system_bloc.dart';
import 'package:miniature_tb_game/bloc/enemy_unit/enemy_unit_bloc.dart';
import 'package:miniature_tb_game/bloc/player_unit/player_unit_bloc.dart';
import 'package:miniature_tb_game/bloc/simple_bloc_observer.dart';
import 'package:miniature_tb_game/data/model/unit_model.dart';
import 'package:miniature_tb_game/ui/battle_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  //Initialize Bloc Observer
  Bloc.observer = SimpleBlocObserver();

  //Set rotation then launch appp
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Create Units
    UnitModel player = UnitModel(
        unitName: "player",
        unitLevel: 10,
        damageAmount: 1.5,
        maxHp: 10,
        currentHp: 10);

    UnitModel enemy = UnitModel(
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
        BlocProvider<PlayerUnitBloc>(
          create: (_) => PlayerUnitBloc(blocB: battleSystemBloc),
        ),
        BlocProvider<EnemyUnitBloc>(
          create: (_) => EnemyUnitBloc(blocB: battleSystemBloc),
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
