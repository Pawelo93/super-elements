import 'package:color_game/bloc/game_bloc.dart';
import 'package:color_game/bloc/game_event.dart';
import 'package:color_game/bloc/game_state.dart';
import 'package:color_game/model/game_board.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  GameBloc gameBloc;

  setUp(() {
    gameBloc = GameBloc();
  });

  test('initial state is EmptyBoard', () {
    expect(gameBloc.currentState, EmptyBoard());
  });

  test(
      'set WaitingForPlayerMove when StartGame with isPlayerStarting true arrive',
      () {
    gameBloc.dispatch(
      StartGame(isPlayerStaring: true),
    );
    expect(
      gameBloc.state,
      emitsInOrder([
        EmptyBoard(),
        WaitingForPlayerMove(GameBoard.empty()),
      ]),
    );
  });

  test(
      'change state to WaitingForComputerMove when StartGame with isPlayerStarting false arrive',
      () async {
    gameBloc.dispatch(
      StartGame(isPlayerStaring: false),
    );
    expect(
      gameBloc.state,
      emitsInOrder([
        EmptyBoard(),
        WaitingForComputerMove(GameBoard.empty()),
      ]),
    );
  });
}
