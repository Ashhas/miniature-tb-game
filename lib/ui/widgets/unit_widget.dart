import 'package:flutter/material.dart';
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
        Container(
          width: 20,
          height: 20,
          color: Colors.red,
        ),
        Text("HP: " +
            widget.unit.currentHp.toString() +
            "/" +
            widget.unit.maxHp.toString()),
      ],
    );
  }
}
