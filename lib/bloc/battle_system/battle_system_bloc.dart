import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:miniature_tb_game/data/model/player_unit.dart';

part 'battle_system_event.dart';

part 'battle_system_state.dart';

class BattleSystemBloc extends Bloc<BattleSystemEvent, BattleSystemState> {
  late PlayerUnit playerUnit;
  late PlayerUnit enemyUnit;

  BattleSystemBloc({required this.playerUnit, required this.enemyUnit})
      : super(BattleInitiated());

  @override
  Stream<BattleSystemState> mapEventToState(BattleSystemEvent event) async* {
    if (event is StartBattle) {
      yield* _mapStartBattleEventToState();
    } else if (event is EngageBattlePhase) {
      yield* _mapEngageBattlePhaseEventToState();
    }
  }

  Stream<BattleSystemState> _mapStartBattleEventToState() async* {
    yield StrategyPhase(playerUnit: playerUnit, enemyUnit: enemyUnit);
  }

  Stream<BattleSystemState> _mapEngageBattlePhaseEventToState() async* {
    yield AttackPhase();

    enemyUnit.currentHp -= 1;

    yield StrategyPhase(playerUnit: playerUnit, enemyUnit: enemyUnit);
  }
}
