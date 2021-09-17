part of 'battle_system_bloc.dart';

@immutable
abstract class BattleSystemState extends Equatable {
  late final UnitModel playerUnit;
  late final UnitModel enemyUnit;

  BattleSystemState(this.playerUnit, this.enemyUnit);
}

class BattleInitiated extends BattleSystemState {

  BattleInitiated({required UnitModel playerUnit, required UnitModel enemyUnit}) : super(playerUnit, enemyUnit);

  @override
  List<Object> get props => [];
}

class StrategyPhase extends BattleSystemState {

  StrategyPhase({required UnitModel playerUnit, required UnitModel enemyUnit}) : super(playerUnit, enemyUnit);

  @override
  List<Object> get props => [];
}

class BattlePhase extends BattleSystemState {

  BattlePhase({required UnitModel playerUnit, required UnitModel enemyUnit}) : super(playerUnit, enemyUnit);


  @override
  List<Object> get props => [];
}

class AttackPlayer extends BattleSystemState {

  AttackPlayer({required UnitModel playerUnit, required UnitModel enemyUnit}) : super(playerUnit, enemyUnit);


  @override
  List<Object> get props => [];
}

class AttackEnemy extends BattleSystemState {

  AttackEnemy({required UnitModel playerUnit, required UnitModel enemyUnit}) : super(playerUnit, enemyUnit);


  @override
  List<Object> get props => [];
}

class BattleWon extends BattleSystemState {

  BattleWon({required UnitModel playerUnit, required UnitModel enemyUnit}) : super(playerUnit, enemyUnit);

  @override
  List<Object> get props => [];
}

class BattleLost extends BattleSystemState {

  BattleLost({required UnitModel playerUnit, required UnitModel enemyUnit}) : super(playerUnit, enemyUnit);

  @override
  List<Object> get props => [];
}
