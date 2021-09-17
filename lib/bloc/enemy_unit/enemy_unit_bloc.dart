import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:miniature_tb_game/bloc/battle_system/battle_system_bloc.dart';

part 'enemy_unit_event.dart';

part 'enemy_unit_state.dart';

class EnemyUnitBloc extends Bloc<EnemyUnitEvent, EnemyUnitState> {
  final BattleSystemBloc blocB;
  late StreamSubscription _battleBlocSubscription;

  EnemyUnitBloc({required this.blocB}) : super(EnemyUnitIdleState()) {
    _battleBlocSubscription = blocB.stream.listen((stateB) {
      if (stateB is StrategyPhase) {
        add(SetEnemyUnitStrategyPhase());
      }
      if (stateB is AttackPlayer) {
        add(SetEnemyUnitBattlePhase());
      }
    });
  }

  @override
  Stream<EnemyUnitState> mapEventToState(EnemyUnitEvent event) async* {
    if (event is SetEnemyUnitStrategyPhase) {
      yield* _mapEnemyUnitStrategyState();
    } else if (event is SetEnemyUnitBattlePhase) {
      yield* _mapEnemyUnitBattleState();
    }
  }

  Stream<EnemyUnitState> _mapEnemyUnitStrategyState() async* {
    yield EnemyUnitIdleState();
  }

  Stream<EnemyUnitState> _mapEnemyUnitBattleState() async* {
    yield EnemyUnitBattleState();
  }

  @override
  Future<void> close() {
    _battleBlocSubscription.cancel();
    return super.close();
  }
}
