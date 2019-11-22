import 'package:color_game/model/cell_item.dart';
import 'package:color_game/model/game_board.dart';

abstract class BoardRepository {

  GameBoard add(CellItem cellItem);

  GameBoard get();

  void clear();
}