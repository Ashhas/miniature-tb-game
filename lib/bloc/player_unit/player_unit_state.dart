part of 'player_unit_bloc.dart';

@immutable
abstract class PlayerUnitState extends Equatable {
  const PlayerUnitState();
}

class PlayerUnitIdleState extends PlayerUnitState {
  @override
  List<Object> get props => [];
}

class PlayerUnitBattleState extends PlayerUnitState {
  @override
  List<Object> get props => [];
}

class PlayerUnitDoneState extends PlayerUnitState {
  @override
  List<Object> get props => [];
}
