import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniature_tb_game/bloc/enemy_unit/enemy_unit_bloc.dart';
import 'package:miniature_tb_game/bloc/player_unit/player_unit_bloc.dart';
import 'package:miniature_tb_game/data/model/unit_model.dart';

class PlayerUnitWidget extends StatefulWidget {
  final UnitModel unit;

  const PlayerUnitWidget({
    required this.unit,
  });

  @override
  _PlayerUnitWidgetState createState() => _PlayerUnitWidgetState();
}

class _PlayerUnitWidgetState extends State<PlayerUnitWidget> {
  Color _widgetColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: BlocListener<PlayerUnitBloc, PlayerUnitState>(
        listener: (context, state) {
          if (state is PlayerUnitIdleState) {
            _widgetColor = Colors.red;
          }
          if (state is PlayerUnitBattleState) {
            _widgetColor = Colors.green;
          }
          if (state is PlayerUnitDoneState) {
            _widgetColor = Colors.red;
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
