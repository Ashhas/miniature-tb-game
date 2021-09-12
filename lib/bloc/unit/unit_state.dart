part of 'unit_bloc.dart';

@immutable
abstract class UnitState extends Equatable {
  const UnitState();
}

class UnitIdleState extends UnitState {
  @override
  List<Object> get props => [];
}

class UnitBattleState extends UnitState {
  @override
  List<Object> get props => [];
}
