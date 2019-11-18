import 'package:built_collection/built_collection.dart';

import 'cell_item.dart';

class GameBoard {
  final width = 4;
  final size = 16;

  final BuiltList<CellItem> list;

  GameBoard(this.list);

  GameBoard.empty() : list = BuiltList.of([]);

  bool get isFull => list.length == size;

  bool containsCellItem(int x, int y) {
    for (final cellItem in list) {
      if (cellItem.x == x && cellItem.y == y) {
        return true;
      }
    }
    return false;
  }

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
      other is GameBoard && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}
