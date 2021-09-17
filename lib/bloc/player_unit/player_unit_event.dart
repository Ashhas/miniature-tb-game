part of 'player_unit_bloc.dart';

@immutable
abstract class PlayerUnitEvent extends Equatable {
  const PlayerUnitEvent();
}

class SetPlayerUnitStrategyPhase extends PlayerUnitEvent {
  @override
  List<Object> get props => [];
}

class SetPlayerUnitBattlePhase extends PlayerUnitEvent {
  @override
  List<Object> get props => [];
}

class SetPlayerUnitDonePhase extends PlayerUnitEvent {
  @override
  List<Object> get props => [];
}
