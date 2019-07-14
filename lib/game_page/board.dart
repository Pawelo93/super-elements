import 'dart:math';

import 'package:color_game/model/cell_item.dart';
import 'package:color_game/model/states/field_type.dart';
import 'package:color_game/model/states/owner_type.dart';

class Board {
  static final width = 4;
  static final size = width * width;
  List<CellItem> list;
  List<CellItem> done;

  Board() {
    this.list = List<CellItem>();
    clear();
  }

  final lines = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ];

  bool set(int x, int y, FieldType fieldType, OwnerType ownerType) {
    if (!_containsCellItem(x, y)) {
      list.add(CellItem(x, y, fieldType, ownerType));
      return true;
    }
    return false;
  }

  bool _containsCellItem(int x, int y) {
    for (final cellItem in list) {
      if (cellItem.x == x && cellItem.y == y) {
        return true;
      }
    }
    return false;
  }

//
//  void setIdx(int idx, FieldType fieldState) {
//    _list[idx] = fieldState;
//  }
//
//  FieldState get(int x, int y) {
//    return _list[_getIndex(x, y)];
//  }
//
  CellItem get(int x, int y) {
    for (final cellItem in list) {
      if (cellItem.x == x && cellItem.y == y) {
        return cellItem;
      }
    }
    return null;
  }

  int _getIndex(int x, int y) => x * width + y;

  bool isFull() {
    return list.length == Board.size;
  }

  bool checkIfLineFinished() {

  }

  Point summary() {
    for(int i = 0; i<Board.width; i++ ) {
      for(int j = 0;j <Board.width; j++) {
        var cell = list[_getIndex(i, j)];
        if(cell == null)
          continue;


//        if(cell != null)

      }

      return null;
    }
//    for (final cellItem in list) {
//      if (cellItem.x == x && cellItem.y == y) {
//        return cellItem;
//      }
//    }
  }

//  bool playerWon() => _checkIfWon(FieldType.X);
//
//  bool computerWon() => _checkIfWon(FieldType.O);
//
//  bool _checkIfWon(FieldType state) {
////    for (int i = 0; i < lines.length; i++) {
////      if (getIdx(lines[i][0]) == state &&
////          getIdx(lines[i][1]) == state &&
////          getIdx(lines[i][2]) == state) {
////        return true;
////      }
////    }
//    return false;
//  }

  void clear() {
//    list.map((index) => CellItem(0, 0, FieldType.EMPTY));
  }
}
