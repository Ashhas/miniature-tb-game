part of 'battle_system_bloc.dart';

@immutable
abstract class BattleSystemEvent extends Equatable {
  const BattleSystemEvent();
}

class StartBattle extends BattleSystemEvent {
  @override
  List<Object> get props => [];
}

class EngageBattlePhase extends BattleSystemEvent {
  @override
  List<Object> get props => [];
}
