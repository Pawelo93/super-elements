import 'package:color_game/bloc/game/board_bloc.dart';
import 'package:color_game/bloc/game/board_event.dart';
import 'package:color_game/bloc/game/board_state.dart';
import 'package:color_game/model/game_board_impl.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  BoardBloc gameBloc;

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
        WaitingForPlayerMove(GameBoardImpl.empty()),
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
        WaitingForComputerMove(GameBoardImpl.empty()),
      ]),
    );
  });
}
