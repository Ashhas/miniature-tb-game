import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniature_tb_game/bloc/unit/unit_bloc.dart';
import 'package:miniature_tb_game/data/model/player_unit.dart';

class UnitWidget extends StatefulWidget {
  final PlayerUnit unit;

  const UnitWidget({
    required this.unit,
  });

  @override
  _UnitWidgetState createState() => _UnitWidgetState();
}

class _UnitWidgetState extends State<UnitWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Name: " + widget.unit.unitName),
        BlocBuilder<UnitBloc, UnitState>(
          builder: (context, state) {
            if (state is UnitIdleState) {
              return Container(
                width: 20,
                height: 20,
                color: Colors.red,
              );
            }
            if (state is UnitBattleState) {
              return Container(
                width: 20,
                height: 20,
                color: Colors.yellow,
              );
            }
            return Container();
          },
        ),
        Text("HP: " +
            widget.unit.currentHp.toString() +
            "/" +
            widget.unit.maxHp.toString()),
      ],
    );
  }
}
