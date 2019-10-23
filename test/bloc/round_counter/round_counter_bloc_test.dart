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

  test('setup change state to Round with proper rounds', () {
    bloc.add(Setup(3));
    expect(bloc.state, emitsInOrder([Uninitialized(), Round(3, 1)]));
  });
}
