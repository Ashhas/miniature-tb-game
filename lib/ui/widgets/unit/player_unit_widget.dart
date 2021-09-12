import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniature_tb_game/bloc/battle_system/battle_system_bloc.dart';
import 'package:miniature_tb_game/ui/widgets/unit/unit_widget.dart';

class PlayerUnitWidget extends StatefulWidget {
  const PlayerUnitWidget();

  @override
  _PlayerUnitWidgetState createState() => _PlayerUnitWidgetState();
}

class _PlayerUnitWidgetState extends State<PlayerUnitWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: BlocBuilder<BattleSystemBloc, BattleSystemState>(
        builder: (context, state) {
          if (state is StrategyPhase) {
            return UnitWidget(unit: state.playerUnit);
          } else if (state is BattlePhase) {
            return UnitWidget(unit: state.playerUnit);
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
