import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:miniature_tb_game/bloc/battle_system/battle_system_bloc.dart';

part 'player_unit_event.dart';

part 'player_unit_state.dart';

class PlayerUnitBloc extends Bloc<PlayerUnitEvent, PlayerUnitState> {
  final BattleSystemBloc blocB;
  late StreamSubscription _battleBlocSubscription;

  PlayerUnitBloc({required this.blocB}) : super(PlayerUnitIdleState()) {
    _battleBlocSubscription = blocB.stream.listen((stateB) {
      if (stateB is StrategyPhase) {
        add(SetPlayerUnitStrategyPhase());
      }
      if (stateB is AttackEnemy) {
        add(SetPlayerUnitBattlePhase());
      }
      if (stateB is AttackPlayer) {
        add(SetPlayerUnitDonePhase());
      }
    });
  }

  @override
  Stream<PlayerUnitState> mapEventToState(PlayerUnitEvent event) async* {
    if (event is SetPlayerUnitStrategyPhase) {
      yield* _mapPlayerUnitStrategyState();
    } else if (event is SetPlayerUnitBattlePhase) {
      yield* _mapPlayerUnitBattleState();
    } else if (event is SetPlayerUnitDonePhase) {
      yield* _mapPlayerUnitDoneState();
    }
  }

  Stream<PlayerUnitState> _mapPlayerUnitStrategyState() async* {
    yield PlayerUnitIdleState();
  }

  Stream<PlayerUnitState> _mapPlayerUnitBattleState() async* {
    yield PlayerUnitBattleState();
  }

  Stream<PlayerUnitState> _mapPlayerUnitDoneState() async* {
    yield PlayerUnitDoneState();
  }

  @override
  Future<void> close() {
    _battleBlocSubscription.cancel();
    return super.close();
  }
}
