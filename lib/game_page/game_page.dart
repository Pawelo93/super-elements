import 'package:color_game/game_page/view.dart';
import 'package:color_game/model/states/field_type.dart';
import 'package:color_game/model/states/game_state.dart';
import 'package:flutter/material.dart';

import 'board.dart';
import 'board_view.dart';
import 'element_controller.dart';
import 'field_value_controller.dart';
import 'game_presenter.dart';

class GamePage extends StatefulWidget {
  final String title;

  GamePage(this.title);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> implements View {
  ElementController elementController = ElementController();
  FieldValueController fieldValueController = FieldValueController();
  Board board;
  GamePresenter gamePresenter;

  _GamePageState() {
    board = Board(fieldValueController);
    gamePresenter = GamePresenter(this, board, elementController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              "${gamePresenter.round}/${gamePresenter.maxRounds}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: BoardView(gamePresenter),
            ),
          ),
          _nextRound(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _fireButton(),
              _waterButton(),
              _airButton(),
            ],
          )
        ],
      ),
    );
  }

  Widget _fireButton() {
    return GestureDetector(
      onTap: () => setState(() {
        elementController.setFire();
      }),
      child: SizedBox(
        width: 70,
        height: 70,
        child: _fill(
          elementController.actualElement != FieldType.FIRE,
          Colors.red,
        ),
      ),
    );
  }

  Widget _waterButton() {
    return GestureDetector(
      onTap: () => setState(() {
        elementController.setWater();
      }),
      child: SizedBox(
        width: 70,
        height: 70,
        child: _fill(
          elementController.actualElement != FieldType.WATER,
          Colors.blue,
        ),
      ),
    );
  }

  Widget _airButton() {
    return GestureDetector(
      onTap: () => setState(() {
        elementController.setAir();
      }),
      child: SizedBox(
        width: 70,
        height: 70,
        child: _fill(
          elementController.actualElement != FieldType.AIR,
          Colors.cyanAccent,
        ),
      ),
    );
  }

  Widget _fill(bool filled, Color color) {
    if (filled)
      return Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: color,
            width: 8,
          ),
        ),
      );
    else
      return Container(
        color: color,
      );
  }

  Widget _nextRound() {
    print('game state ${gamePresenter.gameState}');
    if (gamePresenter.gameState == GameState.NEXT_ROUND_WON_PLAYER)
      return _nextRoundButton("Player win!");
    if (gamePresenter.gameState == GameState.NEXT_ROUND_WON_COMPUTER)
      return _nextRoundButton("Computer win!");
    if (gamePresenter.gameState == GameState.NEXT_ROUND_DRAW)
      return _nextRoundButton("It is a draw!");
    else
      return Container();
  }

  Widget _nextRoundButton(String winner) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Column(
          children: <Widget>[
            Text(winner),
            RaisedButton(
              onPressed: () => gamePresenter.nextRound(),
              child: Text(
                "Next round!",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void updateView() {
    setState(() {});
  }
}
