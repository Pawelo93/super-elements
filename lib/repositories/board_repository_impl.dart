import 'package:built_collection/built_collection.dart';
import 'package:color_game/domain/repositories/board_repository.dart';
import 'package:color_game/model/cell_item.dart';
import 'package:color_game/model/game_board_impl.dart';

class BoardRepositoryImpl implements BoardRepository {
  GameBoardImpl _gameBoard = GameBoardImpl.empty();

  @override
  GameBoardImpl add(CellItem cellItem) {
    var list = _gameBoard.list.toList();
    bool empty = _gameBoard.isValidMove(cellItem.x, cellItem.y);
    if (empty) {
      list.add(cellItem);
      _gameBoard = GameBoardImpl(BuiltList.from(list));
      return _gameBoard;
    } else
      return null;
  }

  @override
  GameBoardImpl get() {
    return _gameBoard;
  }

  @override
  void clear() {
    _gameBoard = GameBoardImpl.empty();
    print('LIST SIZE ${_gameBoard.list.length}');
  }
}
