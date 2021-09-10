import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniature_tb_game/bloc/battle_system/battle_system_bloc.dart';

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
    return Container();
  }
}
