import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniature_tb_game/bloc/battle_system/battle_system_bloc.dart';
import 'package:miniature_tb_game/ui/widgets/unit/enemy_unit_widget.dart';
import 'package:miniature_tb_game/ui/widgets/unit/player_unit_widget.dart';

class DisplayWidget extends StatefulWidget {
  const DisplayWidget();

  @override
  _DisplayWidgetState createState() => _DisplayWidgetState();
}

class _DisplayWidgetState extends State<DisplayWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BattleSystemBloc, BattleSystemState>(
      builder: (context, state) {
        if (state is BattleWon) {
          return Expanded(
            child: Center(
              child: Text("Battle Won!"),
            ),
          );
        }
        if (state is BattleLost) {
          return Expanded(
            child: Center(
              child: Text("Battle Lost!"),
            ),
          );
        }
        return Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text("Battle System State: $state"),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    EnemyUnitWidget(unit: state.enemyUnit),
                    PlayerUnitWidget(unit: state.playerUnit),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
