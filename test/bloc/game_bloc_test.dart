import 'package:color_game/bloc/game/game_bloc.dart';
import 'package:color_game/bloc/game/game_event.dart';
import 'package:color_game/bloc/game/game_state.dart';
import 'package:color_game/model/game_board.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  GameBloc gameBloc;

  setUp(() {
//    gameBloc = GameBloc();
  });

  test('initial state is EmptyBoard', () {
    expect(gameBloc.state, EmptyBoard());
  });

  test(
      'set WaitingForPlayerMove when StartGame with isPlayerStarting true arrive',
      () {
    gameBloc.add(
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
    gameBloc.add(
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
