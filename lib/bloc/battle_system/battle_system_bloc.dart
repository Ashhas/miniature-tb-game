import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:miniature_tb_game/data/model/unit_model.dart';

part 'battle_system_event.dart';

part 'battle_system_state.dart';

class BattleSystemBloc extends Bloc<BattleSystemEvent, BattleSystemState> {
  late UnitModel playerUnit;
  late UnitModel enemyUnit;

  BattleSystemBloc({required this.playerUnit, required this.enemyUnit})
      : super(BattleInitiated(playerUnit: playerUnit, enemyUnit: enemyUnit));

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
    // Set Battle System in BattlePhase to handle the attacks
    yield BattlePhase(playerUnit: playerUnit, enemyUnit: enemyUnit);

    // Attack Methods
    yield AttackEnemy(playerUnit: playerUnit, enemyUnit: enemyUnit);
    await attackEnemy();
    yield AttackPlayer(playerUnit: playerUnit, enemyUnit: enemyUnit);
    await attackPlayer();

    // Check if a unit has reached zero or below zero
    if (playerUnit.currentHp <= 0 || enemyUnit.currentHp <= 0) {
      // Check which unit reached zero to determine battle result
      if (playerUnit.currentHp > enemyUnit.currentHp) {
        yield BattleWon(playerUnit: playerUnit, enemyUnit: enemyUnit);
      } else if (enemyUnit.currentHp > playerUnit.currentHp) {
        yield BattleLost(playerUnit: playerUnit, enemyUnit: enemyUnit);
      }
    } else {
      yield StrategyPhase(playerUnit: playerUnit, enemyUnit: enemyUnit);
    }
  }

  Future attackEnemy() async {
    // Set Timer for turn
    await Future.delayed(Duration(seconds: 3));

    // Set amount of damage to enemy
    enemyUnit.takeDamage(playerUnit.damageAmount);
  }

  Future attackPlayer() async {
    // Set Timer for turn
    await Future.delayed(Duration(seconds: 3));

    // Set amount of damage to player
    playerUnit.takeDamage(enemyUnit.damageAmount);
  }
}
