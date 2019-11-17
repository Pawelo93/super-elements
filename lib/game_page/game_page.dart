import 'package:color_game/bloc/elements_chooser/elements_chooser_bloc.dart';
import 'package:color_game/bloc/elements_chooser/elements_chooser_bloc.dart';
import 'package:color_game/bloc/game/game_bloc.dart';
import 'package:color_game/bloc/game/game_bloc.dart';
import 'package:color_game/bloc/round_counter/round_counter_bloc.dart';
import 'package:color_game/bloc/round_counter/round_counter_state.dart';
import 'package:color_game/game_page/view.dart';
import 'package:color_game/model/states/field_type.dart';
import 'package:color_game/ui/elements_chooser.dart';
import 'package:color_game/ui/round_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'board.dart';
import 'board_view.dart';
import 'element_controller.dart';
import 'field_value_controller.dart';
import 'game_presenter.dart';
import 'dart:ui' as ui;

class GamePage extends StatefulWidget {
  final Map<String, ui.Image> images;

  const GamePage({Key key, this.images}) : super(key: key);

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
    return MultiBlocProvider(
      providers: [
        BlocProvider<RoundCounterBloc>(
          builder: (context) => RoundCounterBloc(),
        ),
        BlocProvider<GameBloc>(
          builder: (context) => GameBloc(),
        ),
        BlocProvider<ElementChooserBloc>(
          builder: (context) => ElementChooserBloc(),
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              _roundCounter(),
              _boardArea(),
              ElementsChooser()
            ],
          ),
        ),
      ),
    );
  }

//  Future<Map<String, ui.Image>> _loadImages() async {
//    String asset = 'assets/comp.png';
//    ByteData data = await rootBundle.load(asset);
//    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
//    ui.FrameInfo fi = await codec.getNextFrame();
//    var map = Map<String, ui.Image>();
//    print('image ${fi.image}');
//    map['comp'] = fi.image;
//    return map;
//  }

  Widget _roundCounter() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: RoundCounter(),
    );
  }

  Widget _boardArea() {
    return SizedBox(
      height: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: BoardView(widget.images),
      ),
    );
//    _nextRound()
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
//    print('game state ${gamePresenter.gameState}');
//    if (gamePresenter.gameState == GameState.NEXT_ROUND_WON_PLAYER)
//      return _nextRoundButton("Player win!");
//    if (gamePresenter.gameState == GameState.NEXT_ROUND_WON_COMPUTER)
//      return _nextRoundButton("Computer win!");
//    if (gamePresenter.gameState == GameState.NEXT_ROUND_DRAW)
//      return _nextRoundButton("It is a draw!");
//    else
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