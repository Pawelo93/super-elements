import 'package:color_game/model/game_board.dart';
import 'package:equatable/equatable.dart';

enum Winner {
  PLAYER,
  COMPUTER,
  DRAW,
}

abstract class GameState extends Equatable {
  final GameBoard gameBoard;

  GameState(this.gameBoard, [List props = const []]) : super([gameBoard]..addAll(props));
}

class EmptyBoard extends GameState {
  EmptyBoard() : super(GameBoard.empty());

  @override
  String toString() {
    return 'EmptyBoard{gameBoard: $gameBoard}';
  }
}

class WaitingForPlayerMove extends GameState {
  WaitingForPlayerMove(GameBoard gameBoard) : super(gameBoard);

  @override
  String toString() {
    return 'WaitingForPlayerMove{gameBoard: $gameBoard}';
  }
}

class WaitingForComputerMove extends GameState {
  WaitingForComputerMove(GameBoard gameBoard) : super(gameBoard);

  @override
  String toString() {
    return 'WaitingForComputerMove{gameBoard: $gameBoard}';
  }
}

class InvalidMove extends GameState {
  InvalidMove(GameBoard gameBoard) : super(gameBoard);

  @override
  String toString() => 'InvalidMove{gameBoard: $gameBoard}';
}

class EndRound extends GameState {
  final Winner winner;

  EndRound(GameBoard gameBoard, this.winner): super(gameBoard, [winner]);

  @override
  String toString() {
    return 'EndRound{winner: $winner}';
  }
}

class EndGame extends GameState {
  final Winner winner;

  EndGame(GameBoard gameBoard, this.winner) : super(gameBoard, [winner]);

  @override
  String toString() {
    return 'EndGame{winner: $winner}';
  }
}
