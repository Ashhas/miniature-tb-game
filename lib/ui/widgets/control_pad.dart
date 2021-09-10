import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniature_tb_game/bloc/battle_system/battle_system_bloc.dart';

class ControlPad extends StatefulWidget {
  const ControlPad();

  @override
  _ControlPadState createState() => _ControlPadState();
}

class _ControlPadState extends State<ControlPad> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 1,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: Text("Attack"),
              onPressed: () {
                BlocProvider.of<BattleSystemBloc>(context)
                    .add(EngageBattlePhase());
              },
            ),
            ElevatedButton(
              child: Text("Heal"),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
