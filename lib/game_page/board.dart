import 'dart:math';

import 'package:color_game/model/cell_item.dart';
import 'package:color_game/model/states/field_type.dart';
import 'package:color_game/model/states/owner_type.dart';

import 'field_value_controller.dart';

class Board {
  static final width = 4;
  static final size = width * width;
  List<CellItem> list;

  final FieldValueController fieldValueController;

  Board(this.fieldValueController) {
    this.list = List<CellItem>();
  }

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

  bool checkIfLineFinished() {}

  Point summary() {
    for (int i = 0; i < Board.width; i++) {
      for (int j = 0; j < Board.width; j++) {
        var cell = list[_getIndex(i, j)];
        if (cell == null) continue;

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

  OwnerType whoWonColumn(int column) {
    if (getPointsForColumn(column, OwnerType.PLAYER) == 0 &&
        getPointsForColumn(column, OwnerType.COMPUTER) == 0)
      return OwnerType.NO_OWNER;
    else if (getPointsForColumn(column, OwnerType.PLAYER) >
        getPointsForColumn(column, OwnerType.COMPUTER))
      return OwnerType.PLAYER;
    else
      return OwnerType.COMPUTER;
  }

  int getPointsForColumn(int column, OwnerType ownerType) {
    var points = 0;
    var cellInColumn = 0;

    for (final cellItem in list) {
      if (cellItem.x == column) {
        cellInColumn++;

        var cellPoints = fieldValueController.getValue(cellItem.fieldType);
        if (cellItem.ownerType == ownerType) points += cellPoints;
      }
    }

    if (cellInColumn == Board.width)
      return points;
    else
      return 0;
  }

  OwnerType whoWonRow(int row) {
    if (getPointsForRow(row, OwnerType.PLAYER) == 0 &&
        getPointsForRow(row, OwnerType.COMPUTER) == 0)
      return OwnerType.NO_OWNER;
    else if (getPointsForRow(row, OwnerType.PLAYER) >
        getPointsForRow(row, OwnerType.COMPUTER))
      return OwnerType.PLAYER;
    else
      return OwnerType.COMPUTER;
  }

  int getPointsForRow(int row, OwnerType ownerType) {
    var points = 0;
    var cellInRow = 0;

    for (final cellItem in list) {
      if (cellItem.y == row) {
        cellInRow++;

        var cellPoints = fieldValueController.getValue(cellItem.fieldType);
        if (cellItem.ownerType == ownerType) points += cellPoints;
      }
    }

    if (cellInRow == Board.width)
      return points;
    else
      return 0;
  }

  OwnerType getWinner() {
    List<OwnerType> owners = List();
    for (int i = 0; i < Board.width; i++) {
      owners.add(whoWonRow(i));
    }

    for (int i = 0; i < Board.width; i++) {
      owners.add(whoWonColumn(i));
    }

    var computerWins = 0;
    var playerWins = 0;

    for (final owner in owners) {
      if (owner == OwnerType.PLAYER)
        playerWins++;
      else if (owner == OwnerType.COMPUTER)
        computerWins++;
    }

    if (playerWins > computerWins)
      return OwnerType.PLAYER;
    else if (computerWins > playerWins)
      return OwnerType.COMPUTER;
    else
      return OwnerType.NO_OWNER;
  }

  void clean() {
    list.clear();
  }
}
