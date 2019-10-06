import 'package:color_game/bloc/game_bloc.dart';
import 'package:color_game/bloc/game_state.dart';
import 'package:flutter_test/flutter_test.dart';

class GameBlocTest {

  GameBloc gameBloc = GameBloc();

  main() {
    test('initial state is EmptyBoard', () {
      expect(gameBloc.currentState, EmptyBoard);
    });
  }
}
