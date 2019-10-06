import 'package:bloc/bloc.dart';
import 'package:color_game/bloc/game_event.dart';
import 'package:color_game/bloc/game_state.dart';
import 'package:color_game/model/game_board.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  @override
  GameState get initialState => EmptyBoard();

  @override
  Stream<GameState> mapEventToState(GameEvent event) async* {
    if (event is StartGame) {
      if (event.isPlayerStaring)
        yield WaitingForPlayerMove(GameBoard.empty());
      else
        yield WaitingForComputerMove(GameBoard.empty());
    }
  }
}
