import 'package:color_game/bloc/board/board_state.dart';

import '../../model/game_board_impl.dart';

abstract class WinnerProvider {

  Winner boardWinner(GameBoardImpl gameBoard);

  Winner gameWinner();

  void clear();
}