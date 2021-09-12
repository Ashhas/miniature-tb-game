part of 'unit_bloc.dart';

@immutable
abstract class UnitEvent extends Equatable {
  const UnitEvent();
}

class SetUnitStrategyPhase extends UnitEvent {
  @override
  List<Object> get props => [];
}

class SetUnitBattlePhase extends UnitEvent {
  @override
  List<Object> get props => [];
}
