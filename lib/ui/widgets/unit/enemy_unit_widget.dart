import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniature_tb_game/bloc/battle_system/battle_system_bloc.dart';
import 'package:miniature_tb_game/ui/widgets/unit/unit_widget.dart';

class EnemyUnitWidget extends StatefulWidget {
  const EnemyUnitWidget();

  @override
  _EnemyUnitWidgetState createState() => _EnemyUnitWidgetState();
}

class _EnemyUnitWidgetState extends State<EnemyUnitWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: BlocBuilder<BattleSystemBloc, BattleSystemState>(
        builder: (context, state) {
          if (state is StrategyPhase) {
            return UnitWidget(unit: state.enemyUnit);
          } else if (state is BattlePhase) {
            return UnitWidget(unit: state.enemyUnit);
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
