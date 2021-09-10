import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniature_tb_game/bloc/battle_system/battle_system_bloc.dart';
import 'package:miniature_tb_game/ui/widgets/unit_widget.dart';

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
        if (state is StrategyPhase) {
          return Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  child: UnitWidget(playerUnit: state.enemyUnit),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: UnitWidget(playerUnit: state.playerUnit),
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
