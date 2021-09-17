import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniature_tb_game/bloc/enemy_unit/enemy_unit_bloc.dart';
import 'package:miniature_tb_game/bloc/player_unit/player_unit_bloc.dart';
import 'package:miniature_tb_game/data/model/unit_model.dart';

class EnemyUnitWidget extends StatefulWidget {
  final UnitModel unit;

  const EnemyUnitWidget({
    required this.unit,
  });

  @override
  _EnemyUnitWidgetState createState() => _EnemyUnitWidgetState();
}

class _EnemyUnitWidgetState extends State<EnemyUnitWidget> {
  Color _widgetColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: BlocListener<EnemyUnitBloc, EnemyUnitState>(
        listener: (context, state) {
          if (state is EnemyUnitIdleState) {
            _widgetColor = Colors.red;
          }
          if (state is EnemyUnitBattleState) {
            _widgetColor = Colors.green;
          }
        },
        child: Column(
          children: [
            Text("Name: " + widget.unit.unitName),
            Container(
              width: 20,
              height: 20,
              color: _widgetColor,
            ),
            Text("HP: " +
                widget.unit.currentHp.toString() +
                "/" +
                widget.unit.maxHp.toString()),
          ],
        ),
      ),
    );
  }
}
