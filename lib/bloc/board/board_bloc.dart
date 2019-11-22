import 'package:bloc/bloc.dart';
import 'package:color_game/bloc/round_counter/round_counter_bloc.dart';
import 'package:color_game/bloc/round_counter/round_counter_event.dart';
import 'package:color_game/bloc/round_counter/round_counter_state.dart';
import 'package:color_game/computerAI/second_player.dart';
import 'package:color_game/computerAI/second_player_move.dart';
import 'package:color_game/domain/repositories/board_repository.dart';
import 'package:color_game/domain/winner_provider/winner_provider.dart';
import 'package:color_game/model/cell_item.dart';
import 'package:color_game/model/game_board.dart';
import 'package:color_game/model/game_board_impl.dart';
import 'package:color_game/model/owner_type.dart';

import 'board_event.dart';
import 'board_state.dart';

class BoardBloc extends Bloc<BoardEvent, BoardState> {
  final BoardRepository boardRepository;
  final WinnerProvider winnerProvider;
  final SecondPlayer secondPlayer;
  final RoundCounterBloc roundCounterBloc;

  BoardBloc(this.boardRepository, this.winnerProvider, this.secondPlayer,
      this.roundCounterBloc);

  @override
  BoardState get initialState => EmptyBoard();

  @override
  Stream<BoardState> mapEventToState(BoardEvent event) async* {
    if (event is StartGame) {
      winnerProvider.clear();

      if (event.isPlayerStaring)
        yield WaitingForPlayerMove(GameBoardImpl.empty());
      else
        yield WaitingForComputerMove(GameBoardImpl.empty());
    } else if (event is PlayerMove && state is WaitingForPlayerMove) {
      var newGameState = _playerMove(event);
      yield newGameState;
      _makeMoveForComputer(newGameState.gameBoard);
    } else if (event is ComputerMove && state is WaitingForComputerMove) {
      yield _computerMove(event);
    }
  }

  BoardState _playerMove(PlayerMove playerMove) {
    CellItem cellItem = CellItem(
      playerMove.x,
      playerMove.y,
      playerMove.fieldType,
      OwnerType.PLAYER,
    );
    GameBoard gameBoard = boardRepository.add(cellItem);
    if (gameBoard != null) {
      if (gameBoard.isFull()) {
        Winner boardWinner = winnerProvider.boardWinner(gameBoard);
        RoundCounterState roundCounterState = roundCounterBloc.state;

        if (roundCounterState is Round &&
            roundCounterState.currentRound == roundCounterState.maxRounds) {
          Winner gameWinner = winnerProvider.gameWinner();
          return EndGame(gameBoard, gameWinner);
        } else {
          return EndRound(gameBoard, boardWinner);
        }
      } else {
        return WaitingForComputerMove(gameBoard);
      }
    } else {
      return InvalidMove(gameBoard);
    }
  }

  BoardState _computerMove(ComputerMove computerMove) {
    CellItem cellItem = CellItem(
      computerMove.x,
      computerMove.y,
      computerMove.fieldType,
      OwnerType.COMPUTER,
    );
    GameBoard gameBoard = boardRepository.add(cellItem);
    if (gameBoard != null) {
      if (gameBoard.isFull()) {
        Winner boardWinner = winnerProvider.boardWinner(gameBoard);
        return EndRound(gameBoard, boardWinner);
      } else {
        return WaitingForPlayerMove(gameBoard);
      }
    } else {
      return InvalidMove(gameBoard);
    }
  }

  _makeMoveForComputer(GameBoard gameBoard) {
    SecondPlayerMove move = secondPlayer.findMove(gameBoard);
    add(ComputerMove(move.boardFieldType, move.x, move.y));
  }
}
