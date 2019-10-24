import 'package:bloc/bloc.dart';
import 'package:color_game/bloc/game/game_event.dart';
import 'package:color_game/domain/winner_provider/winner_provider.dart';
import 'package:color_game/model/cell_item.dart';
import 'package:color_game/model/game_board.dart';
import 'package:color_game/domain/repositories/board_repository.dart';
import 'package:color_game/model/owner_type.dart';

import 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final BoardRepository boardRepository;
  final WinnerProvider winnerProvider;

  GameBloc(this.boardRepository, this.winnerProvider);

  @override
  GameState get initialState => EmptyBoard();

  @override
  Stream<GameState> mapEventToState(GameEvent event) async* {
    if (event is StartGame) {
      if (event.isPlayerStaring)
        yield WaitingForPlayerMove(GameBoard.empty());
      else
        yield WaitingForComputerMove(GameBoard.empty());
    } else if (event is PlayerMove) {
      yield _playerMove(event);
    } else if (event is ComputerMove) {
      yield _computerMove(event);
    }
  }

  GameState _playerMove(PlayerMove playerMove) {
    CellItem cellItem = CellItem(
      playerMove.x,
      playerMove.y,
      playerMove.fieldType,
      OwnerType.PLAYER,
    );
    GameBoard gameBoard = boardRepository.add(cellItem);
    if (gameBoard != null) {
      if (gameBoard.isFull) {
        Winner boardWinner = winnerProvider.provide(gameBoard);
        return EndRound(gameBoard, boardWinner);
      } else {
        return WaitingForComputerMove(gameBoard);
      }
    } else {
      return InvalidMove(gameBoard);
    }
  }

  GameState _computerMove(ComputerMove computerMove) {
    CellItem cellItem = CellItem(
      computerMove.x,
      computerMove.y,
      computerMove.fieldType,
      OwnerType.COMPUTER,
    );
    GameBoard gameBoard = boardRepository.add(cellItem);
    if (gameBoard != null) {
      if (gameBoard.isFull) {
        Winner boardWinner = winnerProvider.provide(gameBoard);
        return EndRound(gameBoard, boardWinner);
      } else {
        return WaitingForPlayerMove(gameBoard);
      }
    } else {
      return InvalidMove(gameBoard);
    }
  }
}
