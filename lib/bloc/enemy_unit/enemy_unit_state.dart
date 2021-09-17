part of 'enemy_unit_bloc.dart';

@immutable
abstract class EnemyUnitState extends Equatable {
  const EnemyUnitState();
}

class EnemyUnitIdleState extends EnemyUnitState {
  @override
  List<Object> get props => [];
}

class EnemyUnitBattleState extends EnemyUnitState {
  @override
  List<Object> get props => [];
}

class EnemyUnitDoneState extends EnemyUnitState {
  @override
  List<Object> get props => [];
}
