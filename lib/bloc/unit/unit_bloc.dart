import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:miniature_tb_game/bloc/battle_system/battle_system_bloc.dart';

part 'unit_event.dart';

part 'unit_state.dart';

class UnitBloc extends Bloc<UnitEvent, UnitState> {
  final BattleSystemBloc blocB;
  late StreamSubscription _battleBlocSubscription;

  UnitBloc({required this.blocB}) : super(UnitIdleState()) {
    _battleBlocSubscription = blocB.stream.listen((stateB) {
      if (stateB is StrategyPhase) {
        add(SetUnitStrategyPhase());
      }
      if (stateB is BattlePhase) {
        add(SetUnitBattlePhase());
      }
    });
  }

  @override
  Stream<UnitState> mapEventToState(UnitEvent event) async* {
    if (event is SetUnitStrategyPhase) {
      yield* _mapUnitStrategyState();
    } else if (event is SetUnitBattlePhase) {
      yield* _mapUnitBattleState();
    }
  }

  Stream<UnitState> _mapUnitStrategyState() async* {
    yield UnitIdleState();
  }

  Stream<UnitState> _mapUnitBattleState() async* {
    yield UnitBattleState();
  }

  @override
  Future<void> close() {
    _battleBlocSubscription.cancel();
    return super.close();
  }
}
