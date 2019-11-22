import 'package:color_game/computerAI/second_player_move.dart';
import 'package:color_game/model/game_board.dart';

abstract class SecondPlayer {

  SecondPlayerMove findMove(GameBoard gameBoard);
}