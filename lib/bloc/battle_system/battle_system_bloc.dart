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
    yield BattlePhase(playerUnit: playerUnit, enemyUnit: enemyUnit);

    await Future.delayed(Duration(milliseconds: 15));

    attackEnemy();
    attackPlayer();

    // Check if a unit has reached zero or below zero
    if (playerUnit.currentHp <= 0 || enemyUnit.currentHp <= 0) {
      // Check which unit reached zero to determine battle result
      if (playerUnit.currentHp > enemyUnit.currentHp) {
        yield BattleWon();
      } else if (enemyUnit.currentHp > playerUnit.currentHp) {
        yield BattleLost();
      }
    } else {
      yield StrategyPhase(playerUnit: playerUnit, enemyUnit: enemyUnit);
    }
  }

  void attackEnemy() {
    //Set amount of damage to enemy
    enemyUnit.takeDamage(playerUnit.damageAmount);
  }

  void attackPlayer() {
    //Set amount of damage to player
    playerUnit.takeDamage(enemyUnit.damageAmount);
  }
}
