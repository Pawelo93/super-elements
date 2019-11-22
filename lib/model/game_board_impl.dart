import 'package:built_collection/built_collection.dart';
import 'package:color_game/model/game_board.dart';

import 'cell_item.dart';

class GameBoardImpl extends GameBoard {
  final width = 4;
  final size = 16;

  final BuiltList<CellItem> list;

  GameBoardImpl(this.list);

  GameBoardImpl.empty() : list = BuiltList.of([]);

  bool isFull() {
    print('length ${list.length} $size');

    return list.length == size;
  }

  @override
  bool isValidMove(int x, int y) {
    for (final cellItem in list) {
      if (cellItem.x == x && cellItem.y == y) {
        return false;
      }
    }
    return true;
  }

  @override
  CellItem get(int x, int y) {
    for (final cellItem in list) {
      if (cellItem.x == x && cellItem.y == y) {
        return cellItem;
      }
    }
    return null;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GameBoardImpl && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;

  @override
  String toString() {
    return "GameBoard {width: $width}";
  }
}
