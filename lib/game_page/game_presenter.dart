import 'dart:math';

import 'package:color_game/game_page/element_controller.dart';
import 'package:color_game/model/states/field_type.dart';
import 'package:color_game/model/states/owner_type.dart';

import 'board.dart';
import 'view.dart';

class GamePresenter {
  final ElementController elementController;
  final board;
  final View view;
//  GameState gameState = GameState.GAME;

  List<OwnerType> winners = List();
  var round = 1;
  var maxRounds = 3;

  GamePresenter(this.view, this.board, this.elementController);

  void changeState(int x, int y) {
//    if (gameState != GameState.GAME) return;

    if (board.set(x, y, elementController.actualElement, OwnerType.PLAYER)) {
      view.updateView();
      _updateBoard();

      // check if next round

      print('Board is full ${board.isFull()}');
      _checkIfWin();

//      if (gameState == GameState.GAME && !board.isFull()) _computerMove();
    }
  }

  reset() {
    board.clean();
//    gameState = GameState.GAME;
    round = 1;
    winners.clear();

    print('reset done!');
    _updateBoard();
  }

  void _computerMove() {
    Point point;

    while (point == null) {
      var randomX = Random().nextInt(Board.width);
      var randomY = Random().nextInt(Board.width);
      var cell = board.get(randomX, randomY);

      if (cell == null || cell.fieldType == FieldType.EMPTY)
        point = Point(randomX, randomY);
    }

    FieldType element;
    var randomElement = Random().nextInt(3);
    if(randomElement == 0)
      element = FieldType.FIRE;
    else if(randomElement == 1)
      element = FieldType.WATER;
    else if(randomElement == 2)
      element = FieldType.AIR;

    board.set(point.x, point.y, element, OwnerType.COMPUTER);
    _checkIfWin();
    _updateBoard();
  }

  void _checkIfWin() {
    if (board.isFull()) {
      if (round == 3) {
        var winner = board.getWinner();
        winners.add(winner);
        setWinnerState();
      }
      else {
        _checkIfNextRound();
      }
    }
  }
  void _updateBoard() {
//    if()

//    if (board.playerWon()) {
//      gameState = GameState.PLAYER_WON;
//    } else if (board.computerWon()) {
//      gameState = GameState.COMPUTER_WON;
//    } else if (board.isFull()) {
//      gameState = GameState.DRAW;
//    }

    view.updateView();
  }

  void _checkIfNextRound() {
    var winner = board.getWinner();
    winners.add(winner);
//    if (winner == OwnerType.PLAYER) gameState = GameState.NEXT_ROUND_WON_PLAYER;
//    if (winner == OwnerType.COMPUTER)
//      gameState = GameState.NEXT_ROUND_WON_COMPUTER;
//    else if (winner == OwnerType.NO_OWNER)
//      gameState = GameState.NEXT_ROUND_DRAW;

    _updateBoard();
  }

  nextRound() {
    if (round < maxRounds) {
      view.updateView();
//      if (round == 1) {
//        gameState = GameState.GAME;
//      } else if (round == 2) {
//        gameState = GameState.GAME;
//      }

      round++;
      board.clean();
    }
  }

  setWinnerState() {
//    if (findWinner() == OwnerType.COMPUTER)
//      gameState = GameState.COMPUTER_WON;
//    else if (findWinner() == OwnerType.PLAYER)
//      gameState = GameState.PLAYER_WON;
//    else
//      gameState = GameState.DRAW;
  }

  OwnerType findWinner() {
    if (winners[0] == winners[1])
      return winners[0];
    else if (winners[0] == winners[2])
      return winners[0];
    else if (winners[1] == winners[2])
      return winners[1];
    else
      return OwnerType.NO_OWNER;
  }
}
