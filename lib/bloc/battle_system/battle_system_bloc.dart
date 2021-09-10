import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'battle_system_event.dart';

part 'battle_system_state.dart';

class BattleSystemBloc extends Bloc<BattleSystemEvent, BattleSystemState> {
  BattleSystemBloc() : super(BattleInitiated());

  @override
  Stream<BattleSystemState> mapEventToState(BattleSystemEvent event) async* {
    if (event is StartBattle) {
      yield* _mapStartBattleEventToState();
    } else if (event is EngageBattlePhase) {
      yield* _mapEngageBattlePhaseEventToState();
    }
  }

  Stream<BattleSystemState> _mapStartBattleEventToState() async* {
    await Future.delayed(Duration(seconds: 1));
  }

  Stream<BattleSystemState> _mapEngageBattlePhaseEventToState() async* {
    await Future.delayed(Duration(seconds: 1));
  }
}
