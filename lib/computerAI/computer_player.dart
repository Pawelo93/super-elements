import 'dart:math';

import 'package:color_game/computerAI/second_player.dart';
import 'package:color_game/computerAI/second_player_move.dart';
import 'package:color_game/model/field_type.dart';
import 'package:color_game/model/game_board.dart';

class ComputerPlayer extends SecondPlayer {

  final random = Random();

  @override
  SecondPlayerMove findMove(GameBoard gameBoard) {
    int fieldTypeRandom = random.nextInt(2);
    BoardFieldType fieldType;
    switch(fieldTypeRandom) {
      case 0: fieldType = BoardFieldType.FIRE; break;
      case 1: fieldType = BoardFieldType.WATER; break;
      case 2: fieldType = BoardFieldType.AIR;
    }

    int x;
    int y;
    do {
      x = random.nextInt(4);
      y = random.nextInt(4);
      print('Looking for best move $x $y');
    }while(!gameBoard.isValidMove(x, y));

    return SecondPlayerMove(fieldType, x, y);
  }
}