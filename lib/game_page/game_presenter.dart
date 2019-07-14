import 'dart:math';

import 'package:color_game/game_page/element_controller.dart';
import 'package:color_game/model/states/field_type.dart';
import 'package:color_game/model/states/game_state.dart';
import 'package:color_game/model/states/owner_type.dart';

import 'board.dart';
import 'view.dart';

class GamePresenter {
  final ElementController elementController;
  final board = Board();
  final View view;
  GameState gameState = GameState.GAME;

  GamePresenter(this.view, this.elementController);

  void changeState(int x, int y) {
    if (gameState != GameState.GAME) return;

    if(board.set(x, y, elementController.actualElement, OwnerType.PLAYER)) {
      view.updateView();
      _updateBoard();
    }
    if (gameState == GameState.GAME && !board.isFull())
      _computerMove();
  }

  reset() {
    board.clear();
    gameState = GameState.GAME;

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

    board.set(point.x, point.y, FieldType.WATER, OwnerType.COMPUTER);
    print('computer adds x ${point.x} y ${point.y} ');
    _updateBoard();
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
}
