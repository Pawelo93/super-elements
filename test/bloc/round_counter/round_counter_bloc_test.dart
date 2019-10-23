import 'package:color_game/bloc/round_counter/round_counter_bloc.dart';
import 'package:color_game/bloc/round_counter/round_counter_event.dart';
import 'package:color_game/bloc/round_counter/round_counter_state.dart';
import 'package:flutter_test/flutter_test.dart';

RoundCounterBloc bloc;

main() {
  setUp(() {
    bloc = RoundCounterBloc();
  });

  test('initial state is Uninitialized', () {
    expect(bloc.state, Uninitialized());
  });

  test('Setup change state to Round with proper rounds', () {
    bloc.add(Setup(3));
    expect(bloc.skip(1), emits(Round(3, 1)));
  });

  test('NextRound change state to Round with proper rounds', () {
    bloc.add(Setup(2));
    bloc.add(NextRound(2));
    expect(bloc.skip(1), emitsInOrder([Round(2, 1), Round(2, 2)]));
  });
}
