part of 'battle_system_bloc.dart';

@immutable
abstract class BattleSystemState extends Equatable {
  const BattleSystemState();
}

class BattleInitiated extends BattleSystemState {
  @override
  List<Object> get props => [];
}

class StrategyPhase extends BattleSystemState {
  @override
  List<Object> get props => [];
}

class AttackPhase extends BattleSystemState {
  @override
  List<Object> get props => [];
}

class BattleWon extends BattleSystemState {
  @override
  List<Object> get props => [];
}

class BattleLost extends BattleSystemState {
  @override
  List<Object> get props => [];
}
