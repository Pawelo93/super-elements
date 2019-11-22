import 'dart:ui' as ui;

import 'package:color_game/bloc/board/board_bloc.dart';
import 'package:color_game/bloc/elements_chooser/elements_chooser_bloc.dart';
import 'package:color_game/bloc/round_counter/round_counter_bloc.dart';
import 'package:color_game/computerAI/computer_player.dart';
import 'package:color_game/domain/repositories/board_repository.dart';
import 'package:color_game/domain/repositories/elements_repository.dart';
import 'package:color_game/domain/winner_provider/winner_provider_impl.dart';
import 'package:color_game/game_manager.dart';
import 'package:color_game/repositories/board_repository_impl.dart';
import 'package:color_game/repositories/elements_repository_impl.dart';
import 'package:color_game/ui/elements_chooser.dart';
import 'package:color_game/ui/old_game_page/board.dart';
import 'package:color_game/ui/old_game_page/element_controller.dart';
import 'package:color_game/ui/old_game_page/field_value_controller.dart';
import 'package:color_game/ui/old_game_page/game_presenter.dart';
import 'package:color_game/ui/old_game_page/view.dart';
import 'package:color_game/ui/round_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'board_view.dart';

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

    final BoardRepository boardRepository = BoardRepositoryImpl();
    final ElementsRepository elementsRepository = ElementsRepositoryImpl();
    final WinnerProviderImpl winnerProvider = WinnerProviderImpl(elementsRepository);
    final secondPlayer = ComputerPlayer();
    final RoundCounterBloc roundCounterBloc = RoundCounterBloc();
    final ElementChooserBloc elementChooserBloc = ElementChooserBloc(elementsRepository);
    final BoardBloc boardBloc = BoardBloc(boardRepository, winnerProvider, secondPlayer, roundCounterBloc);
    final GameManager gameManager = GameManager(boardBloc, roundCounterBloc, elementChooserBloc, boardRepository);

    return MultiBlocProvider(
      providers: [
        BlocProvider<RoundCounterBloc>(
          builder: (context) => roundCounterBloc,
        ),
        BlocProvider<BoardBloc>(
          builder: (context) => boardBloc,
        ),
        BlocProvider<ElementChooserBloc>(
          builder: (context) => elementChooserBloc,
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.white30,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              _roundCounter(),
              _boardArea(gameManager),
              ElementsChooser(),
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

  Widget _boardArea(GameManager gameManager) {
    return SizedBox(
      height: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: BoardView(gameManager, widget.images),
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
