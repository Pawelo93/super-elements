import 'package:built_collection/built_collection.dart';
import 'package:color_game/domain/repositories/board_repository.dart';
import 'package:color_game/model/cell_item.dart';
import 'package:color_game/model/game_board.dart';

class BoardRepositoryImpl implements BoardRepository {
  GameBoard _gameBoard;

  @override
  GameBoard add(CellItem cellItem) {
    var list = _gameBoard.list.toList();
    bool alreadyContains = _gameBoard.containsCellItem(cellItem.x, cellItem.y);
    if (!alreadyContains) {
      list.add(cellItem);
      return GameBoard(BuiltList.from(list));
    } else
      return null;
  }

  @override
  GameBoard get() {
    return _gameBoard;
  }
}
