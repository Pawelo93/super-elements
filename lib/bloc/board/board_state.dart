import 'package:color_game/model/game_board.dart';
import 'package:color_game/model/game_board_impl.dart';
import 'package:equatable/equatable.dart';

enum Winner {
  PLAYER,
  COMPUTER,
  DRAW,
}

abstract class BoardState extends Equatable {
  final GameBoard gameBoard;

  BoardState(this.gameBoard, [List props = const []]) : super([gameBoard]..addAll(props));
}

class EmptyBoard extends BoardState {
  EmptyBoard() : super(GameBoardImpl.empty());

  @override
  String toString() {
    return 'EmptyBoard{gameBoard: $gameBoard}';
  }
}

class WaitingForPlayerMove extends BoardState {
  WaitingForPlayerMove(GameBoard gameBoard) : super(gameBoard);

  @override
  String toString() {
    return 'WaitingForPlayerMove{gameBoard: $gameBoard}';
  }
}

class WaitingForComputerMove extends BoardState {
  WaitingForComputerMove(GameBoard gameBoard) : super(gameBoard);

  @override
  String toString() {
    return 'WaitingForComputerMove{gameBoard: $gameBoard}';
  }
}

class InvalidMove extends BoardState {
  InvalidMove(GameBoard gameBoard) : super(gameBoard);

  @override
  String toString() => 'InvalidMove{gameBoard: $gameBoard}';
}

class EndRound extends BoardState {
  final Winner winner;

  EndRound(GameBoard gameBoard, this.winner): super(gameBoard, [winner]);

  @override
  String toString() {
    return 'EndRound{winner: $winner}';
  }
}

class EndGame extends BoardState {
  final Winner winner;

  EndGame(GameBoard gameBoard, this.winner) : super(gameBoard, [winner]);

  @override
  String toString() {
    return 'EndGame{winner: $winner}';
  }
}
