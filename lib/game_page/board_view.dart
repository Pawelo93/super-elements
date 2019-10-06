import 'package:flutter/material.dart';

import 'package:color_game/game_page/game_presenter.dart';
import 'board.dart';
import 'board_painter.dart';
import 'field_value_controller.dart';
import 'dart:ui' as ui;

class BoardView extends StatefulWidget {
  final GamePresenter gamePresenter;
  final Map<String, ui.Image> images;

  BoardView(this.gamePresenter, this.images);

  @override
  _BoardViewState createState() => _BoardViewState(gamePresenter, images);
}

class _BoardViewState extends State<BoardView> {
  final GamePresenter gamePresenter;
  final Map<String, ui.Image> images;
  FieldValueController fieldValueController = FieldValueController();

  _BoardViewState(this.gamePresenter, this.images);

  @override
  Widget build(BuildContext context) {
//    print('state');
//    if (gamePresenter.gameState == GameState.GAME ||
//        gamePresenter.gameState == GameState.NEXT_ROUND_WON_PLAYER ||
//        gamePresenter.gameState == GameState.NEXT_ROUND_WON_COMPUTER ||
//        gamePresenter.gameState == GameState.NEXT_ROUND_DRAW)
//      return _gameState();
//    else
      return _afterGameState();
  }

  Widget _gameState() {
    return GestureDetector(
      onTapDown: (details) {
        var point = (context.findRenderObject() as RenderBox)
            .globalToLocal(details.globalPosition);

        var size = (context.findRenderObject() as RenderBox).size.width -
            BoardPainter.pointsOffset;
        var cell = (size / Board.width);

        var x = ((point.dx - (point.dx % cell)) / cell).round();
        var y = ((point.dy - (point.dy % cell)) / cell).round();

        if(x > 3 || y > 3)
          return;
//        print('click on board game stat: ${gamePresenter.gameState}');
        print('click x $x y $y');
        gamePresenter.changeState(x, y);
      },
      child: CustomPaint(
        size: Size(
          MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height,
        ),
        painter: BoardPainter(gamePresenter.board, images),
      ),
    );
  }

  Widget _afterGameState() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Opacity(
          opacity: 0.3,
          child: Container(
            child: _gameState(),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _endGameState(),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: RaisedButton(
                color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Play Again!",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                onPressed: () => gamePresenter.reset(),
              ),
            ),
          ],
        ),
      ],
    );
  }

//  Widget _nextRound() {
//    if (gamePresenter.gameState == GameState.NEXT_ROUND)
//      return RaisedButton(
//        child: Text("Next round!"),
//      );
//  }

  Widget _endGameState() {
//    var text = "";
//    if (gamePresenter.gameState == GameState.COMPUTER_WON)
//      text = "Computer won!";
//    if (gamePresenter.gameState == GameState.PLAYER_WON) text = "Player won!";
//    if (gamePresenter.gameState == GameState.DRAW) text = "Draw!";
//
//    if (text != "")
//      return Text(
//        text,
//        style: TextStyle(fontSize: 40),
//      );
//    else
      return Container();
  }

  @override
  void updateView() {
    setState(() {});
  }
}
