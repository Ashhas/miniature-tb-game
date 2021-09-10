import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniature_tb_game/bloc/battle_system/battle_system_bloc.dart';
import 'package:miniature_tb_game/ui/widgets/control_pad.dart';
import 'package:miniature_tb_game/ui/widgets/display_widget.dart';

class BattleScreen extends StatefulWidget {
  const BattleScreen() : super();

  @override
  _BattleScreenState createState() => _BattleScreenState();
}

class _BattleScreenState extends State<BattleScreen> {
  @override
  void initState() {
    BlocProvider.of<BattleSystemBloc>(context).add(StartBattle());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TB Game")),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          DisplayWidget(),
          Container(
            alignment: Alignment.bottomCenter,
            child: ControlPad(),
          ),
        ],
      ),
    );
  }
}
