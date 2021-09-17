part of 'enemy_unit_bloc.dart';

@immutable
abstract class EnemyUnitEvent extends Equatable {
  const EnemyUnitEvent();
}

class SetEnemyUnitStrategyPhase extends EnemyUnitEvent {
  @override
  List<Object> get props => [];
}

class SetEnemyUnitBattlePhase extends EnemyUnitEvent {
  @override
  List<Object> get props => [];
}
